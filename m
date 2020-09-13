Return-Path: <jailhouse-dev+bncBCI7XTXZ6ADBB55C7H5AKGQEM7OILKI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73f.google.com (mail-qk1-x73f.google.com [IPv6:2607:f8b0:4864:20::73f])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B37268072
	for <lists+jailhouse-dev@lfdr.de>; Sun, 13 Sep 2020 19:06:00 +0200 (CEST)
Received: by mail-qk1-x73f.google.com with SMTP id 205sf9072619qkd.2
        for <lists+jailhouse-dev@lfdr.de>; Sun, 13 Sep 2020 10:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=xPfM5oVzpcAtEGGAqzaIukUJtWP6g7KM7ApkuWmtD+0=;
        b=VlhtRDByjYaA9w8mDVmdiLMXoV8L4Gy+gVRu0KJehcBur5C2M9oN2lQQ0pOarvHNup
         6/DgOlZxli0v1YUI/2Gh6R8zKaEMGxjpuuwidenL3hpbnzIEDPv0L05pQUu7yqQfbQEC
         gvlTVbu1gqZsIex+MoD2KneW1tzEdplbsQ7rdEoxA2iPFHuMRB/VJO+szJRGeOWrOWIC
         CW+YTGSLuR7KC6OldUuKbXagnvFszCosA3GzFLMU8ZAGgagX7/wkNVVKEhRJ4rkCH/Vd
         6y+4eAqXM/GV01fLAIKS0FKIYGu4cpoZbuIlxt6j2plTzRB+86lQ0uk75zKNKrIKk+dR
         N6DA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=xPfM5oVzpcAtEGGAqzaIukUJtWP6g7KM7ApkuWmtD+0=;
        b=BeoOWK5u77Xd2mLxMge45n7Y9yYJMu7KKMljdYQPK96QtUea6VHrm1GVWcrOntX956
         nanSfebW0JJLbUZgzkAFyTXEz1PldYAZyCcPS3U0zWUM9iltpg85ghDrEjG8SCgSSg9j
         xHrPXZbJHKAimVubn2q13FCWH1eWevMsacMmR9S3c7YL0aW7gkpjTL80i12i4ADVd8Qu
         hGTQEZOLukGhuc01OcyczHxjNbhmSDHREW9lrlwwhERtNDcR7oVkgoNhQ3iP/bQ755Mi
         bFZTHQYzcuiS9Z4dLupcxa2V+2kYMYUqNP6XLnJG7W7wYopMOnemMy/N1eNUQR/E7eD0
         I7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=xPfM5oVzpcAtEGGAqzaIukUJtWP6g7KM7ApkuWmtD+0=;
        b=T+AmUNS7DILRbBdUiJgJr7DMcqefZGjX/rTnPU4ZNYf7L7nGELk142pTH75ps0TyZ6
         RFqnCJMX+Lf67drDVuzPumdKdFHvv3StK4i6YaKdMOIGmYUzMidjhisP9xBuqs5nI9Uz
         i+XRpOXzbnsxaUTzPXiSBYQE4WGkZDzOayXtj332aLZwrgR1ck7WGS2VX9xIrVctgT1q
         XKfGJGw/bueywjTwt0Rar8laYb5U88WNCKEGTp+JpQPPBKBBKiy+OOXz6d78gaknLga7
         HQu/2A8tjiVWRQpkRYXE8uMiERe/LEAi7/J5KLC6xU2hAEX8VdhPYzlxRQjIQ1OQTpPj
         rMBQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5337aC2b5sElR8+yZH1vpM8twwVJLEin9IE8NgGWyNl4skZgYbfP
	mMtUmH3iIWbC0kCLYP2uphg=
X-Google-Smtp-Source: ABdhPJxCHU0Py8O1/gljFSYjm75+MQZ1oYXWOjozJmyrR+ubrkuZs4vYMbdKFVGl7RTcJJJFLgBQ6w==
X-Received: by 2002:a37:7286:: with SMTP id n128mr9403966qkc.423.1600016759808;
        Sun, 13 Sep 2020 10:05:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:146b:: with SMTP id j11ls3707849qkl.0.gmail; Sun,
 13 Sep 2020 10:05:59 -0700 (PDT)
