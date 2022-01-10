Return-Path: <jailhouse-dev+bncBC653PXTYYERBJOL6KHAMGQE77Q5QTA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73e.google.com (mail-qk1-x73e.google.com [IPv6:2607:f8b0:4864:20::73e])
	by mail.lfdr.de (Postfix) with ESMTPS id CA80448A1F6
	for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Jan 2022 22:31:21 +0100 (CET)
Received: by mail-qk1-x73e.google.com with SMTP id m21-20020a05620a24d500b004780f869883sf1784614qkn.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Jan 2022 13:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=HSVq1VJdQP7bLVYA5QGCg1R8h/TkbcsVn7xfhcX5pDw=;
        b=NWbrMKLm55puTQRAUvIw9hRxi1ATAvCQ4jLwF3yczPu7lFyKY9+6mm5R9PHoAdy9dt
         fyoehFuUt67aCwEj5hM36gUau07XW8SCSmZJclh63SH6Sg7kZiPdQqQXJNXj9ZyY/zJy
         sSPW8WSXBEMHvKH20mBeaJJneqRC27ie1DRadKfpMIRwCnzDPNsz4jbPx8wqdJrDCtnH
         iUGudra0I+I/rAtufM9xSxSexdkcNguRrlRx+vJGsgijaiB8B24bXFMeWaaQFInr9YkH
         /aenX2Fre4gF5Fta2AQFEzrYmJ/iDBUs8yV1HfXigGwlJP5eo/Gi4RJPtzz2VKVX5e/6
         FPlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HSVq1VJdQP7bLVYA5QGCg1R8h/TkbcsVn7xfhcX5pDw=;
        b=R+r8TgUD/K7RCI0pX74pEh/f0VBHP7/RJKJn4RoPfKdeF4ze6uyproWPJd3v1VmLhR
         ZEjN5lK571w07rZhveo6bEJ+ZcUGpmZHsuMTqwk54sz1HPN8994p3jcJU9qhsH0Wlc7E
         cFTrVeaPRpxIIST2ebuEGSohOuaxP/UyiBDlhTvEamIyQBO8p12NPfaqOhxk+eQgYp/r
         FaeuDjlLc31xtskwdpL7iAPFqvtBeV19QWCceU9DdriXJqPM13EYr1XyF+ELqNz623RM
         1O0SdI5ovTLYuRU5bsmYru1xCVOlbZ0rlpr1/U0DGG9yJ575SDx5+VkqMtK1V1hS5g1Q
         gCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HSVq1VJdQP7bLVYA5QGCg1R8h/TkbcsVn7xfhcX5pDw=;
        b=PZrvzBNytqMo6nnNJHaD1AGYaANXXGmrD3PZklbenQdGbhO1mc2K6fFu9W9Rkj87AJ
         W4f12eQAyJFUOAeovXeF+FjeBNel5T6S8axYI4ChgRVqjfkMevbj8DDxluOeT7nlhEyf
         jM52blxSSyVect1li/ND5QmYyrn7gdhbD7NsvQ+L+o4TuUPGDJuN7qzJbJvDpg893T/R
         VI4vxheF6/q1p+MueQegXhL6QZ1GlpaXaUDZBK0nSRzaG00nTffuHunvCgD2rRixapuF
         oFf0EwIl3RCQdie42OfJzazQMPzjRB2nYC+w5A8Abokv9zo4g3bd5emfjqKiNeevpAqZ
         pArg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532bSiEBfuBiLhyW2yl+1w0pfR3vD9lve8iXte08hORr2+rqefG/
	8PD5lPLM4Ezyv9ge4qmh6xs=
X-Google-Smtp-Source: ABdhPJxmtXgF4C+RSf7jMtfShB6r+9+jrSCx77ekGwZsNQmxeF7NXCn2mVWxQO+NkAuWEHh1QTiP1Q==
X-Received: by 2002:a05:622a:386:: with SMTP id j6mr1441335qtx.63.1641850277559;
        Mon, 10 Jan 2022 13:31:17 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:4311:: with SMTP id u17ls7290908qko.6.gmail; Mon,
 10 Jan 2022 13:31:17 -0800 (PST)
X-Received: by 2002:a37:a1d0:: with SMTP id k199mr1259274qke.378.1641850276840;
        Mon, 10 Jan 2022 13:31:16 -0800 (PST)
Date: Mon, 10 Jan 2022 13:31:16 -0800 (PST)
From: Moustafa Nofal <mustafa13e09940@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <e630d89c-45ab-40c1-ab9e-222fbbe26f30n@googlegroups.com>
Subject: Adding another vpci
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_62_199476632.1641850276363"
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

------=_Part_62_199476632.1641850276363
Content-Type: multipart/alternative; 
	boundary="----=_Part_63_1509375826.1641850276363"

------=_Part_63_1509375826.1641850276363
Content-Type: text/plain; charset="UTF-8"

Hi, 
I intend to add another Linux on Raspberry Pi4. So, I added also a memory 
region on rpi4.c and extended the size of mem_regions by, and managed to 
get working. I added a pci device, and extended the array by one, and the 
pci device is added, but without kernel driver in use? So, how to add the 
driver to it?

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e630d89c-45ab-40c1-ab9e-222fbbe26f30n%40googlegroups.com.

------=_Part_63_1509375826.1641850276363
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,&nbsp;<br>I intend to add another Linux on Raspberry Pi4. So, I added al=
so a memory region on rpi4.c and extended the size of mem_regions by, and m=
anaged to get working. I added a pci device, and extended the array by one,=
 and the pci device is added, but without kernel driver in use? So, how to =
add the driver to it?

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/e630d89c-45ab-40c1-ab9e-222fbbe26f30n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/e630d89c-45ab-40c1-ab9e-222fbbe26f30n%40googlegroups.co=
m</a>.<br />

------=_Part_63_1509375826.1641850276363--

------=_Part_62_199476632.1641850276363--
