Return-Path: <jailhouse-dev+bncBCZKXDNMZALBB56L2LUQKGQE4LZJLZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x339.google.com (mail-ot1-x339.google.com [IPv6:2607:f8b0:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id E052D6F46F
	for <lists+jailhouse-dev@lfdr.de>; Sun, 21 Jul 2019 19:50:48 +0200 (CEST)
Received: by mail-ot1-x339.google.com with SMTP id f11sf20992118otq.3
        for <lists+jailhouse-dev@lfdr.de>; Sun, 21 Jul 2019 10:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=GANHtSLvylxUvObOp8Pfl1h+aJ71ibv6RBH5UsA6FuI=;
        b=Hqv1edSkmR8SHxVJqDO575jpiBdaeRIlg7MxqVDNakFjmBa54qkfmv38+BDPPxLqVT
         +RzwEIXfglhK9Zw00MXzwQSUjOqpHugMCAoWCkhKookRsECvtRROE/CReB3169FiwE9y
         RP/NkWplJJEtduAZ1lBUSJUYvP0AHMKZbp8snY2H1f0sOtHNTE7BphbPmptnA2ljNCe6
         mH+Wf2aiARg0viK/x6TOuoq7M4DUWSzWtddHk5eoHmikqDVWAfXpVtXVIAmrpjb4NTo9
         Da9ac30C9uAZotyQGE2ed1fZI5kAbD0QbI9zyWCkv0AJPZAZG+VwKLR6lWIpMvFl34zJ
         bZnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=GANHtSLvylxUvObOp8Pfl1h+aJ71ibv6RBH5UsA6FuI=;
        b=pbCtdETq7RzjSmhH5bZG6Wej79jajNw6QAJ+3NpTb0lMCv7VcmEupRmmvxpHYz2mFD
         1JzMu2FBnXRjx8E7KAwA3Olx9Y/R4HKbDOk8zPMUCnCvOQoqi6TOooO0sR54EgCM8oOG
         A9oB48NDqq3PNnoC1sAnxl77GLaFDDIEeUSjb8r9eJp3k6P383RgkYl4Rn471eJtqJTt
         fw9nGe0X8O3N7wkKIQnH4wVPZwRD8ihDtgnhgXJ1X1UL/Vfta9W35ChbPyTCYPk5vsNf
         0GNS0gqxH5wN4G9PScPdAurrQq3BoF/pWCxutOAz5Sk0Q8kIaQhYxr9IUSR1e2BPUc02
         8tFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=GANHtSLvylxUvObOp8Pfl1h+aJ71ibv6RBH5UsA6FuI=;
        b=C1r4FhPzMS42p6Iv1hq3JS9y0Zao+GwAyCELn7vfXHS5yruw3l00LP6EMs1oeJtJ+1
         Oa9ma6Pk+ET1IZPG6L1kMNny3R7pegrfDVD3wO0dRAP/4Y68pvkKR1RaFQ8RpcxwXM1F
         vLRpk4/zra/TqMO7Sf7cMGrr1iTwtEZRoYFc6i1l3BRIebKsbULqDJzv2ymzqOzTF0S3
         tB0u3lQhBkRl1jlPd0OXWtunfiU3RjKm/VHbt2Obat4MpZJ0okG7Z0rHoJRStKK6AYyM
         CbWD6EaYf0mwNfJLWSznSdDAUxMNvhpe0XOhnBUXTIw2vlRK+ZMUl0GyEgqzos3hLG6V
         JAAQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW/Znq5uSgJrtI/ah0S2LlTWS0npXKeQJEw2c5+aMSda+etFuIO
	nkCEbuI9q0NHQipauc3olcI=
X-Google-Smtp-Source: APXvYqz+0QD7Dk+XStPWL87ttEguoWEyyg2KESoQK/xcr4lCOha2U9fD4o1GYkuQ7z3lyt+D/b8bkQ==
X-Received: by 2002:a9d:7a4e:: with SMTP id z14mr21253566otm.258.1563731447453;
        Sun, 21 Jul 2019 10:50:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:3ea:: with SMTP id f97ls6967153otf.5.gmail; Sun, 21 Jul
 2019 10:50:46 -0700 (PDT)
X-Received: by 2002:a05:6830:148c:: with SMTP id s12mr25804852otq.274.1563731446714;
        Sun, 21 Jul 2019 10:50:46 -0700 (PDT)
Date: Sun, 21 Jul 2019 10:50:46 -0700 (PDT)
From: Alejandro Largacha <alexlargacha@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <b4070ff0-8c14-4153-9e35-f82884fb8ae4@googlegroups.com>
In-Reply-To: <d4ba7f75-12df-829b-c740-f3e5f55b609c@web.de>
References: <CANdaEOi5f13kg0OF+6iYrzmoJUTOhtgu4=r+0Vt+ZQ4oTtf1DQ@mail.gmail.com>
 <a1ea8f98-2709-d789-8564-6c719b58526c@siemens.com>
 <e10f5a45-4913-4b28-b896-0ac6b381e183@googlegroups.com>
 <47b00372-adcd-da18-8553-d7085bc6e049@siemens.com>
 <1fcf087a-14f5-4b96-b95b-bbbd9dafc9b8@googlegroups.com>
 <d4ba7f75-12df-829b-c740-f3e5f55b609c@web.de>
Subject: Re: PL interrupt in UltraZed
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_5137_1534062975.1563731446130"
X-Original-Sender: alexlargacha@gmail.com
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

------=_Part_5137_1534062975.1563731446130
Content-Type: multipart/alternative; 
	boundary="----=_Part_5138_1715276875.1563731446130"

------=_Part_5138_1715276875.1563731446130
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the reply. It really pointed me in the right way.

The inmate didn't crash when issuing the first mmio access, but it was=20
because I had overlapping memory regions.
My AXI GPIO address was the same as the communication area.
I changed the hardware design in Vivado to get different addresses and=20
then, as you said, I needed the "map_range" call.
It all worked as expected now.

Thank you very much.

El s=C3=A1bado, 20 de julio de 2019, 4:44:56 (UTC+2), Jan Kiszka escribi=C3=
=B3:
>
> On 20.07.19 00:58, Alejandro Largacha wrote:=20
> > I just tried and did not work. I don't know what I'm missing=20
> > I attach the config and the demo code=20
> >=20
>
> Config looks good, but your inmate should crash when issuing the first=20
> mmio=20
> accesses because you didn't map them into the inmate address space. Try=
=20
> adding=20
>
> map_range(GPIO_SWITCH_BASE_ADDRESS, 0x2000, MAP_UNCACHED);=20
>
> before the first access.=20
>
> Jan=20
>
> > El viernes, 19 de julio de 2019, 7:08:41 (UTC+2), Jan Kiszka escribi=C3=
=B3:=20
> >=20
> >     On 19.07.19 01:32, Alejandro Largacha wrote:=20
> >     > Hello,=20
> >     >=20
> >     > Thank you very much for the reply. I tried adding the irqchip=20
> entry to the=20
> >     cell config but no success. I have a doubt about the pin_bitmap=20
> entry. Is it=20
> >     divided in 4 groups of 32 bits? Then, how should be the entry like=
=20
> for the=20
> >     irq num 136. Like this?=20
> >     >=20
> >     > .irqchips =3D {=20
> >     >            /* GIC */ {=20
> >     >                .address =3D 0xf9010000,=20
> >     >                .pin_base =3D 32,=20
> >=20
> >     This means bit 0 in the first word of pin_bitmap encodes GIC=20
> interrupt 32.=20
> >     Then,=20
> >     when that bit is set, permission is granted.=20
> >=20
> >     >                .pin_bitmap =3D {=20
> >     >                    1 << (54 - 32),=20
> >=20
> >     So this one grants access to GIC int 54 - not sure if you need that=
.=20
> >=20
> >     >                    0,=20
> >     >                    0,=20
> >     >                    1 << (136 - 128)=20
> >=20
> >     And this permits access to int 136 because this 4th word controls=
=20
> interrupts=20
> >     128-159.=20
> >=20
> >     Did you already try out the config?=20
> >=20
> >     Jan=20
> >=20
> >     >                },=20
> >     >            },=20
> >     >        }=20
> >     >=20
> >     >=20
> >     > I attach my new cell config file.=20
> >     >=20
> >     > El mi=C3=A9rcoles, 10 de julio de 2019, 7:20:56 (UTC+2), Jan Kisz=
ka=20
>  escribi=C3=B3:=20
> >     >> On 10.07.19 06:57, Alejandro Largacha wrote:=20
> >     >>> Hello,=20
> >     >>>=20
> >     >>> I have been paying with jailhouse in a UltraZed SoM with=20
> AES-ZU-IOCC-G=20
> >     carrier=20
> >     >>> card from avnet.=20
> >     >>> So far, I have been able to enable the root cell, create a=20
> aremetal cell=20
> >     where I=20
> >     >>> was able to load the baremetal=20
> >     >>> examples like gic-demo and a custom one where I was able to tur=
n=20
> on some=20
> >     leds=20
> >     >>> via axi gpio in PL side.=20
> >     >>>=20
> >     >>> Now I'm trying to run an example where I can catch the interrup=
t=20
> from an=20
> >     axi=20
> >     >>> gpio in PL and I am not able to do that.=20
> >     >>> I'm using PL to PS interrupts in my design and the signal is=20
> being=20
> >     generated. I=20
> >     >>> also tested with Xilinx SDK.=20
> >     >>> I tried with PS to PL group 0 and group 1. Irq numbers 121 and=
=20
> 136 and no=20
> >     >>> success. I don't know what I'm missing.=20
> >     >>> I attach the cells and the demo source.=20
> >     >>>=20
> >     >>=20
> >     >> Your baremetal cell config is not permitting the cell access to=
=20
> the GIC=20
> >     >> interrupt 136 you are using. Replicate the irqchip entry and=20
> create bitmask=20
> >     >> where only bit 136 - 32 (32 is the base) is set. See also other=
=20
> examples=20
> >     >> in-tree, including those for the zcu102 or the ultra96. Both=20
> grant their=20
> >     >> non-root linux cells access to certain interrupts.=20
> >     >>=20
> >     >> Jan=20
> >     >>=20
> >     >> --=20
> >     >> Siemens AG, Corporate Technology, CT RDA IOT SES-DE=20
> >     >> Corporate Competence Center Embedded Linux=20
> >     >=20
> >=20
> >     --=20
> >     Siemens AG, Corporate Technology, CT RDA IOT SES-DE=20
> >     Corporate Competence Center Embedded Linux=20
> >=20
> > --=20
> > You received this message because you are subscribed to the Google=20
> Groups=20
> > "Jailhouse" group.=20
> > To unsubscribe from this group and stop receiving emails from it, send=
=20
> an email=20
> > to jailho...@googlegroups.com <javascript:>=20
> > <mailto:jailhouse-dev+unsubscribe@googlegroups.com <javascript:>>.=20
> > To view this discussion on the web visit=20
> >=20
> https://groups.google.com/d/msgid/jailhouse-dev/1fcf087a-14f5-4b96-b95b-b=
bbd9dafc9b8%40googlegroups.com=20
> > <
> https://groups.google.com/d/msgid/jailhouse-dev/1fcf087a-14f5-4b96-b95b-b=
bbd9dafc9b8%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.=20
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/b4070ff0-8c14-4153-9e35-f82884fb8ae4%40googlegroups.com.

------=_Part_5138_1715276875.1563731446130
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks for the reply. It really pointed me in the rig=
ht way.</div><div><br></div><div>The inmate didn&#39;t crash when issuing t=
he first mmio access, but it was because I had overlapping memory regions.<=
/div><div>My AXI GPIO address was the same as the communication area.</div>=
<div>I changed the hardware design in Vivado to get different addresses and=
 then, as you said, I needed the &quot;map_range&quot; call.</div><div>It a=
ll worked as expected now.</div><div><br></div><div>Thank you very much.<br=
></div><br>El s=C3=A1bado, 20 de julio de 2019, 4:44:56 (UTC+2), Jan Kiszka=
  escribi=C3=B3:<blockquote class=3D"gmail_quote" style=3D"margin: 0;margin=
-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">On 20.07.19 00=
:58, Alejandro Largacha wrote:
<br>&gt; I just tried and did not work. I don&#39;t know what I&#39;m missi=
ng
<br>&gt; I attach the config and the demo code
<br>&gt;
<br>
<br>Config looks good, but your inmate should crash when issuing the first =
mmio
<br>accesses because you didn&#39;t map them into the inmate address space.=
 Try adding
<br>
<br>map_range(GPIO_SWITCH_BASE_<wbr>ADDRESS, 0x2000, MAP_UNCACHED);
<br>
<br>before the first access.
<br>
<br>Jan
<br>
<br>&gt; El viernes, 19 de julio de 2019, 7:08:41 (UTC+2), Jan Kiszka escri=
bi=C3=B3:
<br>&gt;
<br>&gt; =C2=A0 =C2=A0 On 19.07.19 01:32, Alejandro Largacha wrote:
<br>&gt; =C2=A0 =C2=A0 &gt; Hello,
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; Thank you very much for the reply. I tried addi=
ng the irqchip entry to the
<br>&gt; =C2=A0 =C2=A0 cell config but no success. I have a doubt about the=
 pin_bitmap entry. Is it
<br>&gt; =C2=A0 =C2=A0 divided in 4 groups of 32 bits? Then, how should be =
the entry like for the
<br>&gt; =C2=A0 =C2=A0 irq num 136. Like this?
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; .irqchips =3D {
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* GIC=
 */ {
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0.address =3D 0xf9010000,
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0.pin_base =3D 32,
<br>&gt;
<br>&gt; =C2=A0 =C2=A0 This means bit 0 in the first word of pin_bitmap enc=
odes GIC interrupt 32.
<br>&gt; =C2=A0 =C2=A0 Then,
<br>&gt; =C2=A0 =C2=A0 when that bit is set, permission is granted.
<br>&gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0.pin_bitmap =3D {
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A01 &lt;&lt; (54 - 32),
<br>&gt;
<br>&gt; =C2=A0 =C2=A0 So this one grants access to GIC int 54 - not sure i=
f you need that.
<br>&gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00,
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00,
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A01 &lt;&lt; (136 - 128)
<br>&gt;
<br>&gt; =C2=A0 =C2=A0 And this permits access to int 136 because this 4th =
word controls interrupts
<br>&gt; =C2=A0 =C2=A0 128-159.
<br>&gt;
<br>&gt; =C2=A0 =C2=A0 Did you already try out the config?
<br>&gt;
<br>&gt; =C2=A0 =C2=A0 Jan
<br>&gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0},
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0}
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; I attach my new cell config file.
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; El mi=C3=A9rcoles, 10 de julio de 2019, 7:20:56=
 (UTC+2), Jan Kiszka =C2=A0escribi=C3=B3:
<br>&gt; =C2=A0 =C2=A0 &gt;&gt; On 10.07.19 06:57, Alejandro Largacha wrote=
:
<br>&gt; =C2=A0 =C2=A0 &gt;&gt;&gt; Hello,
<br>&gt; =C2=A0 =C2=A0 &gt;&gt;&gt;
<br>&gt; =C2=A0 =C2=A0 &gt;&gt;&gt; I have been paying with jailhouse in a =
UltraZed SoM with AES-ZU-IOCC-G
<br>&gt; =C2=A0 =C2=A0 carrier
<br>&gt; =C2=A0 =C2=A0 &gt;&gt;&gt; card from avnet.
<br>&gt; =C2=A0 =C2=A0 &gt;&gt;&gt; So far, I have been able to enable the =
root cell, create a aremetal cell
<br>&gt; =C2=A0 =C2=A0 where I
<br>&gt; =C2=A0 =C2=A0 &gt;&gt;&gt; was able to load the baremetal
<br>&gt; =C2=A0 =C2=A0 &gt;&gt;&gt; examples like gic-demo and a custom one=
 where I was able to turn on some
<br>&gt; =C2=A0 =C2=A0 leds
<br>&gt; =C2=A0 =C2=A0 &gt;&gt;&gt; via axi gpio in PL side.
<br>&gt; =C2=A0 =C2=A0 &gt;&gt;&gt;
<br>&gt; =C2=A0 =C2=A0 &gt;&gt;&gt; Now I&#39;m trying to run an example wh=
ere I can catch the interrupt from an
<br>&gt; =C2=A0 =C2=A0 axi
<br>&gt; =C2=A0 =C2=A0 &gt;&gt;&gt; gpio in PL and I am not able to do that=
.
<br>&gt; =C2=A0 =C2=A0 &gt;&gt;&gt; I&#39;m using PL to PS interrupts in my=
 design and the signal is being
<br>&gt; =C2=A0 =C2=A0 generated. I
<br>&gt; =C2=A0 =C2=A0 &gt;&gt;&gt; also tested with Xilinx SDK.
<br>&gt; =C2=A0 =C2=A0 &gt;&gt;&gt; I tried with PS to PL group 0 and group=
 1. Irq numbers 121 and 136 and no
<br>&gt; =C2=A0 =C2=A0 &gt;&gt;&gt; success. I don&#39;t know what I&#39;m =
missing.
<br>&gt; =C2=A0 =C2=A0 &gt;&gt;&gt; I attach the cells and the demo source.
<br>&gt; =C2=A0 =C2=A0 &gt;&gt;&gt;
<br>&gt; =C2=A0 =C2=A0 &gt;&gt;
<br>&gt; =C2=A0 =C2=A0 &gt;&gt; Your baremetal cell config is not permittin=
g the cell access to the GIC
<br>&gt; =C2=A0 =C2=A0 &gt;&gt; interrupt 136 you are using. Replicate the =
irqchip entry and create bitmask
<br>&gt; =C2=A0 =C2=A0 &gt;&gt; where only bit 136 - 32 (32 is the base) is=
 set. See also other examples
<br>&gt; =C2=A0 =C2=A0 &gt;&gt; in-tree, including those for the zcu102 or =
the ultra96. Both grant their
<br>&gt; =C2=A0 =C2=A0 &gt;&gt; non-root linux cells access to certain inte=
rrupts.
<br>&gt; =C2=A0 =C2=A0 &gt;&gt;
<br>&gt; =C2=A0 =C2=A0 &gt;&gt; Jan
<br>&gt; =C2=A0 =C2=A0 &gt;&gt;
<br>&gt; =C2=A0 =C2=A0 &gt;&gt; --
<br>&gt; =C2=A0 =C2=A0 &gt;&gt; Siemens AG, Corporate Technology, CT RDA IO=
T SES-DE
<br>&gt; =C2=A0 =C2=A0 &gt;&gt; Corporate Competence Center Embedded Linux
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt;
<br>&gt; =C2=A0 =C2=A0 --
<br>&gt; =C2=A0 =C2=A0 Siemens AG, Corporate Technology, CT RDA IOT SES-DE
<br>&gt; =C2=A0 =C2=A0 Corporate Competence Center Embedded Linux
<br>&gt;
<br>&gt; --
<br>&gt; You received this message because you are subscribed to the Google=
 Groups
<br>&gt; &quot;Jailhouse&quot; group.
<br>&gt; To unsubscribe from this group and stop receiving emails from it, =
send an email
<br>&gt; to <a href=3D"javascript:" target=3D"_blank" gdf-obfuscated-mailto=
=3D"KuTQ_YYBBAAJ" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;javascri=
pt:&#39;;return true;" onclick=3D"this.href=3D&#39;javascript:&#39;;return =
true;">jailho...@<wbr>googlegroups.com</a>
<br>&gt; &lt;mailto:<a href=3D"javascript:" target=3D"_blank" gdf-obfuscate=
d-mailto=3D"KuTQ_YYBBAAJ" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;=
javascript:&#39;;return true;" onclick=3D"this.href=3D&#39;javascript:&#39;=
;return true;">jailhouse-dev+<wbr>unsubscribe@googlegroups.com</a>&gt;.
<br>&gt; To view this discussion on the web visit
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/1fcf087=
a-14f5-4b96-b95b-bbbd9dafc9b8%40googlegroups.com" target=3D"_blank" rel=3D"=
nofollow" onmousedown=3D"this.href=3D&#39;https://groups.google.com/d/msgid=
/jailhouse-dev/1fcf087a-14f5-4b96-b95b-bbbd9dafc9b8%40googlegroups.com&#39;=
;return true;" onclick=3D"this.href=3D&#39;https://groups.google.com/d/msgi=
d/jailhouse-dev/1fcf087a-14f5-4b96-b95b-bbbd9dafc9b8%40googlegroups.com&#39=
;;return true;">https://groups.google.com/d/<wbr>msgid/jailhouse-dev/1fcf08=
7a-<wbr>14f5-4b96-b95b-bbbd9dafc9b8%<wbr>40googlegroups.com</a>
<br>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/1fc=
f087a-14f5-4b96-b95b-bbbd9dafc9b8%40googlegroups.com?utm_medium=3Demail&amp=
;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" onmousedown=3D"thi=
s.href=3D&#39;https://groups.google.com/d/msgid/jailhouse-dev/1fcf087a-14f5=
-4b96-b95b-bbbd9dafc9b8%40googlegroups.com?utm_medium\x3demail\x26utm_sourc=
e\x3dfooter&#39;;return true;" onclick=3D"this.href=3D&#39;https://groups.g=
oogle.com/d/msgid/jailhouse-dev/1fcf087a-14f5-4b96-b95b-bbbd9dafc9b8%40goog=
legroups.com?utm_medium\x3demail\x26utm_source\x3dfooter&#39;;return true;"=
>https://groups.google.com/d/<wbr>msgid/jailhouse-dev/1fcf087a-<wbr>14f5-4b=
96-b95b-bbbd9dafc9b8%<wbr>40googlegroups.com?utm_medium=3D<wbr>email&amp;ut=
m_source=3Dfooter</a>&gt;.
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/b4070ff0-8c14-4153-9e35-f82884fb8ae4%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/b4070ff0-8c14-4153-9e35-f82884fb8ae4%40googlegroups.com<=
/a>.<br />

------=_Part_5138_1715276875.1563731446130--

------=_Part_5137_1534062975.1563731446130--
