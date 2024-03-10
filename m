Return-Path: <jailhouse-dev+bncBD3K5AHD5QFRBNH7W6XQMGQEXAQ76WY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x53d.google.com (mail-pg1-x53d.google.com [IPv6:2607:f8b0:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E30287780B
	for <lists+jailhouse-dev@lfdr.de>; Sun, 10 Mar 2024 19:45:11 +0100 (CET)
Received: by mail-pg1-x53d.google.com with SMTP id 41be03b00d2f7-5e4a072ce28sf3732802a12.0
        for <lists+jailhouse-dev@lfdr.de>; Sun, 10 Mar 2024 11:45:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1710096309; cv=pass;
        d=google.com; s=arc-20160816;
        b=fds3jAVdnLmQftUq7lUpCuhdeYPRviej+LWHBd2GemovlGLswAtY9VE/VLkLauf2l/
         i3qLn0RacS6kXozt/sFKp5h1Kk4o/mlKEghYTFlqAvFNYHuxQePSIP8s+F9w9pqUqo9U
         /nqntsOr+gP04oecXI90+YWPGhlHhaY1wAVUytZhSozkppViVjOPlHQevf6IiazmleKW
         Jzuaot/7c6fMwLLPzwD7SA09qeKYaye9UP5mzJ49Du1eRHEXhzXRxYTmeRLKUxqAcoas
         0uyNN1n6EA+T8387SDE6KZngGpHiJg1rLqPqGi7avWD7lPkkwRu7AEz5qrWh1TgtD6zO
         rtjw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=e+bK2L5jS5pvEFXPRVtdQGMfoQzI83/AmEjmp/EdbHo=;
        fh=zpFgzBGCKy/S37hm7hGvLZTjaHUKalqGjg5w4Xj1ISY=;
        b=EyLGclyEJff8u/63WGrp47F4xIKKzKNR0ZmPI5NU/ndyQhCCHFumKIP2oeeUAL+hyb
         OfJ+GUAkaSG1q7j5OFwc9MbrZy9SmZ3HbsnVgoGohRqn5M3l2gpwJH3FU4njmtQXTubc
         LFchjWqXFvrKjlwbzbLkYMGy81t9UYyr5D2CNnMgyLtXhtbPJEBrLXhWgjIZkGDRJkom
         IqIqjV/oJsEmEr33p0ZTP8lQGK9rQMfRU7H9dDJGMyUiUTvrQ3TDM++MyTkpFA4ouJC0
         B3t5SffaeG7J+oZXLegTqPoVuLBXrEK0McgdmXXqoDq/FON7ChJDWGwimF/bBf57kHgG
         oOJg==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=btMkEjZm;
       spf=pass (google.com: domain of microsys.brendjes@gmail.com designates 2607:f8b0:4864:20::335 as permitted sender) smtp.mailfrom=microsys.brendjes@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1710096309; x=1710701109; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:subject:message-id:date:from:mime-version
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=e+bK2L5jS5pvEFXPRVtdQGMfoQzI83/AmEjmp/EdbHo=;
        b=F8D3j11H6HXpZrrodg0U0Obc+n3VsACMeMw7fCkUCLLWsC3n8zckiN5QkBbF9E014X
         uXvfr9vBefMFKwCMmxDIQDRQjy2UjgoXX9mgRoL29Z22Tue7k2by0LUBeXwNtfmPF6hw
         n56DiO65i1LU5qlchdeUR6mrBLqC7OZgPS74qQw43Yn+Iq+0FFXUP6noQyW67drQJ0M6
         wYBo4DhNdHKZpfXGRWSEGfjsbdY9CspI6X3lWXXWd5z23x9Pxrjq8pcPhZhj7HC42a9X
         sPdjZVC3K0bZ9bwhnHyEBvMamSAXi1QvjeLtt1pw8GGmK2v5Fpq9e3Z0IwGxnEEej+WE
         2c4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710096309; x=1710701109; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e+bK2L5jS5pvEFXPRVtdQGMfoQzI83/AmEjmp/EdbHo=;
        b=M55W3s7KMDZl4QXPzm9C8Sro5oFOeYcbew5pzl9FfZSGCZdsgLYrldOpx5sI8DyLLz
         ozXnsA4/ZwQg95BA74yj+hJnfV/NJFuiHDhg+CxPwLOPDMmrkD6rsyqwvNjKjkdPcZYS
         POrgfjYzaPJjtLELFP2nOfEE4ct1RtLFudRjCj/Mfx8SrJMl5sSC306aqbxzuxu8Gm9e
         OPY4M2oDzwDJp6zkM3OKMsDd5cqGtHz6aqmItYircIDk+NL8ZHfuZmHqUEhb6X7qHCpW
         0mtLCbf1rjLQIC0E5xGphX2lUotzR4froWAd05mdLkb5T8F4CLMrj8yc0Ww2lJfumtBW
         Krzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710096309; x=1710701109;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:to:subject
         :message-id:date:from:mime-version:x-beenthere:x-gm-message-state
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=e+bK2L5jS5pvEFXPRVtdQGMfoQzI83/AmEjmp/EdbHo=;
        b=qhsyt8V+qQllg+OljehI/pBoY70qIAtQyaiy9PSCDDUAyRVb06pmi0TqIhDhfeEzwe
         AsL8QNdwV9yMeIlPgbc/tNjgaVSg3l5LuGXck49wvt374ba+VeY9h/ByIKTNS2F6bsVn
         ISZ4GBQW7lDrY74FniCJStfviPhtjNrZ54O1GzOd1U1fquYaTftU1lSDLUKeZeitgmjG
         r56hqjbAcGPFMTTCB/lrba+XwqOLsgjMO8ppXEg8Un3txnfBpCiYZFNu7Kqr6fMTU2eO
         TvEStcLRr6w6hXO+o8yVqUTdm2d2saky4GwvDIgPVgANRPhcFCmQhVZJZeg+I1BKNMo8
         XIvA==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=2; AJvYcCUlv5ScK3V9HGTOfdmSTInXuOV+Q6fXjyYuh3kmUk8yaKUmL1X2udEqLPXwFER6lAesmZSYlYnvWdLTpt2OlJajWv8ZwcF5ml28kYg=
X-Gm-Message-State: AOJu0Yz1R26r80iNkX5lQ3wm6r6+1qPtJ25t/LLgSJ8JlzFm3wqk1FEw
	UsrlA6+jE+q4nxzN1wT0bIvttPD16e5ExM/cuHr8KSxBd4s0C+kO
X-Google-Smtp-Source: AGHT+IGbLse95EMN6y+FhHjBhprVuBTQhM68GqHyaIDJYfz9xR2d7Kf2UZxJNkznQxeD6VYPY/hS0A==
X-Received: by 2002:a05:6a21:328f:b0:1a1:8cb2:f23c with SMTP id yt15-20020a056a21328f00b001a18cb2f23cmr6360023pzb.43.1710096309122;
        Sun, 10 Mar 2024 11:45:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:d304:b0:29b:e0dc:6d14 with SMTP id
 p4-20020a17090ad30400b0029be0dc6d14ls651028pju.0.-pod-prod-06-us; Sun, 10 Mar
 2024 11:45:07 -0700 (PDT)
X-Received: by 2002:a05:6a20:4d9b:b0:1a1:2793:a386 with SMTP id gj27-20020a056a204d9b00b001a12793a386mr4472745pzb.19.1710096307273;
        Sun, 10 Mar 2024 11:45:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710096307; cv=none;
        d=google.com; s=arc-20160816;
        b=SakchZTorg6pDTWWytG/9CW083qkw4abNcUhdV+KGpd44MXaLXDvYIaZuuLkRimaDJ
         gWnFgy4dXP4u3UPpX7FT6v271nZIotweeRek7EoqG6uaVNc7EjQkyzj+ij+w0TRi50UC
         L/E6grbWVOMfgawLadLUWjgLby14NcAae5VkDhTogGOsLtLZ7QMcd8mDeZHoPvHdKUSE
         6wqPEurHABPm3XBfmFEii+PZ9X/jYct8QwuxGYJ7MQMbaDxP69HZeuU1Ouj7SAv/TUN7
         rx6giCZbufFotHeZjiKMER8YW3Ci1PJgcOO9xtSiUMGqwf3RrLz/vrzCSFUGtiETWCaz
         J40w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=9W8Cia1WWLHE7NoU9rvh+vAHRa3HJFbNdgjpYp77txY=;
        fh=2tQzQ7BDCTqJm82PDY7f/SoNACc8xWmtm+Icohy5zLg=;
        b=KuM0XUw6ZKPVuFq+cJQHaA2T8TFverg/TwHEbxGN+8RF+yYNIVCUbdyOEHrW5uX6DY
         d1rMDidSeBqvW6m5KFSVEwiaD6fdf2sgGJini0qCTHoyjTUXmo00B9LMCfbyEu9kXz+b
         nPdz9ETGNUZ/GLUmGB6FJ5OI/fVZbTrbSmct0w4q5RI8lJ5dH7ODPhNnG5bPL3Be1lP8
         gaTLW5rBFR7c0MI/GArono8RvzjgExDRk2TpjIiW5UPZ0PbWFc7LwZABIUHTtOdDlqtp
         NLChHMIUrsmkDeyr0UQuXz4fVQl4LheSWdUM44eakj0rE2h/Bu0JI1OESxhVjyJimGIH
         949w==;
        dara=google.com
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=btMkEjZm;
       spf=pass (google.com: domain of microsys.brendjes@gmail.com designates 2607:f8b0:4864:20::335 as permitted sender) smtp.mailfrom=microsys.brendjes@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com. [2607:f8b0:4864:20::335])
        by gmr-mx.google.com with ESMTPS id c26-20020a630d1a000000b005e4310c3b74si402779pgl.5.2024.03.10.11.45.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Mar 2024 11:45:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of microsys.brendjes@gmail.com designates 2607:f8b0:4864:20::335 as permitted sender) client-ip=2607:f8b0:4864:20::335;
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-6e515dc7bd7so803410a34.3
        for <jailhouse-dev@googlegroups.com>; Sun, 10 Mar 2024 11:45:07 -0700 (PDT)
