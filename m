Return-Path: <jailhouse-dev+bncBCV335GORINBBB46336QKGQEJT6G5VI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id 466282BA657
	for <lists+jailhouse-dev@lfdr.de>; Fri, 20 Nov 2020 10:40:25 +0100 (CET)
Received: by mail-lf1-x139.google.com with SMTP id t3sf3482771lfk.21
        for <lists+jailhouse-dev@lfdr.de>; Fri, 20 Nov 2020 01:40:25 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1605865223; cv=pass;
        d=google.com; s=arc-20160816;
        b=PvnMl7b+FRk1KmjOTBMFCaCmkznzvXAIBR01B8yOtLHHDA+15hRA5+Phog1c8QWaj/
         3/GPouwYq1Am4GcFY/lh6yCiuZGnIMvPwwudrUFLju6r2aT30cIQborP2yAWJgaOPjgZ
         uPvPtGtN91vJqWq3kCzqJ0H6H/VNr0RWS9ddrJObLBlXHQLpiJtmZu55+T/U5iUrDi/0
         N9Av7VC8HSY6fRrY4k+oHP06qFUSZSE5AYBCZUGeIA8KxH1rRVWx8Y9WociVZTbBGBuK
         pe1OJuWBH+YfKIyVq26Wfow7jWR1FhK1jKr+ciGgLm9DDumGfTfpxCvmsBmzTRM/xzv1
         c4cA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature;
        bh=OH2nXrgu+WnDwRWubADUmboazRD32m5seN+7AY+QMDc=;
        b=j4VReSDCnJ9pvi/NiVzSDapaQmwQCEkG/0NxE2RmB8ramZA6x1Q4JD3EFoR9bkjwLi
         afJZFZzmAISVWet86CN9KrDpQsK9xME0esSL1i0mJschzl2h8mb0yVEkziy1qaT5dKJL
         /PJ4oCUrZIPX0RYGkNX5ov2/U0zARZqxz5p9t/vzTHf0woxrSGz00gu6xvFQIqnWQ7dq
         GrYjeAN3eHl+VPNfSlJmu8zfG+MvVJXFycqW+sli9sr3QX7o42QVeFVQFpOHpEH1FRah
         v4QFmZs1o/mtJ39YUoYrva3lAruCxijo0yYIFAmwA+cSfyIOMz5eIbuENzPd5kPluDVu
         HZSA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u+Z2zaBd;
       spf=pass (google.com: domain of francois.ozog@linaro.org designates 2a00:1450:4864:20::234 as permitted sender) smtp.mailfrom=francois.ozog@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OH2nXrgu+WnDwRWubADUmboazRD32m5seN+7AY+QMDc=;
        b=jcbrX09fLcbbs5YlOZdWoAPK93crbhTvaZos2BhCoTBk34hGIBqNXbut4NloBhRwrW
         C4Xef1jtV1/7IFWVtFQhrPpsXLJF6OF06HjjFT62TNbBCHIBflWKvxeuBcjlgT8ZMsor
         PowcRjLADVKe23GIUF3Bn+CEnMXSQm6uLo3TMzpbZM1FW7K+teKTu/S2OSLUI5R6uIH5
         zwUR0NLqJeVMUPtfC+TilYexVxjHdiWnAW6jkvjp6w8ov71jsodvxhMnC375pOsxuKCF
         Pk0NHCvtcp1reYrF8xaQtDF9qJHVXKoA9gQEF+3v6a24ij4Gom7XItShBGzfe3cCKxfv
         G6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OH2nXrgu+WnDwRWubADUmboazRD32m5seN+7AY+QMDc=;
        b=JfMpt56/iRbX3HjDzG78SIO4aMNcgVBNItUtLmQYaG1qmHkNj+wugWvtd9Aj9ea8By
         xYXpvgAzNfQVzytkkhrwgs0jGVyXGPOxvxZtpFEjYXSoOoTAKXYC+R0sJQrlcjemWSXL
         J6XAfZgw+2gaWkUzv1MkTf0D6dZMYq9sUXHJXUCbIgOISzB7++Dl3TSWtST64SNxeoHi
         EXtBH5IZ+/mDhR2PXF1FSpMge4FYLYVAx5BTfKrsuoOmOAw3jLZeYQU5RLme8ErvPASG
         t5tf498YefSt51vI2NMhT3C7AoOyytRSJt/5+jwJu7oCtkPFFIPEsZ6UnN4V+VTjpsjE
         NNGQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533NmHvelOzgai2MWVrw+OX9dE4KtRTjPp0ICjbZs47MT5CfcZmA
	XCU2fRfGU9E02r2c0gtndCw=
