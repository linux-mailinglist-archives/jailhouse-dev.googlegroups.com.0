Return-Path: <jailhouse-dev+bncBDL3L7ML6AHRB6PEXSHAMGQE5CZ2L2Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc3e.google.com (mail-oo1-xc3e.google.com [IPv6:2607:f8b0:4864:20::c3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC75482532
	for <lists+jailhouse-dev@lfdr.de>; Fri, 31 Dec 2021 17:40:27 +0100 (CET)
Received: by mail-oo1-xc3e.google.com with SMTP id x65-20020a4a4144000000b002daa05165cfsf13285143ooa.19
        for <lists+jailhouse-dev@lfdr.de>; Fri, 31 Dec 2021 08:40:27 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1640968825; cv=pass;
        d=google.com; s=arc-20160816;
        b=Un7ZW6L8YcJ6AZtcTNpS9EQpsPdJHWO/v7CRrUuGpgBfM8nlKWLZzBQTO5cZbqJc5+
         0n833y/zQOOtrBhDEmICUFJ/Z93b7easqiuuRy5pHWs7XSD7LhK9ydyuDrcXak26aKPW
         +TlVwq0/aUUvTcPtB++JwbhK/2VJS75adoXSKslz9PDCzHWXcP9VZkmZXlwHrk1tMV6C
         1CbJpicf2kL905CJytgpATOF5Ihb+UoPucP2RA8TdXpQHiW8x6QjOkVjCsiJNzMpzKlZ
         rYj6pQPUHRtlzjHdJzkPMV95eOvt7NfWNuwnz7lpjTwWAf6UsCGfWYQHPXsKd5bExlJ8
         EDeQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=st8qw8yITjp8i1Kx0JOQShSO98UEW1+5BLW91jswjEE=;
        b=bNnlfH0ggdjx+/ut+KpMk2+63UEsI1qqR0FiDqVI43A1VVAGCwhG4eoeNw/1h+MxmI
         w6Z9pP3A28npSpln5gLGlZ6RxDpO7fFh09V7pGyqCYTGu4OZUebbUPHqMza7LbkrFPzh
         rGdLoWlXte2LvUm9SqSH8GjPFSeCekRlToz8fxrROrrchhOJ1TGvTSmmC7IdqN6JQi2g
         Ydop3yg5jxfVYUnEpo1NR7nG0hbCT13xTFehIGEc4/wU+ye31FBH04H+yCO91Sv+cljY
         vpI98g1PYKLH2F+jv6PB17914pcAUgwsQLg8l3tXc3Wdo+suuY3tMqhvTfgOREKpv9Jv
         89jg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=XT4p3MaI;
       spf=pass (google.com: domain of alphamballo50@gmail.com designates 2607:f8b0:4864:20::b2e as permitted sender) smtp.mailfrom=alphamballo50@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=st8qw8yITjp8i1Kx0JOQShSO98UEW1+5BLW91jswjEE=;
        b=OfBVlzXobaRpQ1XWX9tiZTiNof07YZHpRQonAlRfldzblpEdwYlaEUB4jngT/7zAGN
         0GdWFL30y9+tbGHGt5l9kweCguwXz22s3V5WPiaHOlM20yUpyCMrHrSsYWmLJNBQUxqJ
         YVYCTOBtV2l66IYKe/TnNU3kz6/kE0WomHFYg92nXJ5KAaQac+BQ5vU0KSN9pTfkOO+i
         KNvgJ2+TLnrDgbFgqhnbhSL/JoIaV2HPH+CyMpsMNwJfpjLFllfA6xy9N/jCNfaCoQBR
         6LR8tFd7RIRuhUYnKG6ZyEPynoB+BNaYHSccXjV2sIP0pIu9utPwmORuKcOKRREdHOxB
         vPVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=st8qw8yITjp8i1Kx0JOQShSO98UEW1+5BLW91jswjEE=;
        b=UlLAqsD5OnyPr3qQKt2p9ZARMvCfuFNRXWX4zag0VSGS67X7RgDcpmUXq8hJ/JuWAf
         hjzVqsOLlDSXgOGoGoSpjSBFwzY9+DiXOztByxJDRRjwP3Tw3dyM+OVlPm//O3/Ts++v
         FvYSGvY0KZ2pKHB0TdcnWBwWs8N9SxfwzCgk/B1pB4Kb4m3Ym64nCH1J6rdxY2t75iO0
         kU+GZT6m446zCXC1McC35kNe5Ps0qkEJD5VsB0oCzklWNSxYRSPt3eB8g6riNVwC27oo
         zmNb9Uw//gQXFoBbW4VdkO8Qgb3Zn7chPFEzc9X98p/kWsJpLMJQUzmA+8jOmauIPr/s
         Tjpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=st8qw8yITjp8i1Kx0JOQShSO98UEW1+5BLW91jswjEE=;
        b=hplh2wDgQIkIE9Q5bwtZPu7dYJN2rx+1VQHRPJt/lnBS0eLNUS4Wtvg2P0TcB8Qwhu
         SUzuEB7LyAzsCiJKreX0SWOs+PHF6UYMuL/m9snlB3Z/I5OgdbQTvr54HhZxhnK4EI3w
         Y5J6dUo13Hz3lrPtfyaxoeDjmaUm0uD/pajnoflzhapmgdJ6D4l8/q0xtCQEWn48Glgt
         2f2JTwM43ra7U+GsXolBig+mc42N3uED1XkUCVhyrhDYm55i6BGIy8rJFtPrm2IeQk05
         vFqlJVr11WQEtLD50HxbssN9UFHl6J1dk5bi8m69POr8g6C7OqBIlV6+mbwGl9cI6nCl
         C/bg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530RIa+wawZQMpuENPd0qEl+Xe6yAnlGJ/7lpmebXpUowRItmNQz
	QILUCnJvrcbLZDjjvlG2Vfs=
X-Google-Smtp-Source: ABdhPJwMOMPSSy6zF1FLXkdxpr5Mwfej/up7i78wYTfe4L7OE+B0TeybLXkUf9o1lHJMdeyCwPb8DQ==
X-Received: by 2002:a05:6808:14c4:: with SMTP id f4mr28508906oiw.76.1640968825811;
        Fri, 31 Dec 2021 08:40:25 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6808:1996:: with SMTP id bj22ls5056649oib.5.gmail; Fri,
 31 Dec 2021 08:40:25 -0800 (PST)
X-Received: by 2002:aca:b1d7:: with SMTP id a206mr28106024oif.29.1640968825322;
        Fri, 31 Dec 2021 08:40:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1640968825; cv=none;
        d=google.com; s=arc-20160816;
        b=iHRbkSLOWnsVXWuJ6IjJSAHa6c43EF8trSUsvBlEVxSF/B30jE8flJ0xWEvDGu4m+p
         hDZSlHr38ZKuL+6+dM44jHYFkQ3XOE8O45n8Lj7bokRV+ozLwdvz6fbTVAJcmdDrAMsf
         m4yFLFzSVHaw2B/uENxEuOO/Ue0jYeUXZEJr0v+CFmwXIs4FNSwsx83xNG47/AmKZO3E
         LxTzCO7DhYs1AJiow2lSF4JUsZn4sukQIARFPsGsN/TyswtFJTCWlXW8a3jXSdwOL6i2
         +d5yQAcojCWm4XpZXMSdFfV4ZWx1ewppXRR0U1gzJDnBQf+E4FkwKB83hENmAe4WtjQN
         aNaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=caZXLcKxb6Ag5mVxIEhTbIfBfGiHXq2wNE6/g8Iq2fY=;
        b=fRHZah9EPR4SEh1MNZCtjH4sFemjnQKfIENqQc287+uotVa5F759UW2FPp+2Bgf2OY
         SngAjpHveW7HIy2nNqt0GbWBDipuyFC4rJ2QzCf3modtTDhzgBg6Ue1qD2mLYUbNPBum
         fe/ZiAJlyAQdri21k9bovwe7cdLBL22L89XBcziNDw5MVt3qD955abCQeK5cAM99M0hE
         XL7l8IdUFsFC776O25DeP19Q8b4UJTuXwwIMGuR2IDo2CTEV8qN2VEczCE/Eo96w1uRh
         r5jKQ3rsbADN2b558GGdRWPQ9afp2HW3OxJLjBt+M0DRSEoXaTkknn5A6bqqrioZohf6
         Y+hQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=XT4p3MaI;
       spf=pass (google.com: domain of alphamballo50@gmail.com designates 2607:f8b0:4864:20::b2e as permitted sender) smtp.mailfrom=alphamballo50@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com. [2607:f8b0:4864:20::b2e])
        by gmr-mx.google.com with ESMTPS id be25si3478095oib.3.2021.12.31.08.40.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Dec 2021 08:40:25 -0800 (PST)
Received-SPF: pass (google.com: domain of alphamballo50@gmail.com designates 2607:f8b0:4864:20::b2e as permitted sender) client-ip=2607:f8b0:4864:20::b2e;
Received: by mail-yb1-xb2e.google.com with SMTP id d201so57441463ybc.7
        for <jailhouse-dev@googlegroups.com>; Fri, 31 Dec 2021 08:40:25 -0800 (PST)
X-Received: by 2002:a25:7584:: with SMTP id q126mr32431827ybc.530.1640968825115;
 Fri, 31 Dec 2021 08:40:25 -0800 (PST)
MIME-Version: 1.0
From: Karen Owen <alphamballo50@gmail.com>
Date: Fri, 31 Dec 2021 16:40:14 +0000
Message-ID: <CAPk9JkNknsjNStsHph95pYAyji2Np5mCmVfnZVDJfaDBhOLw4g@mail.gmail.com>
Subject: hi
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="000000000000e8974e05d473d393"
X-Original-Sender: alphamballo50@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=XT4p3MaI;       spf=pass
 (google.com: domain of alphamballo50@gmail.com designates 2607:f8b0:4864:20::b2e
 as permitted sender) smtp.mailfrom=alphamballo50@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--000000000000e8974e05d473d393
Content-Type: text/plain; charset="UTF-8"



-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAPk9JkNknsjNStsHph95pYAyji2Np5mCmVfnZVDJfaDBhOLw4g%40mail.gmail.com.

--000000000000e8974e05d473d393
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAPk9JkNknsjNStsHph95pYAyji2Np5mCmVfnZVDJfaDBhOLw4=
g%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.g=
oogle.com/d/msgid/jailhouse-dev/CAPk9JkNknsjNStsHph95pYAyji2Np5mCmVfnZVDJfa=
DBhOLw4g%40mail.gmail.com</a>.<br />

--000000000000e8974e05d473d393--
