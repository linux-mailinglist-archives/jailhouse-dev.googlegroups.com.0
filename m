Return-Path: <jailhouse-dev+bncBCW2V4XPZICRBTGWYOSQMGQEMGIW5HY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oa1-x3f.google.com (mail-oa1-x3f.google.com [IPv6:2001:4860:4864:20::3f])
	by mail.lfdr.de (Postfix) with ESMTPS id A12827531F3
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Jul 2023 08:29:34 +0200 (CEST)
Received: by mail-oa1-x3f.google.com with SMTP id 586e51a60fabf-1b03f7fb970sf2705163fac.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jul 2023 23:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1689316173; x=1691908173;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H7S31XwmBsUB/obnglHCT2VYw3df1OM91/rz41VQ+w8=;
        b=oBhQyOgvV2W/RxiF4qCQx7ilMhqDQ7OPwOf1CZ9LLfpqFqC+fQ/+JwHn6B4vMl+oNA
         6RXS+YsvWPcWdvux37wyz3iCu+GOh6W58Xj6bu5SA0170ocyOuiGjCzI401MFN1C5VOh
         ej0BL9Hd5fOtu8cwKbt3y/Zyr47eNkDMxAas0iehBHCUhbonhIdG7BvYMOuMHm6iGx25
         XmM86FlGO5bh9iOGZi20S1Ivsl9geO3l8jijYbb9rySNhG1QgL+PtJ0ppnTzDHDwSsu2
         OjYHFDt4sDJwy67i0ou1s/XlrEL9KLA1A/MCn0sIDT6c1qiRqSS9Gj4C1qfqPosqEqB7
         794Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689316173; x=1691908173;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H7S31XwmBsUB/obnglHCT2VYw3df1OM91/rz41VQ+w8=;
        b=Hu1QXWGhitFNd5H5R5U2B4wS+dCRz8I3xnQ36btFPcLTfvyOdDZjjCkENl9UobKUxK
         Dsgvz9hPXImIp9lrLYwEvws3/ZFd5ZzrAZs03H8co2XNQKgj2PT/EvSV/dTpZUVvUurY
         zwDkcoJMv01ZiQAK3DrzP3Hn++vIHxde184JM/Dr3Jv4A4S2G2STGBCnefAd4QjDkRBF
         2O7HL3VCIuTCZeLk9nKGr3+y1+luXVGyJAIfV7rVtR4kar1SuqvEE4LI4rf0MwUSx1yL
         F7XFrmeMluj02zm624YcVhbIxedjZMAH7yT17A8Ei0Axlo9gs2ISzkl4LLz+oDlEWfne
         FpEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689316173; x=1691908173;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H7S31XwmBsUB/obnglHCT2VYw3df1OM91/rz41VQ+w8=;
        b=ESLdHGrq0xCXrFfAqzLgxqxM/88GTJxUYVEcy5sSOY9uDTTGE+DDPF0XBLeUJHjVku
         zV8AKr1773aHKOEY4sg/coMzHKLWUps0sRgXKgAGVUm3pGtyj2r89Xx6+DSok3pc40Xr
         ZRXdo3LpPZEkYY0y6QKC0KIfpa9gJBbgguxoBAZBE848/SslbOa/EsxwAhcZ8fA1Szp5
         tViCLKDS9RFyS3ylBUwOTSj8BAPOk+V1PRVe6SCeAwh8EdROb16y80/iMEWtFxSx+jgi
         dAUjHM1frFacUfLnZySWHkBx12EGL++wvGbAClrWLHL6UC7TA+VtoYw7pEKFovb9HYpz
         stpQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ABy/qLaZcn3YEwbNL9dX7eKjUsCoFZ3zP0rD+rizU6pDRPfzXS/BkD+P
	HIlsbP+h0oWqWfU199gBCD0=
X-Google-Smtp-Source: APBJJlEh7oibJ2Yu6dCeBll40ukdq2SgamNoRZ97HyKG5HN6pwlUlusXTqOdwba0lQXXWT4mH1ch+Q==
X-Received: by 2002:a05:6870:c890:b0:1b0:84df:50ec with SMTP id er16-20020a056870c89000b001b084df50ecmr4470436oab.50.1689316172871;
        Thu, 13 Jul 2023 23:29:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a4a:33c8:0:b0:563:6091:747f with SMTP id q191-20020a4a33c8000000b005636091747fls1689276ooq.2.-pod-prod-05-us;
 Thu, 13 Jul 2023 23:29:32 -0700 (PDT)