X-Google-Smtp-Source: ABdhPJzwhTT2QgboOpc5Rucu6pTIaA1dYrozeA+2iu2JWjjiIKXqtc8r30X5w4nD+Iz3Fkwkp+b6lA==
X-Received: by 2002:a05:651c:2109:: with SMTP id a9mr7760430ljq.340.1605865223596;
        Fri, 20 Nov 2020 01:40:23 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:890d:: with SMTP id d13ls992219lji.2.gmail; Fri, 20 Nov
 2020 01:40:22 -0800 (PST)
X-Received: by 2002:a2e:8816:: with SMTP id x22mr7810668ljh.78.1605865222385;
        Fri, 20 Nov 2020 01:40:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605865222; cv=none;
        d=google.com; s=arc-20160816;
        b=tL8Nzq7WiWcTv57VjOWDtxsJRDnHHGISoxFcUEiSICG8+pYDkNBAgAgM7zqA+5TCcq
         IdywK4l8c74+n0r3wtGR7EE1Y/5Gfvwwk8oZ420+ARFE3U/rzYC5PTGeqKADjgsUpZp2
         iK0QHS/Bb6vMt/rXdHVMXPAS98Am9SrsWjwvItiMn7pLSHfTwpBpVgY09CqBMvGuH70S
         nVHv32ca5oF3dNv89QUNoHZNdwd7zmBksHwfROLABXBkK5+2v8PzZ05zILyGoi5GGq8v
         gm5hq/Y191csEhQ5NELtvLaZwOcGJ+Uftfu1IDMoZiydSYsUKoaTjoE2QE9Um15SXGyF
         atfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OnYQm0qbIWzrV8zB0GQKhnx411u8GlwrjufyaUGAcg0=;
        b=UxolxtSwry0e6aCHhWBSDl8BFXCPZHmF91WoHLvL3Yr+s9Uz9EQsZ/RIiov1YnijTm
         nbcs23CkFnSsc0wh5CQnu5VUx51coygCqjnfsirnVZs6LZMfOmXN7zBGk5dqdMaJcY6o
         j68G1bVGmHFJwyKoQFwXIwEb7BHhqg47rWQNVGU6eerQHTcsUaB2uyy5U2dNVXKeAkV6
         KulA4AzA5B9WyfVzpkNj3lOPFMXK0DYWnjAr7JDvAbB2wYKZWGgEACdHY12miWFFf0s7
         +39Fqub1Dnaitg0q1yZDk1A124bKMd6ONDNVK1wgjhe+RNS42REMvJEoyXvSz6HI3chQ
         Q2/g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u+Z2zaBd;
       spf=pass (google.com: domain of francois.ozog@linaro.org designates 2a00:1450:4864:20::234 as permitted sender) smtp.mailfrom=francois.ozog@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com. [2a00:1450:4864:20::234])
        by gmr-mx.google.com with ESMTPS id f5si104698ljc.0.2020.11.20.01.40.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2020 01:40:22 -0800 (PST)
Received-SPF: pass (google.com: domain of francois.ozog@linaro.org designates 2a00:1450:4864:20::234 as permitted sender) client-ip=2a00:1450:4864:20::234;
Received: by mail-lj1-x234.google.com with SMTP id o24so9370955ljj.6
        for <jailhouse-dev@googlegroups.com>; Fri, 20 Nov 2020 01:40:22 -0800 (PST)
X-Received: by 2002:a2e:3a08:: with SMTP id h8mr8096079lja.263.1605865221926;
 Fri, 20 Nov 2020 01:40:21 -0800 (PST)
MIME-Version: 1.0
References: <DB6PR0402MB276052104C2CE78B10D2BD5188E00@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <fd4ed87a-58b1-2767-8a28-f1ba335582d3@siemens.com> <DB6PR0402MB276009F841DA2D085725319688FF0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
In-Reply-To: <DB6PR0402MB276009F841DA2D085725319688FF0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Date: Fri, 20 Nov 2020 10:40:10 +0100
Message-ID: <CAHFG_=VZ2ZwV6AHLxr8zvEacfnASKef3YjbuNGeTt3zzBC9+nQ@mail.gmail.com>
Subject: Re: zephyr ARM64 SMP runs on Jailhouse
To: Peng Fan <peng.fan@nxp.com>
Cc: Jan Kiszka <jan.kiszka@siemens.com>, Kumar Gala <kumar.gala@linaro.org>, 
	"jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="0000000000001c4aee05b486a2a2"
X-Original-Sender: francois.ozog@linaro.org
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@linaro.org header.s=google header.b=u+Z2zaBd;       spf=pass
 (google.com: domain of francois.ozog@linaro.org designates
 2a00:1450:4864:20::234 as permitted sender) smtp.mailfrom=francois.ozog@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
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

