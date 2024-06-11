Return-Path: <jailhouse-dev+bncBD2MTMWYXMHRBFOZUCZQMGQEKGXQ4HI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb40.google.com (mail-yb1-xb40.google.com [IPv6:2607:f8b0:4864:20::b40])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F9B903956
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2024 12:53:11 +0200 (CEST)
Received: by mail-yb1-xb40.google.com with SMTP id 3f1490d57ef6-df7bdb0455bsf8486232276.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2024 03:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1718103190; x=1718707990; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lPPO2g6KPmcad8ODGqlFmy0oppFpvAXGRkuzTCTGm9s=;
        b=ui5HlU7lOVRVWH3KLh7YS0pCu9nIkzJ4+v8QGkh3C6u/V2JM8jIsXDHmekLMf33z5S
         7jRX2pqy0F7hbGRpr8FLFjmy3as7dPDMRD75pcooDzbRV9wBPLHRTrJDNWQkBtk9pURb
         /tCFs8woC8Zu4LqPpo6dUMgcX+AE+/HisUO0ymc6to4nhnoyYreYgkaF1TleuzyXIWw/
         Q6o5cn2W2YWQ3731y5cLgesnmOqNlXeLbXvBuUg8QstARSqKNatqn9Cq3jYUSvEejiZW
         LOh5XevADFlYULTqrov3X95VZYb2uVVaWeWU8Ur/VN5QaBCtcNeNrHoEK2WKWOxxv0w8
         qGag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718103190; x=1718707990; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lPPO2g6KPmcad8ODGqlFmy0oppFpvAXGRkuzTCTGm9s=;
        b=W66+WZ67PHpYj4+nZFU/oQgPZM1RW4neN0YALWkKuWs6yBjedBHM8HVKunz3g3at46
         vPylkGnylJE8g8Weth6RFhP2DRPpR3wVRP4v05t0zbYZFd0TUSfVH9TbHeCFQLwey+PA
         q1pkNfU5OgwOvEAaVxlxg+NW/Kwwdph3n1DqOD7ZDykUtIDlAdluIzApbTnG7kbAva7W
         /LtfZ5JXiVDqSI2a8Nt5QtDLHmm8Dx3hnPN01IUlEhGlj+hTMzZnaNgWlMkBsX7sXGJt
         1Y5ToT4bokJ2rDc1PivL5ChPOi79p3OcsStdjggNyIZrw88OL4rhoi5+Qj/f+uuh3VLd
         yJhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718103190; x=1718707990;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lPPO2g6KPmcad8ODGqlFmy0oppFpvAXGRkuzTCTGm9s=;
        b=faHpNcQv6y3qsR55cqjDkzun9uvA/x8lyuyB8ocELiY7Rk+qUjVXP4bA+tUrE5Ewgj
         q5c0XRBJwiYbVrplGFQyFhR8IR1edxgrdzHVcT7kwVdO+LTveztrTbbSN1yeuoMeI2QT
         9ANyIqeHgu9t50BGSTDfzeBbBxSFm2AgD1t8HFL7cI2aqZgfRuyTLh1Rq3XuA8GMyAWN
         c2ahXLF9FVS3nFa1IYn7lQbtSMN9gUgcHyLTSblti4m7tBsrUabK9z7HtbEBq2yn/IXZ
         cAJj1fGqhdyfbxnB2p6kd1v7WOTNIxqsQozp+Uqu8P6RhnYslQyk2gL1jFfZQYyaUVVn
         nReg==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCW5eA4EjcuuDTj6wEXkDuvQ9sjx9xzxjF6bzj0oubXW3VmV0pcM0rYNV9tbc5smjW+j7Y2E1RIULcNiWBvFtqutWqnFn1DYZrCR6GM=
X-Gm-Message-State: AOJu0YxoSfIL8xZx6I2VeEQxrMPusjwdQVE4ShFedBSvXznj80srdPgT
	aMCjdv0m7zI0a6FovyQMbkTU8qIdtY3u635X4ure3B0VbLEFzzR1