X-Received: by 2002:a05:6808:309c:b0:3a4:3c6c:27a1 with SMTP id bl28-20020a056808309c00b003a43c6c27a1mr2766889oib.5.1689316171853;
        Thu, 13 Jul 2023 23:29:31 -0700 (PDT)
Date: Thu, 13 Jul 2023 23:29:31 -0700 (PDT)
From: Johnson Wang <ghost84426@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <c54d2322-fd4a-4568-bc01-8d96e83845f0n@googlegroups.com>
Subject: How the root cell access virtqueue memory created by Linux inmate
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_9064_1810074426.1689316171133"
X-Original-Sender: ghost84426@gmail.com
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

------=_Part_9064_1810074426.1689316171133
Content-Type: multipart/alternative; 
	boundary="----=_Part_9065_9510644.1689316171133"

------=_Part_9065_9510644.1689316171133
Content-Type: text/plain; charset="UTF-8"

Hi all,

Recently I am working on porting jailhouse hypervisor onto arm64 platforms.
I've brought up the root-cell and also linux non-root cell.

Now I want to make virtio-console work, I started to write my virtio B/E 
framework by reference the demo code[1]. I'm pretty sure that the ivshmem 
region is working
as virtio_ivshmem.c finishes its .probe() callback, and virtio_console.c 
has registered a hvc0 node. My virtio B/E can R/W the ivshmem region 
properly.

However, I noticed that when virtio_ivshmem.c calls 
vring_create_virtqueue() to allocate virtqueue structure, it uses inmate 
private memory to allocate it, which is inaccessible for root-cell. For 
example, the inmate memory is starting from 0x1d0c00000 and virtqueue 
structure is starting from 0x1d29be000. The virtqueue structure is 
allocated inside the inmate memory, not shared memory. This means that 
virtio B/E fails to retrieve the vring infomations.

Is it possible for root-cell to access inmate memory?
or create virtqueue in the ivshemem region that is accessible for root-cell?
Does jailhouse have any MMU translation mechanism?

Please give me some suggestion. Thanks for watching this.


[1] https://git.kiszka.org/?p=linux.git;a=commit;h=b6a3ec1cee44b986b556b60ed2368d0da1faca51

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c54d2322-fd4a-4568-bc01-8d96e83845f0n%40googlegroups.com.

------=_Part_9065_9510644.1689316171133
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,<div><br /></div><div>Recently I am working on porting jailhouse hyp=
ervisor onto arm64 platforms.</div><div>I've brought up the root-cell and a=
lso linux non-root cell.</div><div><br /></div><div>Now I want to make virt=
io-console work, I started to write my virtio B/E framework by reference th=
e demo code[1]. I'm pretty sure that the ivshmem region is working</div><di=
v>as virtio_ivshmem.c finishes its .probe() callback, and virtio_console.c =
has registered a hvc0 node. My virtio B/E can R/W the ivshmem region proper=
ly.</div><div><br /></div><div>However, I noticed that when virtio_ivshmem.=
c calls vring_create_virtqueue() to allocate virtqueue structure, it uses i=
nmate private memory to allocate it, which is=C2=A0inaccessible for root-ce=
ll. For example, the inmate memory is starting from 0x1d0c00000 and virtque=
ue structure is starting from 0x1d29be000. The virtqueue structure is alloc=
ated inside the inmate memory, not shared memory. This means that virtio B/=
E fails to retrieve the vring infomations.</div><div><br /></div><div>Is it=
 possible for root-cell to access inmate memory?</div><div>or create virtqu=
eue in the ivshemem region that is accessible for root-cell?</div><div>Does=
 jailhouse have any MMU translation=C2=A0mechanism?</div><div><br /></div><=
div>Please give me some suggestion. Thanks for watching this.</div><div><br=
 /></div><div><br /></div><div>[1]=C2=A0https://git.kiszka.org/?p=3Dlinux.g=
it;a=3Dcommit;h=3Db6a3ec1cee44b986b556b60ed2368d0da1faca51</div><div><br />=
</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/c54d2322-fd4a-4568-bc01-8d96e83845f0n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/c54d2322-fd4a-4568-bc01-8d96e83845f0n%40googlegroups.co=
m</a>.<br />

------=_Part_9065_9510644.1689316171133--

------=_Part_9064_1810074426.1689316171133--
