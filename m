Return-Path: <jailhouse-dev+bncBC653PXTYYERB7433GFQMGQEKNQJIQA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf39.google.com (mail-qv1-xf39.google.com [IPv6:2607:f8b0:4864:20::f39])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8D1438F76
	for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Oct 2021 08:26:08 +0200 (CEST)
Received: by mail-qv1-xf39.google.com with SMTP id bu1-20020ad455e1000000b0038529a6d278sf1036273qvb.10
        for <lists+jailhouse-dev@lfdr.de>; Sun, 24 Oct 2021 23:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=G5LrWhPcia5iREmo0GoiTBfHdMIffsibnXHtEwPslnU=;
        b=rXudj2x96VRn+K94x23QwkPfYavsf/lqRhL9B1w2vqF+/sLms/HO8MookteD2iaZzN
         UlDCRmz5VLaouGbU3jDrYS+ymr1U5hKaJ/sBO6jl+84yM7N+E5c0P31BQtdfs+Ui3a0O
         4UQ+NrWR+DjPRkoiTB5e8Js5MJlnWaN5CDyPSV+mBi42Xp5aLMnNqe5MbIR2Z2wSW4Mx
         TmRWeKSG9UoRJ5tYp0mGErYxQo4jfpNx9MNH+YVeiwA0tTM+j+W3orZS3NzX+tgLQtQk
         zyKUcDhwd+bVmhfFQ1zJsapmV5Zpg6b8iYjqEliWvZX25qhQA+Ky8bNTHjSuppkZIJ4t
         B5aQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=G5LrWhPcia5iREmo0GoiTBfHdMIffsibnXHtEwPslnU=;
        b=kUhKsF/MNvafxKxg6gkd1qJHD+7qpWsUNQP4S0grj4f+kMq3jbdQnmEBHcBAPdZ5o4
         NfkBz45xZXuYqf27Wcw3mdFNOvFZlIuEvNTvamuhq3s/c1BYdvJvSc4caiZzZiHc3ZVS
         bHJM61jerQnk1eQisoiOppt99cDzfsopwJqMKxvTDgWjCBbaiGb1j2QswKqDlSXCtEOK
         q9MLNiT6055Zw+Yjc6Mmd1YBahYXNGVLYJKVW/ZzP0Vbb3OXtz4Sz4Pm5OnMWUqhTYUL
         r6sMv0w6X8O2yOq58nNyf2N47eaXCGDc/xhaZ2nAFqMOKAzzrtRnMrVvQ95f81IGDshj
         SgOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=G5LrWhPcia5iREmo0GoiTBfHdMIffsibnXHtEwPslnU=;
        b=il43/TeU3QSpsHaZjQov8blhk4tFazI9wHInO06N2LI5tzmDEo7IiG2VU1tew40JXL
         CN3SWS9De+I87tXUiFsRcqpb21oOoAuAHqcle2s+Hfe6kBHkZckQSXPSUGIRBNkGITIo
         pnepx082ym0nrxLRIAX2ysIaZyoJWWQnPiavfdmxM7Zm/WMqrX7Lr58WKLFzm2Poh95h
         THZpktpo3/pyWxfYMg4Klwt930eHBAiI4PlQ2yuHURK0U9c1asKJspOyYlrsoOMy7pkY
         DwSNlRLIZ8TF9uRY4dz/PhIo3xwDaV5niYutptX643xsX8lkAW+2CVGUWZ5lGQo9oD2G
         OoWw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533Bi0AsfCe9DWkuxHGkzwYApICC3tf/DzjIxx1Ml3ay+hY1gdj5
	sFm7nNLfn6DFIjlb024XmGE=
X-Google-Smtp-Source: ABdhPJwOqEZi3lAg9/MNrn8MY+JJZNmP5wR35LpgX1QJV74IpLOROCRoTFtr67F6acdxfSmxmdxa4Q==
X-Received: by 2002:a05:622a:20f:: with SMTP id b15mr16236980qtx.399.1635143167760;
        Sun, 24 Oct 2021 23:26:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6214:1805:: with SMTP id o5ls3210551qvw.9.gmail; Sun, 24
 Oct 2021 23:26:07 -0700 (PDT)
X-Received: by 2002:a05:6214:188:: with SMTP id q8mr14034488qvr.5.1635143167072;
        Sun, 24 Oct 2021 23:26:07 -0700 (PDT)
Date: Sun, 24 Oct 2021 23:26:06 -0700 (PDT)
From: Moustafa Nofal <mustafa13e09940@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <28e452f0-6d96-4db5-9c39-be0c148d12b9n@googlegroups.com>
Subject: Jailhouse cell linux
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_5654_858646509.1635143166501"
X-Original-Sender: mustafa13e09940@gmail.com
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

------=_Part_5654_858646509.1635143166501
Content-Type: multipart/alternative; 
	boundary="----=_Part_5655_2140536041.1635143166501"

------=_Part_5655_2140536041.1635143166501
Content-Type: text/plain; charset="UTF-8"

I was not able to find a documentation about this jailhouse command 
"Jailhouse cell linux" , what I understand it takes the following arguments:
- linux configuration file .cell
- kernel image .img 
- device tree file .dtb
-rootfs.cpio, It might be not clear to me, is it necessary to load this 
file, how can it be built?
- console , baud rate and IP.

Another question: I used Jailhouse-images and started a 
linux-non-root-cell, but the UART terminal hangs at this point, is there 
any solution for this. So, I tried to ping/SSH IP from another terminal 
over LAN but it is unreachable. 

Thanks in advance
Moustafa Noufale

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/28e452f0-6d96-4db5-9c39-be0c148d12b9n%40googlegroups.com.

------=_Part_5655_2140536041.1635143166501
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>I was not able to find a documentation about this jailhouse command "J=
ailhouse cell linux" , what I understand it takes the following arguments:<=
/div><div>- linux configuration file .cell</div><div>- kernel image .img <b=
r></div><div>- device tree file .dtb</div><div>-rootfs.cpio, It might be no=
t clear to me, is it necessary to load this file, how can it be built?</div=
><div>- console , baud rate and IP.</div><div><br></div><div>Another questi=
on: I used Jailhouse-images and started a linux-non-root-cell, but the UART=
 terminal hangs at this point, is there any solution for this. So, I tried =
to ping/SSH IP from another terminal over LAN but it is unreachable. <br><b=
r>Thanks in advance<br>Moustafa Noufale<br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/28e452f0-6d96-4db5-9c39-be0c148d12b9n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/28e452f0-6d96-4db5-9c39-be0c148d12b9n%40googlegroups.co=
m</a>.<br />

------=_Part_5655_2140536041.1635143166501--

------=_Part_5654_858646509.1635143166501--
