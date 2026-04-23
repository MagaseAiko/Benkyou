-- Enable RLS on user_daily_activity table
ALTER TABLE public.user_daily_activity ENABLE ROW LEVEL SECURITY;

-- Allow authenticated users to insert their own activity records
CREATE POLICY "Users can insert their own daily activity" ON public.user_daily_activity
FOR INSERT WITH CHECK (auth.uid() = user_id);

-- Allow authenticated users to view their own activity records
CREATE POLICY "Users can view their own daily activity" ON public.user_daily_activity
FOR SELECT USING (auth.uid() = user_id);

-- Allow authenticated users to update their own activity records
CREATE POLICY "Users can update their own daily activity" ON public.user_daily_activity
FOR UPDATE USING (auth.uid() = user_id);

-- Allow authenticated users to insert their own profile
CREATE POLICY "Users can insert their own profile" ON public.profiles
FOR INSERT WITH CHECK (auth.uid() = id);

-- Allow authenticated users to view their own profile
CREATE POLICY "Users can view their own profile" ON public.profiles
FOR SELECT USING (auth.uid() = id);

-- Allow authenticated users to update their own profile streak data
CREATE POLICY "Users can update their own profile" ON public.profiles
FOR UPDATE USING (auth.uid() = id);