X-Google-Smtp-Source: AGHT+IHakxwtMfxxiZPc1TLaenl54q8jqVFFT0Pup7i04hvDIz9TmaW/hANcYNCFJQMxCvw2tCFQPQ==
X-Received: by 2002:a25:b21d:0:b0:dfa:b4f5:2bae with SMTP id 3f1490d57ef6-dfaf65e640bmr11032882276.16.1718103190367;
        Tue, 11 Jun 2024 03:53:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:fc09:0:b0:dfa:77ba:dc1f with SMTP id 3f1490d57ef6-dfaf162a805ls6122037276.2.-pod-prod-06-us;
 Tue, 11 Jun 2024 03:53:08 -0700 (PDT)
X-Received: by 2002:a25:6f08:0:b0:deb:88f5:fa10 with SMTP id 3f1490d57ef6-dfaf652eb7bmr2759965276.5.1718103187761;
        Tue, 11 Jun 2024 03:53:07 -0700 (PDT)
Date: Tue, 11 Jun 2024 03:53:06 -0700 (PDT)
From: "https://deltacartstore.com/" <thomasfrankline0@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <13550f2d-5902-468a-8fcc-849a5daafb01n@googlegroups.com>
In-Reply-To: <00efaad9-c84e-4a0f-b16e-512d1351ca2c@googlegroups.com>
References: <00efaad9-c84e-4a0f-b16e-512d1351ca2c@googlegroups.com>
Subject: Re: jailhouse + ZCU102 V1.0 + second UART problem + petalinux
 2017.4
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_67659_342420944.1718103186701"
X-Original-Sender: thomasfrankline0@gmail.com
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

------=_Part_67659_342420944.1718103186701
Content-Type: multipart/alternative; 
	boundary="----=_Part_67660_88985125.1718103186701"

------=_Part_67660_88985125.1718103186701
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

We are world wide best online psychedelic  shop, more importantly, you can=
=20
easily get your stuffs discreetly and fast, again where to buy magic=20
mushrooms online in USA ship discreet. Buying magic mushrooms online is one=
=20
of the difficulties depressed people face daily. In Australia, USA, UK,=20
Canada etc. Buy Magic Mushrooms Online Seattle.=20


 order directly from our website=20

https://deltacartstore.com/
https://deltacartstore.com/
https://deltacartstore.com/

100% discreet and confidential,
-Your personal information is 100% SECURE.
-Your orders are 100% secure and anonymous.
-Fast delivery worldwide (you can track the shipment with the provided=20
tracking number).   =20

On Wednesday, June 27, 2018 at 9:33:04=E2=80=AFAM UTC-7 christophe...@gmail=
.com=20
wrote:

