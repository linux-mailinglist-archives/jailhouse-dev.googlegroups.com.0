Return-Path: <jailhouse-dev+bncBCI7XTXZ6ADBBVM2YCSQMGQEMGSBCYQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc40.google.com (mail-oo1-xc40.google.com [IPv6:2607:f8b0:4864:20::c40])
	by mail.lfdr.de (Postfix) with ESMTPS id E9001752560
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jul 2023 16:42:30 +0200 (CEST)
Received: by mail-oo1-xc40.google.com with SMTP id 006d021491bc7-56662adc40bsf1230885eaf.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jul 2023 07:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1689259349; x=1691851349;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m5aJsO6czqxL8vmwK4tkvpsSP+7BRG13Z6Pk5PsenEo=;
        b=eqA8W0rR8/P8YCe14y35wzONJt2rwAK34FkNkNCyS7vtfJxP96MWvLX0Vf7/HI2Cbi
         eA1H6gB/eN5eqw5/wVOiY3VCX/usp1SqQpFhZmDYtX2FL774p0xRlzogd2Z+N8b3LX4k
         oRMc6USX3cSrSPrSvcGcT3st1a7Wmdm6pTFFv8PtUAmX7Ra9UhPZa4kBQlsS4kMG+HqY
         WPl/qF4rS9D9vya/YuJAJe1M7LOz9E84kzhXwZmyI2VxrN99kJCNjTUF90JrrmHLLqRn
         JQGAH8Ua2WQZ6+UvDAYtZirX7sDJuGlyZVSCHH9mR/Wl2GFQCYTi756wd0+YEPQ7MprX
         10WQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689259349; x=1691851349;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m5aJsO6czqxL8vmwK4tkvpsSP+7BRG13Z6Pk5PsenEo=;
        b=bcWRsNvGAFsmtYk2rNSGu/Mxp6r52OASqZ1T7vutyHQC5BVAqnQJGHsHoUHUUWJYlr
         2dm7cDUXxhuoivOii74lkhHK2lROIGF0Ekxf4N2RAbBvoDDPkbQrLkcJhFxFracKoqu/
         p8KqVb3g+7amgdYWPtgLEWcgMedQ7siIcfc3tTC2upKtND/Rt7kKbWCILRNdcq0uIvCE
         IO3xT7fAOhEEGf5OBcbrJs70ofhgVOniX/r9RbIbjk4IBY6OLE3RrLtckT1rJDzM5+rt
         N8AetAZOVagW29b7NQzEhMjVDN7gHWxZHgKlLmP1A37ZYOFzHQ1McDMMRklf1cfnYgbn
         k5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689259349; x=1691851349;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m5aJsO6czqxL8vmwK4tkvpsSP+7BRG13Z6Pk5PsenEo=;
        b=gbBze+PHC8naUX6sHINhZKxTLKPwkJYI6faLlO6NDCMBit+crP9u7rgzASrYUFvs80
         DibwtkO0KC5bKE7a9lQ3T0+6uKS7mwwn5A+4nbgSBEVGfy+hlwlWxkoBCXoBF4EZ8qpQ
         zr8okLlHET0OufcBan0uI1Wrt33RbxGClQ2aL0q7qR9zyVwXG4GTlCL5B5xB0DuxfbrC
         E8NRq2bn8yXyBA+QxeeqPEtbYDf/seoZ0ghKoe0vbAl5dUKa4Y3VNa7x/PX5ewqHmlcx
         p4eJJEQdfnuGfk+ZEgyiiCwr8wj3EMPkwpg8R4GWWPTQnF55He8VQjoFnUEBN+yoVBwW
         RwSg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ABy/qLYnhq39zAOx8kAEGDqPxLR6teVrAV1VkHzLwwImqB1i51cloV7T
	bmkjooJP8Cj1/vxyjGepdC4=
X-Google-Smtp-Source: APBJJlEbpbieg1lhzyXOMLKhOFM45ruc8eoe3zoYD0zQDeyPQmGKe7PQDXnuyEdAfxN1oKF1NIZ7GA==
X-Received: by 2002:a05:6870:d207:b0:1b3:a3c0:4346 with SMTP id g7-20020a056870d20700b001b3a3c04346mr2394069oac.47.1689259349437;
        Thu, 13 Jul 2023 07:42:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6870:9722:b0:1b0:80e2:25c5 with SMTP id
 n34-20020a056870972200b001b080e225c5ls1027631oaq.0.-pod-prod-01-us; Thu, 13
 Jul 2023 07:42:28 -0700 (PDT)
X-Received: by 2002:a05:6870:76a9:b0:1b0:9596:8931 with SMTP id dx41-20020a05687076a900b001b095968931mr1861927oab.11.1689259348551;
        Thu, 13 Jul 2023 07:42:28 -0700 (PDT)
Date: Thu, 13 Jul 2023 07:42:27 -0700 (PDT)
From: Jan-Marc Stranz <stranzjanmarc@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <d33e6a84-7a1d-4a28-85b0-62165fd20b56n@googlegroups.com>
Subject: Simplification of the hypervisor configuration for the root cell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2828_1455262622.1689259347759"
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

------=_Part_2828_1455262622.1689259347759
Content-Type: multipart/alternative; 
	boundary="----=_Part_2829_2024819514.1689259347759"

------=_Part_2829_2024819514.1689259347759
Content-Type: text/plain; charset="UTF-8"

Is there a way and the corresponding rules to simplify the hypervisor 
configuration for the root cell?

I have a hypervisor configuration for the root cell with 99 entries for 
"MemRegion".
I am now trying to merge these regions together.

My idea is to free all areas - except the areas for the hypervisor, for 
ivshmem and the guest cells.
However, this fails: when starting the hypervisor, the whole system 
"freezes".

Then I tried to group only some areas with the same values for the ".flags" 
element.
This is only partially successful and I can't really see a rule when areas 
can be grouped together or not.

How could we simplify the configuration for a root cell?

For our application we don't need the fine grained sharing of memory areas 
(security aspect).
Couldn't we share the whole address range for the root cell - except the 
ranges for the hypervisor, for ivshmem and the guest cells?

Jan-Marc.


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d33e6a84-7a1d-4a28-85b0-62165fd20b56n%40googlegroups.com.

------=_Part_2829_2024819514.1689259347759
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<span style=3D"background-color: rgb(255, 255, 0);">Is there a way and the =
corresponding rules to simplify the hypervisor configuration for the root c=
ell?</span><br /><br />I have a hypervisor configuration for the root cell =
with 99 entries for "MemRegion".<br />I am now trying to merge these region=
s together.<br /><br />My idea is to free all areas - except the areas for =
the hypervisor, for ivshmem and the guest cells.<br />However, this fails: =
when starting the hypervisor, the whole system "freezes".<br /><br />Then I=
 tried to group only some areas with the same values for the ".flags" eleme=
nt.<br />This is only partially successful and I can't really see a rule wh=
en areas can be grouped together or not.<br /><br />How could we simplify t=
he configuration for a root cell?<br /><br />For our application we don't n=
eed the fine grained sharing of memory areas (security aspect).<br />Couldn=
't we share the whole address range for the root cell - except the ranges f=
or the hypervisor, for ivshmem and the guest cells?<br /><br />Jan-Marc.<br=
 /><br /><br />

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/d33e6a84-7a1d-4a28-85b0-62165fd20b56n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/d33e6a84-7a1d-4a28-85b0-62165fd20b56n%40googlegroups.co=
m</a>.<br />

------=_Part_2829_2024819514.1689259347759--

------=_Part_2828_1455262622.1689259347759--
