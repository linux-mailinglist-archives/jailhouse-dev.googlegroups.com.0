Return-Path: <jailhouse-dev+bncBCI7XTXZ6ADBB65AXX5AKGQEKMQ3SYI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3a.google.com (mail-qv1-xf3a.google.com [IPv6:2607:f8b0:4864:20::f3a])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AB525A724
	for <lists+jailhouse-dev@lfdr.de>; Wed,  2 Sep 2020 09:57:48 +0200 (CEST)
Received: by mail-qv1-xf3a.google.com with SMTP id a20sf793225qvk.17
        for <lists+jailhouse-dev@lfdr.de>; Wed, 02 Sep 2020 00:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=g1wqK6p6h7V9bwoUkOdzl2z9b08y7vYzNp6UPWYmfNw=;
        b=d4dJeD5HV1ZKZSXB68RSDawIHr5taGAu4oNUSZ1LSkR9ZNEq1yhsVBGWF4lhFo2dEL
         fWHicp4esBPwMu7QRU38h/xoA7Lpil5DHOUI9CfSMUtrquUF/B3Cea/XAr5d2Uj8pwL6
         VYtuJ6zMZmkot+ewFw+d/1t1ys6rNOTQnYjlM1OcHuwxDcv68zXm4fD2Pc3yjWqy0fvN
         styOAx2mAVMLBtysn0ePd7aK7lIcsk9RgsvZe44m2T1jl+7TejM0yQBOoY53yKNXV4Ay
         sEYbVVHgMF5g2gQxvrn6HS1uuY/59RyPodY6jePDcw3mI9WW6UIhBp44sZu8znufYmeI
         DadQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=g1wqK6p6h7V9bwoUkOdzl2z9b08y7vYzNp6UPWYmfNw=;
        b=an4RHJEWHJKKdGZI2WkEAIvJxbdlW8umSZxnLnyLt1AkTPiE8T6M3BhjNbg9bKJCQx
         JeT56ny8icNyXnopC/yTJk+kMWPmVwzgIlVJj5I0AYHUjRamxgkEe2qESBje3eVcRe7d
         Qij+L7iL95Q6Wi0flJAgQ7vtf1/5oMrPHahsypIxXHnJTn/wW5eW8/zumGQLnYeQv3Hd
         R8/PO5yUJhUN20cfeZGF+k6BuPSsDvpDUPGXFH5HYTFq/xZ/KHuiaNL3MwPP8kq/sFh2
         pLhuQapFMpjcbIwo7cSzPll6hdAqghqL/DLUdIEh+Bnf/h5zUCs9egziddl/wIhFkZSe
         DYhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=g1wqK6p6h7V9bwoUkOdzl2z9b08y7vYzNp6UPWYmfNw=;
        b=NPK8c8178rWoA517qx68Pgi2KNuz049GKl+DYua3gUZbd2nNH+xR3l7RF2QLVk2qgp
         LJ4W5IkEjzK8Ui6xDdWhaO574w24WJ1B8MK9LBn7L0dE+yyQcQWtYWwEDqD2W4UcXaHQ
         O3um9hcdnwEWt2PZGUa83okrrk1WU1pRJNIZib4xAbrL0D2n0ZZ7uml00DU3Baomv++U
         /eMHUSPXyIbyGMcjGrM5YBKLpS4ke1QKP4QYt9qZKGi0EXEU/Nls3gTqS9acxn2jWjHd
         oUYioY1KZ6krdqR0J0W7r/goW8mvGPN14nNxQXUmWMWnWIVkVkVosBFrlkcUCJK+o7WE
         ps8Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531zOGyKPYATjD2ND+V4bSUgu/DMlS/rULdYHE9a9n9UW43oaLao
	SDDD7lwKDJQ/xjJrH/HA/hw=
X-Google-Smtp-Source: ABdhPJyw7im223z4ZWv6qheCMjn6Op9xxwZ86H7iOTOmsyR/A7L0Pa1Pf5uXaxdJUzVPPDB08AzW7g==
X-Received: by 2002:a37:6595:: with SMTP id z143mr5970684qkb.244.1599033467362;
        Wed, 02 Sep 2020 00:57:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:371d:: with SMTP id o29ls540369qtb.6.gmail; Wed, 02 Sep
 2020 00:57:46 -0700 (PDT)
X-Received: by 2002:ac8:71cb:: with SMTP id i11mr5744482qtp.108.1599033466794;
        Wed, 02 Sep 2020 00:57:46 -0700 (PDT)
Date: Wed, 2 Sep 2020 00:57:45 -0700 (PDT)
From: Jan-Marc Stranz <stranzjanmarc@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <7ce9ec5d-5e58-4b39-ac21-2f6a1d391ce4n@googlegroups.com>
In-Reply-To: <f7aa0d56-f1a8-ff95-c565-d1f7edc707a3@siemens.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <a9dc46fa-7799-879a-11be-b5e3d64a7a12@web.de>
 <629cee36-86a7-4239-a997-baa2d165f08dn@googlegroups.com>
 <716a1db0-3392-40d6-a6ac-051ca2a52ce7n@googlegroups.com>
 <0153a372-c0c8-48d7-a595-aa502f81b09bn@googlegroups.com>
 <f7aa0d56-f1a8-ff95-c565-d1f7edc707a3@siemens.com>
Subject: Re: Build jailhouse on embedded target
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_454_2134694950.1599033465897"
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

------=_Part_454_2134694950.1599033465897
Content-Type: multipart/alternative; 
	boundary="----=_Part_455_1793722120.1599033465897"

------=_Part_455_1793722120.1599033465897
Content-Type: text/plain; charset="UTF-8"

Hi Jan!

Many thanks for your response.

It is true that the CPU we are using (Intel E38xx) does not support "VT-d".

In your presentation "Bootstrapping the Partitioning Hypervisor Jailhouese" 
(as of October 2016), however, the point "Host-side requirements" still 
says "Intel host with VT-x (no VT-d required)".
From which version of "jailhouse" was this requirement changed?

Best regards
Jan.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7ce9ec5d-5e58-4b39-ac21-2f6a1d391ce4n%40googlegroups.com.

------=_Part_455_1793722120.1599033465897
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Jan!</div><div><br></div><div>Many thanks for your response.</div><=
div><br></div><div>It is true that the CPU we are using (Intel E38xx) does =
not support "VT-d".</div><div><br></div><div>In your presentation "Bootstra=
pping the Partitioning Hypervisor Jailhouese" (as of October 2016), however=
, the point "Host-side requirements" still says "Intel host with VT-x (no V=
T-d required)".</div><div>From which version of "jailhouse" was this requir=
ement changed?</div><div><br></div><div>Best regards</div><div>Jan.<br></di=
v><div><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/7ce9ec5d-5e58-4b39-ac21-2f6a1d391ce4n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/7ce9ec5d-5e58-4b39-ac21-2f6a1d391ce4n%40googlegroups.co=
m</a>.<br />

------=_Part_455_1793722120.1599033465897--

------=_Part_454_2134694950.1599033465897--
