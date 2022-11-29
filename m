Return-Path: <jailhouse-dev+bncBC5J3D7HTQNBBW4OTCOAMGQEJYUBQTA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83a.google.com (mail-qt1-x83a.google.com [IPv6:2607:f8b0:4864:20::83a])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B0C63C0DD
	for <lists+jailhouse-dev@lfdr.de>; Tue, 29 Nov 2022 14:21:32 +0100 (CET)
Received: by mail-qt1-x83a.google.com with SMTP id cd6-20020a05622a418600b003a54cb17ad9sf21012120qtb.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 29 Nov 2022 05:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iygukkdJThzpRogFtFGawdpo2lmMlBHmRmM/D0J7+2U=;
        b=ZROtH4orkHEWoQe3yBmwGJSknDksRHR10OGTRUUmPvm9yQRVy4/g3pTtJTlMiCxAxg
         azGOZIF+MwxeGoNnC+3ywxI1AEcRuNyAanEGo7h444aPkF5uF8MtvSDCFl25OuB86ysL
         cX+Qk+tyXNCocA0uC/jN/27VFj217Qhd14dOkuuxUxHyrC5jfRYTGp4Q59E75dzw9tuR
         ClyPqeEFVZ0DqE09EJx6461dsKYIM7FjsggazJ6hPqnvsDXaRIbER/bxK4Jb/FtycAF/
         f28V0kHA6pwunA24EH8FOPiits4fWKYrQ747/rKuL8/C/WPJ7T1cWc6Sb4YRws6Fk8Gc
         BxJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iygukkdJThzpRogFtFGawdpo2lmMlBHmRmM/D0J7+2U=;
        b=EiEDk4/hGgKRwN8F6YCItfoeicR1IV/kLZnvSq3vqjOpJbJHsox/GpVVTRBZltZrww
         7sb3WJb7bxrX7RYtkvTaeCwYXiw0MtAUPgQYUhGBj6P75ne93RxVtZNp88nnZKz2JQAf
         9ikREGbpN00WWSeM/334hYwx5gDNcdcsh7HmrBBOioguZhHFPYH5J552rJXWnvEo/t3E
         6gbqkW6/oGvtl9Z2BUVzMvK2p9PPIqTLiSrBq4eua+V2Lr4JSl6XwptguyICbAxtqerT
         LbnHKevftwpUdzURJb7CtbnAJRvPdGRqbRSUz+1Iu7rT7MUKI1R6wamJGD3MBDr3p6sM
         LWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iygukkdJThzpRogFtFGawdpo2lmMlBHmRmM/D0J7+2U=;
        b=GEp3uM7xnmj4FVXJlnlr16e6engRDXkbyauB4mtzb9MjVRJ/nbYzCXZK4TFjvTTvaQ
         KyP0J5EeOjVhwN2qk1/ysXLlYTvmGVykgf/1vNgVEMjWBSksERNyrY4u0lY1YK2Q32Bd
         WV4AAYyzh1AQMUp6j9b+uczPGgx6Wt/TJeMoncITK4F/VXoIA1HVsndoemMtxyNryGoC
         yuNZcrR30olubHd4vF/997Nbqf5VW1JUthQMAxx+2FuDu0Ug1EIlrhz7WhCzMFQGvcoW
         4yOsZyGTe3GESsIGFSKw7pUMSQwdYC3BGZt3qlCzFabkMNQGSHrPlfIC+XYle/cB0HIg
         EXPA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANoB5pleVVKhEzAsxM3toypPeRNisEMsOkuw3U9Hjg8Xax9zcCT9wLK8
	McSAfuJreeXTIHFJ+qRNHu0=
X-Google-Smtp-Source: AA0mqf6XO2ndilv9DQm9fPQUWqteFhDvUqL/r5mTWZNbB9VAVkEeQKk886GE8DZT4rHFMNv2ndD08g==
X-Received: by 2002:ae9:e405:0:b0:6fa:dde:394b with SMTP id q5-20020ae9e405000000b006fa0dde394bmr50267939qkc.265.1669728091600;
        Tue, 29 Nov 2022 05:21:31 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:1644:b0:6ee:d08f:aa7 with SMTP id
 c4-20020a05620a164400b006eed08f0aa7ls8733275qko.0.-pod-prod-gmail; Tue, 29
 Nov 2022 05:21:30 -0800 (PST)
X-Received: by 2002:a37:ad0:0:b0:6fa:93b1:6a78 with SMTP id 199-20020a370ad0000000b006fa93b16a78mr32476301qkk.779.1669728090589;
        Tue, 29 Nov 2022 05:21:30 -0800 (PST)
Date: Tue, 29 Nov 2022 05:21:29 -0800 (PST)
From: "nirge...@gmail.com" <nirgeller18@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <fde55f66-2e83-4df2-8f5e-44b0fb831acbn@googlegroups.com>
Subject: RTOS inmate misses interrupts
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_24600_1853828491.1669728089904"
X-Original-Sender: nirgeller18@gmail.com
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

------=_Part_24600_1853828491.1669728089904
Content-Type: multipart/alternative; 
	boundary="----=_Part_24601_247738783.1669728089904"

------=_Part_24601_247738783.1669728089904
Content-Type: text/plain; charset="UTF-8"



Hi there,

Our target is Sitara AM5726 , CortexA15 dual core on which we are running 
Linux on A15 core0 and RTOS on core1.

RTOS gets periodic interrupt from external hardware via nirq1 pin 
(dedicated input into ARM gic).

Under heavy load in Linux (core 0!), RTOS, which runs on core1 misses 
interrupts.

Questions

   1. Does linux/hypervisor participate in interrupt scheduling/forwarding 
   to cell on Core1
   2. Is there a description of interrupt forwarding/virtualization scheme 
   to cores (if exists)? Any pointer to document/source code would be 
   appreciated.

Thanks a lot,

Nir.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com.

------=_Part_24601_247738783.1669728089904
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p>Hi there,</p><p>Our target is Sitara AM5726 , CortexA15 dual core on whi=
ch we are running Linux on A15 core0 and RTOS on core1.</p><p><u></u></p><p=
>RTOS gets periodic interrupt from external hardware via nirq1 pin (dedicat=
ed input into ARM gic).<u></u><u></u></p><p>Under heavy load in Linux (core=
 0!), RTOS, which runs on core1 misses interrupts.<u></u><u></u></p><p>Ques=
tions<u></u><u></u></p><ol><li>Does linux/hypervisor participate in interru=
pt scheduling/forwarding to cell on Core1<u></u><u></u></li><li>Is there a =
description of interrupt forwarding/virtualization scheme to cores (if exis=
ts)? Any pointer to document/source code would be appreciated.</li></ol><di=
v>Thanks a lot,</div><div><br></div><div>Nir.</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.co=
m</a>.<br />

------=_Part_24601_247738783.1669728089904--

------=_Part_24600_1853828491.1669728089904--