X-Received: by 2002:a05:620a:7f6:: with SMTP id k22mr9582330qkk.337.1600016759013;
        Sun, 13 Sep 2020 10:05:59 -0700 (PDT)
Date: Sun, 13 Sep 2020 10:05:57 -0700 (PDT)
From: Jan-Marc Stranz <stranzjanmarc@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <ec528e54-0acc-494c-95f7-314d6388d4aan@googlegroups.com>
In-Reply-To: <c9c32f69-572f-8224-8a10-e0922d7374bc@siemens.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <992cd8fe-ef09-d0bc-119d-e488de158759@siemens.com>
 <c5f91e66-7742-4736-83fc-8565b08989d5n@googlegroups.com>
 <1776338.qqhLftCfjJ@monster>
 <33ee04f7-5518-4f30-b28d-fb567ef1c609n@googlegroups.com>
 <0845ad7a-09a3-c366-91c3-b4f1b6725c56@siemens.com>
 <618bbad6-8276-476b-934e-ea765b28a796n@googlegroups.com>
 <0f3281b7-5da9-d616-d7ba-775ae1593e0b@siemens.com>
 <9dd555de-385b-429e-827c-408cbc04122fn@googlegroups.com>
 <42b8fa41-88cc-4907-bdce-44474b98d8acn@googlegroups.com>
 <8fc62bd6-478d-9725-ca0b-949f6e9217db@siemens.com>
 <ed7b0bc6-953a-4449-b77e-3d8b2db84e94n@googlegroups.com>
 <313b5c57-f64d-17dd-28ab-39af5b9058cb@siemens.com>
 <3752cf4d-64e6-4e55-b40d-08800a689f0an@googlegroups.com>
 <c9c32f69-572f-8224-8a10-e0922d7374bc@siemens.com>
Subject: Re: Build jailhouse on embedded target
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_820_401459231.1600016757916"
X-Original-Sender: stranzjanmarc@gmail.com
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

------=_Part_820_401459231.1600016757916
Content-Type: multipart/alternative; 
	boundary="----=_Part_821_506499747.1600016757916"

------=_Part_821_506499747.1600016757916
Content-Type: text/plain; charset="UTF-8"

Hello Jan!

I work in a company in Austria (Vorarlberg).
We develop and manufacture industrial measurement technology and I am 
currently using Linux together with RTAI to meet certain real-time 
requirements.

I am very interested in replacing RTAI and realizing the real-time 
applications on isolated cores of a multi-core CPU.
For this reason I came across the - very interesting approach - of the 
hypervisor "Jailhouse".

I am not a Linux kernel developer; however, I am able to create my own 
Linux distribution with the help of Yocto.

In this forum I have already reported about my numerous problems and 
pitfalls I encountered while running "Jaulhouse" on a real embedded target.

Asked directly: would it be possible to meet personally and start up the 
hypervisor "Jailhouse" on an embedded target during a training session?

Best regards
Jan.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ec528e54-0acc-494c-95f7-314d6388d4aan%40googlegroups.com.

------=_Part_821_506499747.1600016757916
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Jan!<br><br>I work in a company in Austria (Vorarlberg).<br>We develo=
p and manufacture industrial measurement technology and I am currently usin=
g Linux together with RTAI to meet certain real-time requirements.<br><br><=
div>I am very interested in replacing RTAI and realizing the real-time appl=
ications on isolated cores of a multi-core CPU.</div><div>For this reason I=
 came across the - very interesting approach - of the hypervisor "Jailhouse=
".</div><br>I am not a Linux kernel developer; however, I am able to create=
 my own Linux distribution with the help of Yocto.<br><br>In this forum I h=
ave already reported about my numerous problems and pitfalls I encountered =
while running "Jaulhouse" on a real embedded target.<br><br><div>Asked dire=
ctly: would it be possible to meet personally and start up the hypervisor "=
Jailhouse" on an embedded target during a training session?</div><div><br><=
/div><div>Best regards</div><div>Jan.</div><div><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/ec528e54-0acc-494c-95f7-314d6388d4aan%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/ec528e54-0acc-494c-95f7-314d6388d4aan%40googlegroups.co=
m</a>.<br />

------=_Part_821_506499747.1600016757916--

------=_Part_820_401459231.1600016757916--