> hi all,
>
> i'm trying to make jailhouse work on my ZCU102 v1.0 (production)
> using petalinux 2017.4 following this documentation :=20
>
>
> https://github.com/siemens/jailhouse/blob/master/Documentation/setup-on-z=
ynqmp-zcu102.md
>
>
> the second uart doesn't work. After a question on the Xilinx forum
>
>
> https://forums.xilinx.com/t5/Embedded-Linux/ZCU102-V1-0-petalinux-2017-4-=
ttyPS1-uart-doesn-t-work/m-p/867113/highlight/false#M26987
>
> i can activate /dev/ttyPS1 on the zcu102 and verify it using=20
>
> echo hello > /dev/ttyPS1
>
> but i still can't use it with jailhouse.
>
>
> i have checked with the gic-demo and linux-demo without any success.
> i can use the debug console with gic-demo, but that's all.
>
> this command should work, but it doesn't :=20
>
> jailhouse cell linux zynqmp-zcu102-linux-demo.cell Image -d=20
> inmate-zynqmp-zcu102.dtb -i rootfs.cpio -c "console=3DttyPS1,115200"
>
>
> in the zynqmp-zcu102-linux-demo.c file, the uart address is correct :=20
>
> .mem_regions =3D {
> /* UART */ {
> .phys_start =3D 0xff010000,
> .virt_start =3D 0xff010000,
> .size =3D 0x1000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
> },
>
> what can i do ?
>
> regards
> C.Alexandre
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/13550f2d-5902-468a-8fcc-849a5daafb01n%40googlegroups.com.

------=_Part_67660_88985125.1718103186701
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

We are world wide best online psychedelic =C2=A0shop, more importantly, you=
 can easily get your stuffs discreetly and fast, again where to buy magic m=
ushrooms online in USA ship discreet. Buying magic mushrooms online is one =
of the difficulties depressed people face daily. In Australia, USA, UK, Can=
ada etc. Buy Magic Mushrooms Online Seattle. <br /><br /><br />=C2=A0order =
directly from our website <br /><br />https://deltacartstore.com/<br />http=
s://deltacartstore.com/<br />https://deltacartstore.com/<br /><br />100% di=
screet and confidential,<br />-Your personal information is 100% SECURE.<br=
 />-Your orders are 100% secure and anonymous.<br />-Fast delivery worldwid=
e (you can track the shipment with the provided tracking number).=C2=A0 =C2=
=A0=C2=A0<br /><br /><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"=
gmail_attr">On Wednesday, June 27, 2018 at 9:33:04=E2=80=AFAM UTC-7 christo=
phe...@gmail.com wrote:<br/></div><blockquote class=3D"gmail_quote" style=
=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding=
-left: 1ex;">hi all,<p>i&#39;m trying to make jailhouse work on my ZCU102 v=
1.0 (production)<br>using petalinux 2017.4 following this documentation : <=
p><a href=3D"https://github.com/siemens/jailhouse/blob/master/Documentation=
/setup-on-zynqmp-zcu102.md" target=3D"_blank" rel=3D"nofollow" data-safered=
irecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://github.com/s=
iemens/jailhouse/blob/master/Documentation/setup-on-zynqmp-zcu102.md&amp;so=
urce=3Dgmail&amp;ust=3D1718189563050000&amp;usg=3DAOvVaw3kfxSLzB4Tff7Mja5Y_=
mwG">https://github.com/siemens/jailhouse/blob/master/Documentation/setup-o=
n-zynqmp-zcu102.md</a><p><br>the second uart doesn&#39;t work. After a ques=
tion on the Xilinx forum<p><a href=3D"https://forums.xilinx.com/t5/Embedded=
-Linux/ZCU102-V1-0-petalinux-2017-4-ttyPS1-uart-doesn-t-work/m-p/867113/hig=
hlight/false#M26987" target=3D"_blank" rel=3D"nofollow" data-saferedirectur=
l=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://forums.xilinx.com/t=
5/Embedded-Linux/ZCU102-V1-0-petalinux-2017-4-ttyPS1-uart-doesn-t-work/m-p/=
867113/highlight/false%23M26987&amp;source=3Dgmail&amp;ust=3D17181895630500=
00&amp;usg=3DAOvVaw0rhH9aryG0NTwVnFimyw4N">https://forums.xilinx.com/t5/Emb=
edded-Linux/ZCU102-V1-0-petalinux-2017-4-ttyPS1-uart-doesn-t-work/m-p/86711=
3/highlight/false#M26987</a><p>i can activate /dev/ttyPS1 on the zcu102 and=
 verify it using <p> echo hello &gt; /dev/ttyPS1<p>but i still can&#39;t us=
e it with jailhouse.<p><br>i have checked with the gic-demo and linux-demo =
without any success.<br>i can use the debug console with gic-demo, but that=
&#39;s all.<p>this command should work, but it doesn&#39;t : <p>jailhouse c=
ell linux zynqmp-zcu102-linux-demo.cell Image -d inmate-zynqmp-zcu102.dtb -=
i rootfs.cpio -c &quot;console=3DttyPS1,115200&quot;<p><br>in the zynqmp-zc=
u102-linux-demo.c file, the uart address is correct : <p>	.mem_regions =3D =
{<br>		/* UART */ {<br>			.phys_start =3D 0xff010000,<br>			.virt_start =3D=
 0xff010000,<br>			.size =3D 0x1000,<br>			.flags =3D JAILHOUSE_MEM_READ | =
JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,<b=
r>		},<p>what can i do ?<p>regards<br>C.Alexandre</p></p></p></p></p></p></=
p></p></p></p></p></p></p></p></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/13550f2d-5902-468a-8fcc-849a5daafb01n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/13550f2d-5902-468a-8fcc-849a5daafb01n%40googlegroups.co=
m</a>.<br />

------=_Part_67660_88985125.1718103186701--

------=_Part_67659_342420944.1718103186701--