X-Received: by 2002:a9d:6f85:0:b0:6e5:2f31:ac3b with SMTP id
 h5-20020a9d6f85000000b006e52f31ac3bmr728280otq.14.1710096306380; Sun, 10 Mar
 2024 11:45:06 -0700 (PDT)
MIME-Version: 1.0
From: Stefan Brendjes <microsys.brendjes@gmail.com>
Date: Sun, 10 Mar 2024 19:44:49 +0100
Message-ID: <CAKwKV225wXqQy1Z=kR4wPib6m9xreB+=H4kQFTfaJPydUxuDSg@mail.gmail.com>
Subject: Join
To: jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="000000000000dfa31e061352d298"
X-Original-Sender: microsys.brendjes@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20230601 header.b=btMkEjZm;       spf=pass
 (google.com: domain of microsys.brendjes@gmail.com designates
 2607:f8b0:4864:20::335 as permitted sender) smtp.mailfrom=microsys.brendjes@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

--000000000000dfa31e061352d298
Content-Type: text/plain; charset="UTF-8"

Subscribe

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAKwKV225wXqQy1Z%3DkR4wPib6m9xreB%2B%3DH4kQFTfaJPydUxuDSg%40mail.gmail.com.

--000000000000dfa31e061352d298
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Subscribe</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAKwKV225wXqQy1Z%3DkR4wPib6m9xreB%2B%3DH4kQFTfaJPy=
dUxuDSg%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://gr=
oups.google.com/d/msgid/jailhouse-dev/CAKwKV225wXqQy1Z%3DkR4wPib6m9xreB%2B%=
3DH4kQFTfaJPydUxuDSg%40mail.gmail.com</a>.<br />

--000000000000dfa31e061352d298--
