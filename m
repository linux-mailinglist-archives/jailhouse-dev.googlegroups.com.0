Return-Path: <jailhouse-dev+bncBCDKHIWT5EIBB65T76OAMGQEZ2F6CMQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x1138.google.com (mail-yw1-x1138.google.com [IPv6:2607:f8b0:4864:20::1138])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B5A6506C4
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Dec 2022 04:26:52 +0100 (CET)
Received: by mail-yw1-x1138.google.com with SMTP id 00721157ae682-39afd53dcdbsf96246727b3.8
        for <lists+jailhouse-dev@lfdr.de>; Sun, 18 Dec 2022 19:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ERlpKB9/8+AqgMu+wlDjgQZ9Xg/EniWw+dLYa3VPcVE=;
        b=Tt6+BGJyD58eXgiV3xrcmOsJuR1rc0bXpSmkP1v6IehzDDmDtZay/FNMJqe77p9pKn
         7mpqDczpplu3bVfDCIo9JF+W426RdMIzRGHsanpKOp/mmJHwX86SzOM86W6zGKOzTqyi
         bvbDoFn+9mOesScXGR2Zyy73TjQa93SaPUUpnayb6+o7BAgeSJi46yJxAXyfon8MTxdI
         c7Zn38fPJ2/6ivcwL/KYBtcL0i/WwK8hLMHjZ5cypV5kmQ+RBrk0x6m5R55EXK1sFJlJ
         QBo0wMNIXdleTocmaVptSUK1DfL0TlJCGnTqC/np/ONs11+Z/uXj98IIJ0e/fr1qOtZL
         y5Iw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ERlpKB9/8+AqgMu+wlDjgQZ9Xg/EniWw+dLYa3VPcVE=;
        b=e17oZGZfeRTgP/MqLAHK7BkLrFVuqrag9zTNNOAWZ1ptNMkS5lepUjP7MMxQeFseOv
         Y9yIGjnwXJ8aXphdaQ361CsTRvbzoG4YE+zBQlBPTXuwjlAxM1Ntnf8fWjMoFXIES+l6
         E1DpE+1kRZVnbgrXrRvMBz3YrAbeShHe7/QYBvrirgOmfw9NvVb4F/m4vQQ8iYE3BiNQ
         tnQkOBwNv7E92p7/1w+Ldxxufgdfnprmq8+xyA8ZNxx8iwSQD1At5ezmvOo49sqDnMT6
         QxccXr1PHAxUqhvNUVaNsW8iHcTeEcGAPe/XXF3d4mGZt5W3qlL92u5rmMGl8GGgBRMh
         NJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ERlpKB9/8+AqgMu+wlDjgQZ9Xg/EniWw+dLYa3VPcVE=;
        b=TVNLYvUvMlsaRynOhrDvDs395ODhKpP4UsL1kE8Z5OILi03Sl+17jlSaahFA2halxm
         lOllAGALv6I1x95FW0eCR4iaT/O0uNMGPhIlSWnr3Bpw6QIjSdr4QsdQ8uPWppHzfWrF
         Td8/J1p7FEZSGfbGdfFmGY3IpmzV8YWk45uXzgxTyVGDJGvDmfE07A+bB9dy5o0YY1KQ
         WugcKmfO+2fVyFjD1aEMe71Du+LaHfI/1kQOnBBj3ZPn7I9B3VtOZBOMW/QKJU0x8u1h
         73tYipo9WginwtFnI/yZFdSvRkK3vzVrOV44xvjaCRwc3PnEm1WGSj8+Wvr5qALF3poi
         Y61A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANoB5pmFt86fsZyh/8/fWK2IsATvVbJiidsKoI7cYi+lDfHz+3ApT1Rb
	oMZ2c1JvJWdL7z6Wip+OTis=
X-Google-Smtp-Source: AA0mqf4xN+AUBqK9+PScaw2GyTT/DozywV9uEmLZDpkc/f6k3ouYo4AKEAdHxmIOv6SQEYmiRufNQQ==
X-Received: by 2002:a25:d9d4:0:b0:6f9:7120:674e with SMTP id q203-20020a25d9d4000000b006f97120674emr43142461ybg.8.1671420411811;
        Sun, 18 Dec 2022 19:26:51 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:ad47:0:b0:70b:ecd8:a6b3 with SMTP id l7-20020a25ad47000000b0070becd8a6b3ls4700613ybe.8.-pod-prod-gmail;
 Sun, 18 Dec 2022 19:26:51 -0800 (PST)
X-Received: by 2002:a25:2086:0:b0:745:e85c:f1f6 with SMTP id g128-20020a252086000000b00745e85cf1f6mr128272ybg.48.1671420410864;
        Sun, 18 Dec 2022 19:26:50 -0800 (PST)
Date: Sun, 18 Dec 2022 19:26:50 -0800 (PST)
From: =?UTF-8?B?5byg5a626ZOt?= <j.jyaming@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <c825f8ec-ace9-4f1d-a35d-e2f87a7ee29fn@googlegroups.com>
Subject: printk issue in hypervisor code (jailhouse-0.12)
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_7486_1182025163.1671420410338"
X-Original-Sender: j.jyaming@gmail.com
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

------=_Part_7486_1182025163.1671420410338
Content-Type: multipart/alternative; 
	boundary="----=_Part_7487_1386237346.1671420410338"

------=_Part_7487_1386237346.1671420410338
Content-Type: text/plain; charset="UTF-8"

Hi, 

I'm confused by the debugging of the hypervisor code.

In *int ivshmem_init(struct cell *cell, struct pci_device *device)* 
(jailhouse/hypervisor/ivshmem.c)

Here's a *printk* code: *printk("Adding virtual PCI device %02x:%02x.%x to 
cell \ ....*

When I have changed this code, for example, *printk("Adding virtual PCI 
device(s) %02x:%02x.%x to cell \ ....*

After making and enabling, No changes are shown in the serial output. 

Thanks,
jiaming

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c825f8ec-ace9-4f1d-a35d-e2f87a7ee29fn%40googlegroups.com.

------=_Part_7487_1386237346.1671420410338
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi,&nbsp;</div><div><br></div><div>I'm confused by the debugging of th=
e hypervisor code.</div><div><br></div>In <b>int ivshmem_init(struct cell *=
cell, struct pci_device *device)</b> (jailhouse/hypervisor/ivshmem.c)<div><=
br></div><div>Here's a <b>printk</b> code: <i>printk("Adding virtual PCI <b=
>device</b> %02x:%02x.%x to cell \ ....</i></div><div><i><br></i></div><div=
>When I have changed this code, for example,&nbsp;<i>printk("Adding virtual=
 PCI <b>device(s)</b> %02x:%02x.%x to cell \ ....</i></div><div><br></div><=
div>After making and enabling, No changes are shown in the serial output.&n=
bsp;</div><div><br></div><div>Thanks,</div><div>jiaming</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/c825f8ec-ace9-4f1d-a35d-e2f87a7ee29fn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/c825f8ec-ace9-4f1d-a35d-e2f87a7ee29fn%40googlegroups.co=
m</a>.<br />

------=_Part_7487_1386237346.1671420410338--

------=_Part_7486_1182025163.1671420410338--
