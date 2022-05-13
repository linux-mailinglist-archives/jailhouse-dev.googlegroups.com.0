Return-Path: <jailhouse-dev+bncBCX7HWUSSQARBVWA7GJQMGQEQ35IXRQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3c.google.com (mail-qv1-xf3c.google.com [IPv6:2607:f8b0:4864:20::f3c])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBE0526306
	for <lists+jailhouse-dev@lfdr.de>; Fri, 13 May 2022 15:42:47 +0200 (CEST)
Received: by mail-qv1-xf3c.google.com with SMTP id u19-20020ad449b3000000b004523cc11b95sf6875002qvx.7
        for <lists+jailhouse-dev@lfdr.de>; Fri, 13 May 2022 06:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=4Nv/xnc5rXWimMzqsZKerG8ID6D3Lkua6MWTtQdACcE=;
        b=AKWZlbOxREOIEvsY2GHKAR+dNR/idMXENLvkeIV1M2fC3zqowwEB5xhjH0Zrerhc7b
         /vCIoh6CuhZLtGpOC8lbgc6Rl1fWyPmtDgQ/GSj5m/uW1NbpueIg6MNNfeucWSaCAqa5
         9YLUb2UsZWoo9pnP7TET4zogb8uoW2jKi2+MGxisFZ+Lv1qyjGanfgjcUGVO4u/7DvJK
         CfLF0bHBGpphZRc3ikwOh/UkreZee+g3lCebMev/6hoF4WrSPNlmFNa/Q8OL4sFE55fo
         ywNaEDWXq1rwEdz5tv4RSO6megq7X72HEIRPjlHCXoToR+v3pIKd5X8dHJfgv9GsATIl
         +HkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4Nv/xnc5rXWimMzqsZKerG8ID6D3Lkua6MWTtQdACcE=;
        b=oFjXd8c7ZYougHEAedZxJLJXsIuJHovEPNxnM88GOKP3T+Hwcheq1leNxK6noaEOqe
         fFdSwEHR9YooYWrIDxdVK7tTPqjAHcUuKBI+ZgmEV/9TWGNkfUdHLl/IkpBN5raIdtuA
         EuEJpoJvKq0FoJI697kp0QszbFurMeX3xd/dLmmMpra61G6SfLrsdzuOeWRpsheC772M
         RBtRibGQxu+1ppDuwvS1NHRIwByjaWM2yEgkJ++K3DdsCKR26UGNzP9kPVYdtJIo0c26
         2pjLtjqtwSmgsNAhRYIzSWmpwg0RNrgyjIDcmMMU6OACtCR1AbG9DwGGPTLEZYzvN6Sb
         cBWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4Nv/xnc5rXWimMzqsZKerG8ID6D3Lkua6MWTtQdACcE=;
        b=T5qf9uCnwrJCugt5YwgndaRjzI+4ENW1cQ++4NiPG5gKBiXU8g2+6paujvndMtE5ZP
         zIG4tzSK7uMUwxd35pBg86v+R2KUaxf9Wl4m9D4IfbLW06K27+UlSo9e0xyJY4/tktt2
         b5oeNpR85HdDSe9fxa+5VAEVHpshYbSVVBRIkmu0NYK7vp/3TkKAiX1EPfs70wOosYtT
         v7usMvlmQABsmWD5cTiLdizkUpmYyDVvGBz1VRl1ZGB2sseXZeraoYXjZjx43gUcyOwU
         p48Auh5uzXjS7wScz1EhveVIrIDmIxNVjdv6Hy+VZ1skdDJb48dyCRi+qFj5lCJlGS0S
         WBsg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532zvHtX6mQXY3XzLYBsUkTNIRckde4is2tmRokLT3TLrtS3LFcs
	xaXxeoapeFKEoVVx1cXJqO4=
X-Google-Smtp-Source: ABdhPJy9VgXBQzbKRpMe4LLCsPkFBVawXSRmr+C1ZzKE+nqP5UaxpmpnsPI8TiX1LSVWmdA89KdLvg==
X-Received: by 2002:a0c:cb90:0:b0:45a:b8c8:53bb with SMTP id p16-20020a0ccb90000000b0045ab8c853bbmr4331604qvk.106.1652449366734;
        Fri, 13 May 2022 06:42:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:f14:b0:69b:dd23:cc12 with SMTP id
 v20-20020a05620a0f1400b0069bdd23cc12ls5216854qkl.9.gmail; Fri, 13 May 2022
 06:42:45 -0700 (PDT)
X-Received: by 2002:a05:620a:24d2:b0:6a0:5335:913d with SMTP id m18-20020a05620a24d200b006a05335913dmr3722976qkn.688.1652449365789;
        Fri, 13 May 2022 06:42:45 -0700 (PDT)
Date: Fri, 13 May 2022 06:42:45 -0700 (PDT)
From: Jean de Bonfils <jdebonfils5@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <57292f2e-56a8-4692-915a-023583501d66n@googlegroups.com>
Subject: phys_start and virt_start relationship with IPA, PA and VA
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_5506_342540691.1652449365233"
X-Original-Sender: jdebonfils5@gmail.com
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

------=_Part_5506_342540691.1652449365233
Content-Type: multipart/alternative; 
	boundary="----=_Part_5507_1397064939.1652449365233"

------=_Part_5507_1397064939.1652449365233
Content-Type: text/plain; charset="UTF-8"

Hi everyone,
I can not understand the relationship between *phys_start *and *virt_start* 
defined in cells and Intermediate Physical Address, Physical address...

Are phys_start addresses defined in cells IPA or PA ?
Are virt_start addresses defined in cells VA or IPA ?
Why in inmate cell samples virt_start are equals to phys_start ? What if I 
would set a different mapping ?

Any help or explanation would be greatly appreciated. Thank you in advance 
and have a nice day.

Jean de Bonfils

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/57292f2e-56a8-4692-915a-023583501d66n%40googlegroups.com.

------=_Part_5507_1397064939.1652449365233
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,<div>I can not understand the relationship between&nbsp;<b>phys=
_start </b>and <b>virt_start</b> defined in cells and Intermediate Physical=
 Address, Physical address...</div><div><br></div><div>Are phys_start addre=
sses defined in cells IPA or PA ?</div><div>Are virt_start addresses define=
d in cells VA or IPA ?<br></div><div>Why in inmate cell samples virt_start =
are equals to phys_start ? What if I would set a different mapping ?</div><=
div><br></div><div>Any help or explanation would be greatly appreciated. Th=
ank you in advance and have a nice day.<br></div><div><br></div><div>Jean d=
e Bonfils</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/57292f2e-56a8-4692-915a-023583501d66n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/57292f2e-56a8-4692-915a-023583501d66n%40googlegroups.co=
m</a>.<br />

------=_Part_5507_1397064939.1652449365233--

------=_Part_5506_342540691.1652449365233--
