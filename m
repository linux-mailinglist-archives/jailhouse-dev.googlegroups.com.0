Return-Path: <jailhouse-dev+bncBCR7PPMN34DRBXPO2XVAKGQESYXCY2Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33d.google.com (mail-ot1-x33d.google.com [IPv6:2607:f8b0:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 406FB8EF24
	for <lists+jailhouse-dev@lfdr.de>; Thu, 15 Aug 2019 17:16:47 +0200 (CEST)
Received: by mail-ot1-x33d.google.com with SMTP id g1sf2460352otr.10
        for <lists+jailhouse-dev@lfdr.de>; Thu, 15 Aug 2019 08:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=bvCnlmwPSCS3qLvgFSK2jc+C+2ePq7q4fcYr2ELX3Z0=;
        b=C59PkXcoCpQHrXflGUa4dCVE8RhzfQ5RCXq+TNOjCKXKhmj1oJ8gRomTlqHE5aLfGr
         Ngz35qpM0zBGjqDQL5HNDSP27KYvoDXANYQ5mNs3ZxshLBkDRHCjO3j3/kvyuuzch2nj
         IQUQ+akR19hKZiY/Z08HtIdj8MGL2Wkih91tlo6STOj2Vxrb89Aq27FHQ2/ERSYdyKTT
         pp1e8fbijSfwjvT0RJ/UpXlaum1Uo12HZI1HzPzu1pLUug3ykqWrCZFpa2EotPn+Ebz9
         ouhT8PKsdZhkqinE84B8Qo69GRQMnC4CiEX/zEqgrfUgIk5D6YDK1jUpCerhc36osPJ8
         LYPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=bvCnlmwPSCS3qLvgFSK2jc+C+2ePq7q4fcYr2ELX3Z0=;
        b=G6QfNMQZDwAgnGyfHcPDlujEjyvQAgzm1NORhfAd+8Nbv5FSscwoIEVqif1vdfosAx
         R1YBad1piDiCmYtNF+XaG0ZpRKR9aEQ3DXT3YrUjzulNt4zBMhnN7UYZVURvLIN/0GXj
         xSA9Avj2nK+tNE9T7yAUMWHcb2TH7DTIN9EcodU3HnRpmEu0HFuttXUtI/Gx/isxW6Ud
         ELRjz2rj0J28rVmAf1vzWaZ8ss06O9dsT+zN/quIBTCvj+DCT1C36+d9ZHt4/tBw2YkA
         Hdc6p8w+oYlfoqNB1RIvttr9G4H98x+8IDAaGdGzR30d/mhEcRotCKBUrsTursTNFyR3
         j1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=bvCnlmwPSCS3qLvgFSK2jc+C+2ePq7q4fcYr2ELX3Z0=;
        b=VbjhcHRajMaUPvppWN1FxzYF0AVIHsacyxwGuumI43zBUBbbZnxd6GvVugVdiyrTs/
         cIyX0kX+PsT8t21OSKXMS3HiIBvLf6AhNZNUJgPWAkDZWomvKLwpY5MfAVgObWaPKBhv
         ACQuHCTOXOBf6/Eh5BnN8RWgCLMVDjOeLFhYrj7uqmI7T5p4k57Rh63HWvKXuQ6PPkt+
         kj5oGNQLUlMUTrlJFSLDtiTRyKDnDC2ydP4GF2+Ud/lRq77xUM3dNg3KQ14QPmhmVYFX
         OYBiTNyomFgWhYqODQWPGWG220c+VZROKSIKBrELVpWvpIM5u3SRIjXZ3Lwd3bXokCWK
         JPIw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUYxNDHttNCiesgKFaLndsbL+T04W0t3oLz+0+BnQV3dCBSSIOl
	e9zHL2e0lrjFCRw5fc7mceU=
X-Google-Smtp-Source: APXvYqzD4EdxAXYjkQ6cS7R2uYzS8g3qg3/hz9SU2vsOZcaC1AbUpsT9yKUOYxFi9TK/ZH+28vK+rg==
X-Received: by 2002:aca:bc06:: with SMTP id m6mr1995162oif.65.1565882205484;
        Thu, 15 Aug 2019 08:16:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:dd09:: with SMTP id u9ls252531oig.6.gmail; Thu, 15 Aug
 2019 08:16:45 -0700 (PDT)
X-Received: by 2002:aca:5509:: with SMTP id j9mr1762684oib.138.1565882204746;
        Thu, 15 Aug 2019 08:16:44 -0700 (PDT)
Date: Thu, 15 Aug 2019 08:16:43 -0700 (PDT)
From: =?UTF-8?Q?Jo=C3=A3o_Reis?= <jpagsreis@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <c183c116-5942-4d08-a0a7-a897e8fbed20@googlegroups.com>
In-Reply-To: <df7be3b4-a447-0ff1-f43b-ee37bf6513bb@web.de>
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
Subject: Re: Colored Linux as inmate
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2758_1023289800.1565882203962"
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

------=_Part_2758_1023289800.1565882203962
Content-Type: multipart/alternative; 
	boundary="----=_Part_2759_1019267432.1565882203962"

------=_Part_2759_1019267432.1565882203962
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Why do i need to set a ivshmem-net link between root and non-root=20
cell? What is the use of it (difference to normal ivshmem)? To share=20
devices? Does it allow me to use ssh to issue commands from Linux root cell=
?

domingo, 11 de Agosto de 2019 =C3=A0s 18:45:08 UTC+1, Jan Kiszka escreveu:
>
> On 11.08.19 03:47, Jo=C3=A3o Reis wrote:=20
> > In my case, the only command i need to issue in Linux non-root, is to=
=20
> execute a=20
> > code. So, if there is a way to issue a single command to Linux non-root=
=20
> without=20
> > needing to have a single UART for Linux non-root, it could do it too.=
=20
> >=20
>
> You can set up an ivshmem-net link, like in the head-less=20
> zynqmp-zcu102-linux-demo-2.=20
>
> Jan=20
>
> PS: Still need to look into the cell-linux issue...=20
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c183c116-5942-4d08-a0a7-a897e8fbed20%40googlegroups.com.

------=_Part_2759_1019267432.1565882203962
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Why do i need to set a ivshmem-net link between root and n=
on-root cell?=C2=A0What is the use of it (difference to normal ivshmem)? To=
 share devices? Does it allow me to use ssh to issue commands from Linux ro=
ot cell?<br><br>domingo, 11 de Agosto de 2019 =C3=A0s 18:45:08 UTC+1, Jan K=
iszka escreveu:<blockquote class=3D"gmail_quote" style=3D"margin: 0;margin-=
left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">On 11.08.19 03:=
47, Jo=C3=A3o Reis wrote:
<br>&gt; In my case, the only command i need to issue in Linux non-root, is=
 to execute a
<br>&gt; code. So, if there is a way to issue a single command to Linux non=
-root without
<br>&gt; needing to have a single UART for Linux non-root, it could do it t=
oo.
<br>&gt;
<br>
<br>You can set up an ivshmem-net link, like in the head-less
<br>zynqmp-zcu102-linux-demo-2.
<br>
<br>Jan
<br>
<br>PS: Still need to look into the cell-linux issue...
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/c183c116-5942-4d08-a0a7-a897e8fbed20%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/c183c116-5942-4d08-a0a7-a897e8fbed20%40googlegroups.com<=
/a>.<br />

------=_Part_2759_1019267432.1565882203962--

------=_Part_2758_1023289800.1565882203962--