--0000000000001c4aee05b486a2a2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 20 nov. 2020 =C3=A0 08:09, Peng Fan <peng.fan@nxp.com> a =C3=A9crit=
 :

> > Subject: Re: zephyr ARM64 SMP runs on Jailhouse
> >
> > On 19.11.20 03:50, Peng Fan wrote:
> > > Just share info, we have enabled zephyr ARM64 SMP on Jailhouse using
> > > i.MX8M
> > >
> >
> > This is great news, indeed! Do you need patches against Zephyr, or is
> > upstream ready for this? Would it work in qemuarm64 as well?
>
> Current upstream zephyr not support SMP, and only runs in secure world.
> So I have some patches to make it run in normal world and SMP support.

that would be great to share!

>
>
> I only did this on i.MX8MM EVK board. Qemuarm64 needs some porting
> effort. Jailhouse also needs one minor patch as below:
>
> @@ -364,15 +365,21 @@ static enum mmio_result
> gicv3_handle_redist_access(void *arg,
>         case GICR_SYNCR:
>                 mmio->value =3D 0;
>                 return MMIO_HANDLED;
> -       case GICR_CTLR:
> -       case GICR_STATUSR:
> -       case GICR_WAKER:
>         case GICR_SGI_BASE + GICR_ISENABLER:
>         case GICR_SGI_BASE + GICR_ICENABLER:
>         case GICR_SGI_BASE + GICR_ISPENDR:
>         case GICR_SGI_BASE + GICR_ICPENDR:
>         case GICR_SGI_BASE + GICR_ISACTIVER:
>         case GICR_SGI_BASE + GICR_ICACTIVER:
> +               if (this_cell() !=3D cpu_public->cell) {
> +                       /* ignore access to foreign redistributors */
> +                       return MMIO_HANDLED;
> +               }
> +               mmio->value &=3D ~(SGI_MASK | (1 << mnt_irq));
> +               break;
> +       case GICR_CTLR:
> +       case GICR_STATUSR:
> +       case GICR_WAKER:
>         case REG_RANGE(GICR_SGI_BASE + GICR_IPRIORITYR, 8, 4):
>         case REG_RANGE(GICR_SGI_BASE + GICR_ICFGR, 2, 4):
>                 if (this_cell() !=3D cpu_public->cell) {
>
>
> I'll prepare my zephyr patches to zephyr PR.
>
> Regards,
> Peng.
>
> >
> > Jan
> >
> > --
> > Siemens AG, T RDA IOT
> > Corporate Competence Center Embedded Linux
>
> --
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB276009F841DA2D=
085725319688FF0%40DB6PR0402MB2760.eurprd04.prod.outlook.com
> .
>
--=20
Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | *Director Linaro Edge & Fog Computi=
ng Group*
T: +33.67221.6485
francois.ozog@linaro.org | Skype: ffozog

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CAHFG_%3DVZ2ZwV6AHLxr8zvEacfnASKef3YjbuNGeTt3zzBC9%2BnQ%40mai=
l.gmail.com.

--0000000000001c4aee05b486a2a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Le=C2=A0ven. 20 nov. 2020 =C3=A0 08:09, Peng Fan &lt;<a hre=
f=3D"mailto:peng.fan@nxp.com">peng.fan@nxp.com</a>&gt; a =C3=A9crit=C2=A0:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-lef=
t-color:rgb(204,204,204)">&gt; Subject: Re: zephyr ARM64 SMP runs on Jailho=
use<br>
&gt; <br>
&gt; On 19.11.20 03:50, Peng Fan wrote:<br>
&gt; &gt; Just share info, we have enabled zephyr ARM64 SMP on Jailhouse us=
ing<br>
&gt; &gt; i.MX8M<br>
&gt; &gt;<br>
&gt; <br>
&gt; This is great news, indeed! Do you need patches against Zephyr, or is<=
br>
&gt; upstream ready for this? Would it work in qemuarm64 as well?<br>
<br>
Current upstream zephyr not support SMP, and only runs in secure world.<br>
So I have some patches to make it run in normal world and SMP support.</blo=
ckquote><div dir=3D"auto">that would be great to share!</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px=
;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204=
)" dir=3D"auto"><br>
<br>
I only did this on i.MX8MM EVK board. Qemuarm64 needs some porting<br>
effort. Jailhouse also needs one minor patch as below:<br>
<br>
@@ -364,15 +365,21 @@ static enum mmio_result gicv3_handle_redist_access(vo=
id *arg,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case GICR_SYNCR:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mmio-&gt;value =3D =
0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return MMIO_HANDLED=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case GICR_CTLR:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case GICR_STATUSR:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case GICR_WAKER:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case GICR_SGI_BASE + GICR_ISENABLER:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case GICR_SGI_BASE + GICR_ICENABLER:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case GICR_SGI_BASE + GICR_ISPENDR:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case GICR_SGI_BASE + GICR_ICPENDR:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case GICR_SGI_BASE + GICR_ISACTIVER:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case GICR_SGI_BASE + GICR_ICACTIVER:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (this_cell() !=
=3D cpu_public-&gt;cell) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* ignore access to foreign redistributors */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return MMIO_HANDLED;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mmio-&gt;value &amp=
;=3D ~(SGI_MASK | (1 &lt;&lt; mnt_irq));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case GICR_CTLR:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case GICR_STATUSR:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case GICR_WAKER:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case REG_RANGE(GICR_SGI_BASE + GICR_IPRIORITYR,=
 8, 4):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case REG_RANGE(GICR_SGI_BASE + GICR_ICFGR, 2, 4=
):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (this_cell() !=
=3D cpu_public-&gt;cell) {<br>
<br>
<br>
I&#39;ll prepare my zephyr patches to zephyr PR.<br>
<br>
Regards,<br>
Peng.<br>
<br>
&gt; <br>
&gt; Jan<br>
&gt; <br>
&gt; --<br>
&gt; Siemens AG, T RDA IOT<br>
&gt; Corporate Competence Center Embedded Linux<br>
<br>
-- <br>
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br>
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com" tar=
get=3D"_blank">jailhouse-dev+unsubscribe@googlegroups.com</a>.<br>
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/DB6PR0402MB276009F841DA2D085725319688FF0%40DB6PR04=
02MB2760.eurprd04.prod.outlook.com" rel=3D"noreferrer" target=3D"_blank">ht=
tps://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB276009F841DA2D0857=
25319688FF0%40DB6PR0402MB2760.eurprd04.prod.outlook.com</a>.<br>
</blockquote></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><=
div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div =
dir=3D"ltr"><div><div dir=3D"ltr"><div><div><div><div dir=3D"ltr"><div dir=
=3D"ltr"><div dir=3D"ltr"><table style=3D"font-size:small" border=3D"0" cel=
lpadding=3D"0" cellspacing=3D"0"><tbody><tr><td style=3D"padding-right:10px=
" valign=3D"top"><img src=3D"https://drive.google.com/a/linaro.org/uc?id=3D=
0BxTAygkus3RgQVhuNHMwUi1mYWc&amp;export=3Ddownload" width=3D"96" height=3D"=
53"></td><td valign=3D"top"><table border=3D"0" cellpadding=3D"0" cellspaci=
ng=3D"0"><tbody><tr><td style=3D"font-family:Arial,Helvetica,&quot;Sans Ser=
if&quot;;white-space:nowrap;font-size:9pt;padding-top:0px;color:rgb(87,87,8=
7)" valign=3D"top"><span style=3D"font-weight:bold">Fran=C3=A7ois-Fr=C3=A9d=
=C3=A9ric Ozog</span>=C2=A0<span style=3D"color:rgb(161,161,161)">|</span>=
=C2=A0<i>Director Linaro Edge &amp; Fog Computing Group</i></td></tr><tr><t=
d style=3D"font-family:Arial,Helvetica,&quot;Sans Serif&quot;;white-space:n=
owrap;font-size:9pt;padding-top:2px;color:rgb(87,87,87)" valign=3D"top">T:=
=C2=A0<a value=3D"+393384075993" style=3D"color:rgb(17,85,204)">+33.67221.6=
485</a><br><a href=3D"mailto:francois.ozog@linaro.org" style=3D"color:rgb(8=
7,87,87);text-decoration:none" target=3D"_blank">francois.ozog@linaro.org</=
a>=C2=A0<span style=3D"color:rgb(161,161,161)">|</span>=C2=A0Skype:=C2=A0ff=
ozog</td></tr></tbody></table></td></tr></tbody></table></div></div></div><=
/div></div><div><div><br style=3D"font-size:small"></div></div></div></div>=
</div></div></div></div></div></div></div></div></div></div></div></div></d=
iv>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAHFG_%3DVZ2ZwV6AHLxr8zvEacfnASKef3YjbuNGeTt3zzBC9=
%2BnQ%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://grou=
ps.google.com/d/msgid/jailhouse-dev/CAHFG_%3DVZ2ZwV6AHLxr8zvEacfnASKef3Yjbu=
NGeTt3zzBC9%2BnQ%40mail.gmail.com</a>.<br />

--0000000000001c4aee05b486a2a2--
