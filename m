Return-Path: <jailhouse-dev+bncBDMKLNGQVIKBB7676GTAMGQENAJB5NI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33b.google.com (mail-ot1-x33b.google.com [IPv6:2607:f8b0:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DA577DA98
	for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Aug 2023 08:43:14 +0200 (CEST)
Received: by mail-ot1-x33b.google.com with SMTP id 46e09a7af769-6bd2b430d35sf5538948a34.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Aug 2023 23:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1692168193; x=1692772993;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QuzMtUzXDAskB3WhGGZn62qWdcRNNZH3/2Q5LKZ4CMc=;
        b=ONyRfTE9RTeBM0JafXJodmrmpx3McCijw0IwzYteDHZSFwev0V/oN0paIK908qiosD
         217N+yqsivCpTOfY1/F+N0eJo48cCVKPjFa4TwZ8wixkV4ZcWpMTgFB58fwKf7HbBYwH
         VckJFQHcSgwJK/9DmpRS/fajdHSRZ0DMJpKLUIT8wDjrrmBQfkgswpWnbpW2zpxyLLda
         m4fgydJxzHSfiSkrI3odqYP98LXvNJRlRmQStKrVf/5EiBgNDe/b/GVBVy/WlBsWNq1b
         XQY2TDZb9lVdfyqcGUEG36MYrrYWYrEXVjVTe/+Aub06/4m22tFNtb/YvDaLhpX4jC+x
         cW2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692168193; x=1692772993;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QuzMtUzXDAskB3WhGGZn62qWdcRNNZH3/2Q5LKZ4CMc=;
        b=CzFVA1S2f4MHWmp/+SJIy213RCSiqBwCe2DgVvNTfEWTBic90166Sr1/ZEI36Scs5b
         GG86Q+T89amUk/TtrKK5LYZmmGr1xKrCU5PQ7mVos1vjK3yJ3DUD3LArTdYoomYGhDUQ
         YhbzZes4KCn0PtpEZCf7+wBXRmkGz08WAzCe48ke6XbqWJpSwL5FdRzpZYkIcuF5CBgR
         bWvReijJAW5GFbVdKxxzvB7N3cj3/JP0rPY1RQ1I4PO7QcMGAWyE4rRjMKdSBXtcfuPV
         lJ1Pt9Cs1qpXFR5kRVHAWiiOvqbZ7k0Xu7zxO/lU7Ntj9NQEZeZXrI1OJ5n4YJsZC3kZ
         eyZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692168193; x=1692772993;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QuzMtUzXDAskB3WhGGZn62qWdcRNNZH3/2Q5LKZ4CMc=;
        b=FysKV3OIoQH4iuHA/dfPablPDux4KIVflO5YgnEPeYdJFQ8xZzYIhnujlZflbiiAN5
         FztkIO1v787iBqHK2rAx+k7yTxeKDMuqjvmqtitX5cSljGIp18jYEyAppNzscs+GksFD
         XYfwJUA5yfNop8SwGyCgu+6hr7AdGhc2FF5fpQ6DXrBNFmBOwc+Qr71DO734qSYewzGi
         1TuqDY5R3tmb82it0fdYvdSZSanszjFSRBtHaXjlOehw6tfo6taY37OueYnV551WUQk9
         0+2ef3J+/jxMU5750+St9mpYb8ZNLhroPeCo0HRIROF5ZQl13joOru19UdUFUU11UIv2
         STtg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YxRcNkSLWT+ZBzpTNKUiMy3BWcAyye3MfOw6J9EBGQ3W8ur6AAC
	4UBCyN/wE1i94BpocHo2Fmk=
X-Google-Smtp-Source: AGHT+IG7aEzXWLcV+aOhcpu694SPsouSo1p8sJyf50kMYJQUOgZA5Y0go25sKshOo+rzgSmdHH0iAQ==
X-Received: by 2002:a05:6830:4799:b0:6bc:fab5:e996 with SMTP id df25-20020a056830479900b006bcfab5e996mr948396otb.31.1692168192650;
        Tue, 15 Aug 2023 23:43:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90b:2394:b0:262:dc9e:41ca with SMTP id
 mr20-20020a17090b239400b00262dc9e41cals4645503pjb.0.-pod-prod-07-us; Tue, 15
 Aug 2023 23:43:11 -0700 (PDT)
X-Received: by 2002:a17:90a:cb12:b0:26b:1f39:cb9c with SMTP id z18-20020a17090acb1200b0026b1f39cb9cmr139356pjt.5.1692168190827;
        Tue, 15 Aug 2023 23:43:10 -0700 (PDT)
Date: Tue, 15 Aug 2023 23:43:09 -0700 (PDT)
From: Romain Rollet <romain.rollet@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <c62a1c53-9134-468c-8307-f4a24ed313e6n@googlegroups.com>
Subject: x86 interrupt latency on apic-demo application
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1444_172268333.1692168189862"
X-Original-Sender: romain.rollet@gmail.com
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

------=_Part_1444_172268333.1692168189862
Content-Type: multipart/alternative; 
	boundary="----=_Part_1445_282027089.1692168189862"

------=_Part_1445_282027089.1692168189862
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear everybody,=20
I am new on this group, starting my experiment of jailhouse on x86. So=20
hello everybody!.=20
 I succesfully run it on a Apollo Lake platform with kernel 5.4 (ubuntu=20
20.04). I ran the apic-demo application and measured interrupt latency=20
using the APIC timer (TSC deadliine mode). IOMMU is correctly configured so=
=20
we have no VM exit as reported by statistics. Most of the time, we have=20
very good time (~300ns) but sometime, we experience very long latency=20
(>10=C2=B5s). There is no SMI as reported by the SMI counter available on A=
pollo=20
Lake. =20
We observed the same behavior on another x86 platform with ubuntu 18.04.=20
What is the reason of this  very long latency? Is it due to the apic timer=
=20
itsefl?
Thanks in advance,
Romain

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c62a1c53-9134-468c-8307-f4a24ed313e6n%40googlegroups.com.

------=_Part_1445_282027089.1692168189862
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear everybody,=C2=A0<div>I am new on this group, starting my experiment of=
 jailhouse on x86. So hello everybody!.=C2=A0</div><div>=C2=A0I succesfully=
 run it on a Apollo Lake platform with kernel 5.4 (ubuntu 20.04). I ran the=
 apic-demo application and measured interrupt latency using the APIC timer =
(TSC deadliine mode). IOMMU is correctly configured so we have no VM exit a=
s reported by statistics. Most of the time, we have very good time (~300ns)=
 but sometime, we experience very long latency (&gt;10=C2=B5s). There is no=
 SMI as reported by the SMI counter available on Apollo Lake.=C2=A0=C2=A0</=
div><div>We observed the same behavior on another x86 platform with ubuntu =
18.04. What is the reason of this=C2=A0 very long latency? Is it due to the=
 apic timer itsefl?</div><div>Thanks in advance,</div><div>Romain</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/c62a1c53-9134-468c-8307-f4a24ed313e6n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/c62a1c53-9134-468c-8307-f4a24ed313e6n%40googlegroups.co=
m</a>.<br />

------=_Part_1445_282027089.1692168189862--

------=_Part_1444_172268333.1692168189862--
