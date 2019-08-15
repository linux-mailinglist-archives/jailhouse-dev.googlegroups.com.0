Return-Path: <jailhouse-dev+bncBCR7PPMN34DRBMHL23VAKGQE6WNV3VY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23c.google.com (mail-oi1-x23c.google.com [IPv6:2607:f8b0:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D3E8F4E8
	for <lists+jailhouse-dev@lfdr.de>; Thu, 15 Aug 2019 21:42:42 +0200 (CEST)
Received: by mail-oi1-x23c.google.com with SMTP id k22sf1963570oic.6
        for <lists+jailhouse-dev@lfdr.de>; Thu, 15 Aug 2019 12:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7SpWj+wL2HBam8YwPx7lJrgFn2b/k+aoLZFjQJ/bGSk=;
        b=UUPz7tQsM9KeHJgbjwWjh54cYUMiXC2PaGSKMOYoSoCPPVr555T+78UUOwgCIcbVJi
         VzP25OMFk/ursa6yo4kqWYXcjI/f98Op2DQS8JDz5ewSopsVZdGe1mxfd9MZTqbkYEbt
         8YoEl+BLqa8flttbyrImy79M4ISKE7p4BB5rWrOnZ6lTE4/wHilCzoM0zJsTkZaQMe3l
         k/Br1IQvxyZM+prOORBNVXxwhdLXmdsDwCvT3zUTAbb5YaHk+w5mesPdTXkgVfpPOlyY
         MXGLiZ41faMtxqGhfpaeFX2i0Lp6149ThVC9rmLwChOr5IfLSVemJ8omLIUFHwiDMUTa
         FOPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7SpWj+wL2HBam8YwPx7lJrgFn2b/k+aoLZFjQJ/bGSk=;
        b=IXph2S8rAwz+NdWQHhgZndD0uxUiilE8+zipVPswxrb3OBS68P0BCFrk9wz8ylbnnl
         QHwoOpoVnn3lpnnPFCkRT/hgGAUC+fvlpgusqNNBqCuGTSjeBH8VBQT1nf0Z3Afu13S4
         n8hPA9/uxORi366BwoNzmn9SfSu5Pu8Yh49dchIs7QDPunfjGnhT/BUpnwoZYfxcaXYT
         Jq7wMjj7HMixzd52PxEzD30RbNthIrRPGkul+v6USHy6vHofqC2qodHFpslNNfiTnb1R
         Ih8m2vl/hl39xAamQkCl/hZIdACBkTDgEqYSMIiJoPpv2xcnpx3xjRC/udHYxgTt8JP9
         jE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=7SpWj+wL2HBam8YwPx7lJrgFn2b/k+aoLZFjQJ/bGSk=;
        b=sC/L5lrexqucsni46sJ9K0CMLLadbodB/api9L3c8EaV6U/hmMCIq4yUWkm6d9/frD
         aU9L0Ss7v9lTAxzFrX0+I98CnfhzVloe2HisWuXYrqeelZncgaBtawUKwNyqV+WlUsIf
         yhPw3DMmaQRoJD03Iih+7gPQ0uNExwCpYftiUBHKHBSlhxwRgMfL8fQx61Vl48Q2VksB
         3ZNw215b+dp4338qNFQL0RIoDyZdZr6ZRg/XivAr3TjXjZk5pB51xhH+TiU+Jj5NLQc2
         lxVZY8sIt6ylVPydOjyP5ydjgDUL0XcWWBkojSWD1cTl/akzfEgtw/WWRpclKnnAvsvU
         HAxw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVIfY3/eb+5JjHNiyhKupwBXZlNJCDp8P1PY5rluXBH6/NtZRIp
	zUjlBPF5GkH5C12InKz/H2c=
X-Google-Smtp-Source: APXvYqzMyIbGXL/G4QpgrhBP7rZb0I4OgAf7RjdylvznM0JeTNSPJThVIae23IoxDEb3kS8fG2vqLg==
X-Received: by 2002:aca:c588:: with SMTP id v130mr2477219oif.165.1565898161062;
        Thu, 15 Aug 2019 12:42:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:6343:: with SMTP id y3ls1225088otk.7.gmail; Thu, 15 Aug
 2019 12:42:40 -0700 (PDT)
X-Received: by 2002:a9d:7f0f:: with SMTP id j15mr1527193otq.156.1565898160425;
        Thu, 15 Aug 2019 12:42:40 -0700 (PDT)
Date: Thu, 15 Aug 2019 12:42:39 -0700 (PDT)
From: =?UTF-8?Q?Jo=C3=A3o_Reis?= <jpagsreis@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <6dfd2128-011a-420f-860f-4ccb472c079f@googlegroups.com>
In-Reply-To: <c183c116-5942-4d08-a0a7-a897e8fbed20@googlegroups.com>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <ef7a124c-e5e3-f61b-8ed0-aebf585c65d6@siemens.com>
 <dde1cd0e-407e-45b3-ae32-97c445100824@googlegroups.com>
 <2f6c0983-78e1-73e0-183c-3983dd757ee8@siemens.com>
 <39b83770-5562-437f-a25b-415d85dc7c3b@googlegroups.com>
 <94e3009c-aa34-e8f1-b503-d3a8b138d9a9@siemens.com>
 <43d8fdde-153f-40ec-8974-4388efab8315@googlegroups.com>
 <c30da773-76bd-3691-3828-e8f7ed592d52@siemens.com>
 <12a82b12-b9bd-4258-87fb-9525f4bb648a@googlegroups.com>
 <5fe86ed7-e82f-3fef-6eef-a888e4ef6be7@siemens.com>
 <1ebfd29b-3c2d-490d-bd2d-c7cbdad1507c@googlegroups.com>
 <164159e0-478e-c5e9-fc8a-e0c0cb27da7a@siemens.com>
 <f1de42fc-bae2-4962-ace6-a38e99a441d4@googlegroups.com>
 <dd33650a-c068-52ca-4da7-4537de652bfa@siemens.com>
 <82a56f53-a498-4a27-8458-250d9a7e7078@googlegroups.com>
 <211c06d2-9f92-cbd1-8215-12c577eefa62@siemens.com>
 <2add490d-0d13-44f6-9873-d7fcbf1c4141@googlegroups.com>
 <2dc2470b-9494-4f43-a582-06c2558fa985@googlegroups.com>
 <df7be3b4-a447-0ff1-f43b-ee37bf6513bb@web.de>
 <c183c116-5942-4d08-a0a7-a897e8fbed20@googlegroups.com>
Subject: Re: Colored Linux as inmate
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3364_1769477342.1565898159638"
X-Original-Sender: jpagsreis@gmail.com
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

------=_Part_3364_1769477342.1565898159638
Content-Type: multipart/alternative; 
	boundary="----=_Part_3365_1383273793.1565898159638"

------=_Part_3365_1383273793.1565898159638
Content-Type: text/plain; charset="UTF-8"

From what i understood about VETH, is that Linux root cell and Linux 
non-root cell will be linked, and each command i will issue to root cell 
will be forwarded to non-root cell, through that tunnel created by 
ivshmem-net, right? Doesn't that mean that the command will be executed in 
both cells?

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6dfd2128-011a-420f-860f-4ccb472c079f%40googlegroups.com.

------=_Part_3365_1383273793.1565898159638
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">From what i understood about VETH, is that Linux root cell=
 and Linux non-root cell will be linked, and each command i will issue to r=
oot cell will be forwarded to non-root cell, through that tunnel created by=
 ivshmem-net, right? Doesn&#39;t that mean that the command will be execute=
d in both cells?</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/6dfd2128-011a-420f-860f-4ccb472c079f%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/6dfd2128-011a-420f-860f-4ccb472c079f%40googlegroups.com<=
/a>.<br />

------=_Part_3365_1383273793.1565898159638--

------=_Part_3364_1769477342.1565898159638--
