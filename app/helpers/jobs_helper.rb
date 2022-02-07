module JobsHelper
    # Checks if current user is creater of this job
    # If yes, returns true. Else false
    def is_job_owner?(job_user_id)
        return job_user_id == current_user.id
    end

    # Checkes if user has already applied for same job.
    # If it finds record in database, returns true else false
    def is_already_applied?(job_id)
        is_already_applied = UserAppliedJob.where(["user_id = ? and job_id = ?", current_user.id, job_id])
        if is_already_applied.blank?
             return false
        else
            return true
        end
    end

end
