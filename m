Return-Path: <jailhouse-dev+bncBDFMXFHWY4HBBU6O4GYAMGQEQCHS5BY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3a.google.com (mail-yb1-xb3a.google.com [IPv6:2607:f8b0:4864:20::b3a])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AA68A21DC
	for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Apr 2024 00:42:29 +0200 (CEST)
Received: by mail-yb1-xb3a.google.com with SMTP id 3f1490d57ef6-dc6dbdcfd39sf557719276.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Apr 2024 15:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1712875348; x=1713480148; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FEMLOryBMYwUGJaxw5k0lBsAmRNoDOw5TdQadiE6l/4=;
        b=INJxYP28JUPyG+CbvZvnB8f0/zC1k5JSUIhUW+YhFtkyGMXwE+DGd5nNENH8mZzB7I
         aiFY2JlaAw11GaHou71UltbGcd8A4vJAc8PTf++9QDaOxyCp1T1tvUqyoTVIah4Cjs7+
         EQK4Wo43d2G5RQGB0dbOaVmSNkYZUb8VyzWw0fUa3zqVxM+HAeVAZ5b2b2apJP4rP6nV
         Finu3pqsW71HsH2H70bSATWrXFNCoo55PkiNp+rpvtGghfkVbAHaMHM1+duvNJlDnDdg
         QQ0BsqKFzasDPosPpBABvdrLOvweMukP76igUDlrKsMg9rSTnoLkrdgewJtL6jCRD12t
         u6lQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712875348; x=1713480148; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FEMLOryBMYwUGJaxw5k0lBsAmRNoDOw5TdQadiE6l/4=;
        b=aMBgAAvS0AB7+BCBrl+3f9i/yBWkoJQUsX3iZUFWH3sRJmq/k/clgZ9XZkTflcxv9n
         3BYvc4H7otlXPFPWbHNeLTjmxRRt2j45Aonclg2LaVcXjDBRhAJAf9oHXKLIz6ga/g7E
         iEfCP3jW9lvBmqe06tcTqbel8ZmduH54CZiRdBgy4v1ZOlWJkN0oai5JxNqJHOFJsD9y
         GFgWX92iw1RRhiFpUVXftqZy6wsncnB7V5CZ+Qp3vnlmZfLrIvzkWpGN7miIrw7zzWlx
         gUn8blF6z7iWleNdOLlRCuuyiM1J4RTB0qZvJTdM+xySiVJQ7VxisbXOmgv8AqIiuhTA
         YR6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712875348; x=1713480148;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FEMLOryBMYwUGJaxw5k0lBsAmRNoDOw5TdQadiE6l/4=;
        b=c39dutdhmh8TG/P8Vc4237wL0s2VLHQi/3z8MY7SM/HASI48m5VC5jmAGBoM3XrwD9
         C6HCa4eGMhqRU7eMsl24hJ0Q5JSuBr3l9Xs0m/V7U5WWW72Z5q4KiTlkA8nZN6uJnjhO
         tiByT22p5sp478D3mNDvARdobqThix3tFyGXEOcPiKUwnePWvwloK75XDzozDj7U4VBw
         Ke608uHz+BxXF49rTtNq0DKkNlRlBGKjjVXS+1P5M7tZLyVvaAUGLHK/Gf63JHIqmb9i
         2LzOcyLIDzEG2nzcAMPkoOz2qwXqxleKE/GjFxIMx83Frfg5AimSRBrgkGb7j2PBOTKM
         uYbw==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCVFKUT9msYBYHiA8QilDoc0Dr6dYCRcssglz0EjMfkTXoA45vZ6KL5g+OOnOzEas7SogEWzLPgrQ008PVumtn9Naau14aUdUe99ERQ=
X-Gm-Message-State: AOJu0YwvvnSSNhfal3/jYR6Tn3B2LIplO3uKoXglO0nGwLggC2kLqztk
	sAAZ74KH3K9CcWKKgnunFozbC19KZSXNarUx/fCKV5IunHW05+bS
X-Google-Smtp-Source: AGHT+IHCdMccPdOb59QZ3/5l7XyDk60F60b2dtU8pO7seLouxhWd5p3GC8icSu+0pkv/JcJDfnu0jg==
X-Received: by 2002:a05:6902:136b:b0:dcc:2f94:591a with SMTP id bt11-20020a056902136b00b00dcc2f94591amr926279ybb.12.1712875348616;
        Thu, 11 Apr 2024 15:42:28 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:c447:0:b0:dcd:202d:6be8 with SMTP id u68-20020a25c447000000b00dcd202d6be8ls471010ybf.2.-pod-prod-08-us;
 Thu, 11 Apr 2024 15:42:27 -0700 (PDT)
X-Received: by 2002:a25:aac1:0:b0:de1:d50:ad47 with SMTP id t59-20020a25aac1000000b00de10d50ad47mr243206ybi.13.1712875346964;
        Thu, 11 Apr 2024 15:42:26 -0700 (PDT)
Date: Thu, 11 Apr 2024 15:42:26 -0700 (PDT)
From: Di Majo Massimiliano <massimilianodimajo097@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <48c5d6a9-60bf-4c79-ab16-799add45753fn@googlegroups.com>
In-Reply-To: <f882f247-b4b7-44f3-a820-235c30453d7c@oth-regensburg.de>
References: <CAGA=GbzmH9eiuBrKjVeeKf--5fRFVGxwyCe6D20e4MDn66d3tw@mail.gmail.com>
 <3acdd865-1303-4ba1-8c4c-9fc3ca8d2c67@oth-regensburg.de>
 <4cf5731e-a3ff-47ca-a1d7-c4f11a9e096bn@googlegroups.com>
 <f882f247-b4b7-44f3-a820-235c30453d7c@oth-regensburg.de>
Subject: Re: CPU shows offline - Jailhouse Linux inmate
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_202526_634897700.1712875346110"
X-Original-Sender: massimilianodimajo097@gmail.com
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

------=_Part_202526_634897700.1712875346110
Content-Type: multipart/alternative; 
	boundary="----=_Part_202527_135087558.1712875346110"

------=_Part_202527_135087558.1712875346110
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

MT103/202 DIRECT WIRE TRANSFER
PAYPAL TRANSFER
CASHAPP TRANSFER
ZELLE TRANSFER
LOAN DEAL
TRANSFER WISE
WESTERN UNION TRANSFER
BITCOIN FLASHING
BANK ACCOUNT LOADING/FLASHING
IBAN TO IBAN TRANSFER
MONEYGRAM TRANSFER
IPIP/DTC
SLBC PROVIDER
CREDIT CARD TOP UP
DUMPS/ PINS
SEPA TRANSFER
WIRE TRANSFER
BITCOIN TOP UP
GLOBALPAY INC US
SKRILL USA
UNIONPAY RECEIVER

Thanks.


NOTE; ONLY SERIOUS / RELIABLE RECEIVERS CAN CONTACT.

DM ME ON WHATSAPP
+44 7529 555638

On Sunday, October 22, 2023 at 8:33:20=E2=80=AFPM UTC+1 Ralf Ramsauer wrote=
:

> Hi Bharathiraja,
>
> On 20/10/2023 15:50, Bharathiraja Nallathambi wrote:
> > Hi Ralf,
> >=20
> > Thanks for providing the suggestion, with the boot log, we found the=20
> > below message,
> >=20
> > /[    0.045828] psci: no cpu_on method, not booting CPU1/
>
> Hmm.
>
> >=20
> > We went on updating the inmate Linux dts with the following node,
> >=20
> > /psci {
> > compatible =3D "arm,psci-1.0";
> > method =3D "smc";
> > };/
>
> The device trees are in jailhouse upstream, right? Actually,
> 'enable-method =3D "psci";' in the cpu section of the dt was sufficient s=
o=20
> far. Maybe this changed to cpu-on? It might be that your change is=20
> required for more recent kernel versions.
>
> If so, patches welcome! :-)
>
> Thanks,
> Ralf
>
>
> >=20
> > Now we are able to see both the CPUs enabled and working as expected
> >=20
> > /[    0.003483] CPU1: Booted secondary processor 0x0000000003=20
> [0x410fd083]/
> >=20
> > Thanks for the support.
> >=20
> > Thanks and Regards,
> > Bharathiraja Nallathambi
> >=20
> > On Wednesday, 11 October 2023 at 01:26:19 UTC+5:30 Ralf Ramsauer wrote:
> >=20
> >=20
> >=20
> > On 10/10/2023 17:17, Bharathiraja Nallathambi wrote:
> > > Hi,
> > >
> > > I was trying jailhouse with a linux inmate on an imx8mp-evk board. I
> > > have created a yocto build with jailhouse and linux kernel
> > 6.1.22-rt8
> > > which is having the patches for real time linux.
> > > Booted the board with running run '/jh_mmcboot/' in the uboot
> > prompt.
> > >
> > >  Once logged into the device, I have started the jailhouse by=20
> > running,
> > >
> > > /cd /usr/share/jailhouse/scripts && ./init_jailhouse_env.sh && cp
> > > /run/media/boot-mmcblk1p1/Image
> > /usr/share/jailhouse/inmates/kernel/ &&
> > > ../tools/jailhouse enable ../cells/imx8mp.cell; jailhouse cell
> > list;/
> > >
> > >  the above command will load the jailhouse.ko and will enable the
> > jailhouse
> > >
> > > I got the output of 'jailhouse cell list' as,
> > > /root@imx8mp-lpddr4-evk:/usr/share/jailhouse/scripts# jailhouse
> > cell list
> > > ID      Name                    State             Assigned
> > > CPUs           Failed CPUs
> > > 0       imx8mp                  running           0-3 /
> > >
> > >  Then I started the linux inmate, the CPU offset in the cell
> > > configuration is 0xc which will assign two cores. I am using the
> > same
> > > host kernal image for the inmate also (6.1.22-rt8). Used the below
> > > command to start the inmate
> > >
> > > ../tools/jailhouse cell linux ../cells/imx8mp-linux-demo.cell
> > > ../inmates/kernel/Image -d ../inmates/dtb/inmate-imx8mp-evk.dtb -c
> > > "clk_ignore_unused console=3Dttymxc3,115200
> > > earlycon=3Dec_imx6q,0x30890000,115200 root=3D/dev/mmcblk2p2 rootwait
> > rw";
> > > jailhouse cell list;
> > >
> > >  I got the output of 'jailhouse cell list' as,
> > >
> > > /root@imx8mp-lpddr4-evk:/usr/share/jailhouse/scripts# jailhouse
> > cell list
> > > ID      Name                    State             Assigned
> > > CPUs           Failed CPUs
> > > 0       imx8mp                  running           0-1
> > > 1       linux-inmate-demo       running           2-3 /
> > >
> > >  I could login to the inmate using serial console. But the output of
> > > 'cat /proc/cpuinfo' is showing only one core.
> > >
> > > /root@imx8mp-lpddr4-evk:~# cat /proc/cpuinfo
> > > processor       : 0
> > > BogoMIPS        : 16.66
> > > Features        : fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid
> > > CPU implementer : 0x41
> > > U architecture: 8
> > > CPU variant     : 0x0
> > > CPU part        : 0xd03
> > > CPU resion      : 4/
> > >
> > > the 'nproc --all' is giving 2
> > >
> > >  It looks like 2 cores are assigned to the inmate but one of the
> > core
> > > is offline.
> > >
> > > / root@imx8mp-lpddr4-evk:/usr/share/jailhouse/scripts# cat
> > > /sys/devices/system/cpu/cpu0/online /
> > >
> > > /1
> > > root@imx8mp-lpddr4-evk:/usr/share/jailhouse/scripts# cat
> > > /sys/devices/system/cpu/cpu1/online
> > > 0/
> > >
> > >  Am I doing something wrong? How can I turn on both the CPUS for the
> > > inmate.
> >=20
> > What does the non-root Linux kernel console output during boot? Are
> > there any error messages that might give you a hint why bringing up
> > secondary CPUs failed?
> >=20
> > Ralf
> >=20
> > >
> > > Thanks and Regards,
> > > Bharathiraja Nallathambi
> > >
> > > --
> > > You received this message because you are subscribed to the Google
> > > Groups "Jailhouse" group.
> > > To unsubscribe from this group and stop receiving emails from it,
> > send
> > > an email to jailhouse-de...@googlegroups.com
> > > <mailto:jailhouse-de...@googlegroups.com>.
> > > To view this discussion on the web visit
> > >
> >=20
> https://groups.google.com/d/msgid/jailhouse-dev/CAGA%3DGbzmH9eiuBrKjVeeKf=
--5fRFVGxwyCe6D20e4MDn66d3tw%40mail.gmail.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/CAGA%3DGbzmH9eiuBrKjVeeKf=
--5fRFVGxwyCe6D20e4MDn66d3tw%40mail.gmail.com>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/CAGA%3DGbzmH9eiuBrKjVeeKf=
--5fRFVGxwyCe6D20e4MDn66d3tw%40mail.gmail.com?utm_medium=3Demail&utm_source=
=3Dfooter=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/CAGA%3DGbzmH9eiuBrKjVeeKf=
--5fRFVGxwyCe6D20e4MDn66d3tw%40mail.gmail.com?utm_medium=3Demail&utm_source=
=3Dfooter
> >>.
> >=20
> > --=20
> > You received this message because you are subscribed to the Google=20
> > Groups "Jailhouse" group.
> > To unsubscribe from this group and stop receiving emails from it, send=
=20
> > an email to jailhouse-de...@googlegroups.com=20
> > <mailto:jailhouse-de...@googlegroups.com>.
> > To view this discussion on the web visit=20
> >=20
> https://groups.google.com/d/msgid/jailhouse-dev/4cf5731e-a3ff-47ca-a1d7-c=
4f11a9e096bn%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/4cf5731e-a3ff-47ca-a1d7-c=
4f11a9e096bn%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
> >.
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/48c5d6a9-60bf-4c79-ab16-799add45753fn%40googlegroups.com.

------=_Part_202527_135087558.1712875346110
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

MT103/202 DIRECT WIRE TRANSFER<br />PAYPAL TRANSFER<br />CASHAPP TRANSFER<b=
r />ZELLE TRANSFER<br />LOAN DEAL<br />TRANSFER WISE<br />WESTERN UNION TRA=
NSFER<br />BITCOIN FLASHING<br />BANK ACCOUNT LOADING/FLASHING<br />IBAN TO=
 IBAN TRANSFER<br />MONEYGRAM TRANSFER<br />IPIP/DTC<br />SLBC PROVIDER<br =
/>CREDIT CARD TOP UP<br />DUMPS/ PINS<br />SEPA TRANSFER<br />WIRE TRANSFER=
<br />BITCOIN TOP UP<br />GLOBALPAY INC US<br />SKRILL USA<br />UNIONPAY RE=
CEIVER<br /><br />Thanks.<br /><br /><br />NOTE; ONLY SERIOUS / RELIABLE RE=
CEIVERS CAN CONTACT.<br /><br />DM ME ON WHATSAPP<br />+44 7529 555638<br /=
><br /><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On=
 Sunday, October 22, 2023 at 8:33:20=E2=80=AFPM UTC+1 Ralf Ramsauer wrote:<=
br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; b=
order-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">Hi Bharathira=
ja,
<br>
<br>On 20/10/2023 15:50, Bharathiraja Nallathambi wrote:
<br>&gt; Hi Ralf,
<br>&gt;=20
<br>&gt; Thanks for providing the suggestion, with the boot log, we found t=
he=20
<br>&gt; below message,
<br>&gt;=20
<br>&gt; /[ =C2=A0 =C2=A00.045828] psci: no cpu_on method, not booting CPU1=
/
<br>
<br>Hmm.
<br>
<br>&gt;=20
<br>&gt; We went on updating the inmate Linux dts with the following node,
<br>&gt;=20
<br>&gt; /psci {
<br>&gt; compatible =3D &quot;arm,psci-1.0&quot;;
<br>&gt; method =3D &quot;smc&quot;;
<br>&gt; };/
<br>
<br>The device trees are in jailhouse upstream, right? Actually,
<br>&#39;enable-method =3D &quot;psci&quot;;&#39; in the cpu section of the=
 dt was sufficient so=20
<br>far. Maybe this changed to cpu-on? It might be that your change is=20
<br>required for more recent kernel versions.
<br>
<br>If so, patches welcome! :-)
<br>
<br>Thanks,
<br>   Ralf
<br>
<br>
<br>&gt;=20
<br>&gt; Now we are able to see both the CPUs enabled and working as expect=
ed
<br>&gt;=20
<br>&gt; /[ =C2=A0 =C2=A00.003483] CPU1: Booted secondary processor 0x00000=
00003 [0x410fd083]/
<br>&gt;=20
<br>&gt; Thanks for the support.
<br>&gt;=20
<br>&gt; Thanks and Regards,
<br>&gt; Bharathiraja Nallathambi
<br>&gt;=20
<br>&gt; On Wednesday, 11 October 2023 at 01:26:19 UTC+5:30 Ralf Ramsauer w=
rote:
<br>&gt;=20
<br>&gt;=20
<br>&gt;=20
<br>&gt;     On 10/10/2023 17:17, Bharathiraja Nallathambi wrote:
<br>&gt;      &gt; Hi,
<br>&gt;      &gt;
<br>&gt;      &gt; I was trying jailhouse with a linux inmate on an imx8mp-=
evk board. I
<br>&gt;      &gt; have created a yocto build with jailhouse and linux kern=
el
<br>&gt;     6.1.22-rt8
<br>&gt;      &gt; which is having the patches for real time linux.
<br>&gt;      &gt; Booted the board with running run &#39;/jh_mmcboot/&#39;=
 in the uboot
<br>&gt;     prompt.
<br>&gt;      &gt;
<br>&gt;      &gt; =C2=A0Once logged into the device, I have started the ja=
ilhouse by=20
<br>&gt;     running,
<br>&gt;      &gt;
<br>&gt;      &gt; /cd /usr/share/jailhouse/scripts &amp;&amp; ./init_jailh=
ouse_env.sh &amp;&amp; cp
<br>&gt;      &gt; /run/media/boot-mmcblk1p1/Image
<br>&gt;     /usr/share/jailhouse/inmates/kernel/ &amp;&amp;
<br>&gt;      &gt; ../tools/jailhouse enable ../cells/imx8mp.cell; jailhous=
e cell
<br>&gt;     list;/
<br>&gt;      &gt;
<br>&gt;      &gt; =C2=A0the above command will load the jailhouse.ko and w=
ill enable the
<br>&gt;     jailhouse
<br>&gt;      &gt;
<br>&gt;      &gt; I got the output of &#39;jailhouse cell list&#39; as,
<br>&gt;      &gt; /root@imx8mp-lpddr4-evk:/usr/share/jailhouse/scripts# ja=
ilhouse
<br>&gt;     cell list
<br>&gt;      &gt; ID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Name=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 State=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 Assigned
<br>&gt;      &gt; CPUs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 Failed CPUs
<br>&gt;      &gt; 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 imx8mp=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 running=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0-3 /
<br>&gt;      &gt;
<br>&gt;      &gt; =C2=A0Then I started the linux inmate, the CPU offset in=
 the cell
<br>&gt;      &gt; configuration is 0xc which will assign two cores. I am u=
sing the
<br>&gt;     same
<br>&gt;      &gt; host kernal image for the inmate also (6.1.22-rt8). Used=
 the below
<br>&gt;      &gt; command to start the inmate
<br>&gt;      &gt;
<br>&gt;      &gt; ../tools/jailhouse cell linux ../cells/imx8mp-linux-demo=
.cell
<br>&gt;      &gt; ../inmates/kernel/Image -d ../inmates/dtb/inmate-imx8mp-=
evk.dtb -c
<br>&gt;      &gt; &quot;clk_ignore_unused console=3Dttymxc3,115200
<br>&gt;      &gt; earlycon=3Dec_imx6q,0x30890000,115200 root=3D/dev/mmcblk=
2p2 rootwait
<br>&gt;     rw&quot;;
<br>&gt;      &gt; jailhouse cell list;
<br>&gt;      &gt;
<br>&gt;      &gt; =C2=A0I got the output of &#39;jailhouse cell list&#39; =
as,
<br>&gt;      &gt;
<br>&gt;      &gt; /root@imx8mp-lpddr4-evk:/usr/share/jailhouse/scripts# ja=
ilhouse
<br>&gt;     cell list
<br>&gt;      &gt; ID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Name=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 State=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 Assigned
<br>&gt;      &gt; CPUs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 Failed CPUs
<br>&gt;      &gt; 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 imx8mp=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 running=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0-1
<br>&gt;      &gt; 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 linux-inmate-demo=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 running=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2-3 /
<br>&gt;      &gt;
<br>&gt;      &gt; =C2=A0I could login to the inmate using serial console. =
But the output of
<br>&gt;      &gt; &#39;cat /proc/cpuinfo&#39; is showing only one core.
<br>&gt;      &gt;
<br>&gt;      &gt; /root@imx8mp-lpddr4-evk:~# cat /proc/cpuinfo
<br>&gt;      &gt; processor=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 0
<br>&gt;      &gt; BogoMIPS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 16.=
66
<br>&gt;      &gt; Features=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : fp =
asimd evtstrm aes pmull sha1 sha2 crc32 cpuid
<br>&gt;      &gt; CPU implementer : 0x41
<br>&gt;      &gt; U architecture: 8
<br>&gt;      &gt; CPU variant=C2=A0=C2=A0=C2=A0=C2=A0 : 0x0
<br>&gt;      &gt; CPU part=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 0xd=
03
<br>&gt;      &gt; CPU resion=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 4/
<br>&gt;      &gt;
<br>&gt;      &gt; the &#39;nproc --all&#39; is giving 2
<br>&gt;      &gt;
<br>&gt;      &gt; =C2=A0It looks like 2 cores are assigned to the inmate b=
ut one of the
<br>&gt;     core
<br>&gt;      &gt; is offline.
<br>&gt;      &gt;
<br>&gt;      &gt; /=C2=A0root@imx8mp-lpddr4-evk:/usr/share/jailhouse/scrip=
ts# cat
<br>&gt;      &gt; /sys/devices/system/cpu/cpu0/online /
<br>&gt;      &gt;
<br>&gt;      &gt; /1
<br>&gt;      &gt; root@imx8mp-lpddr4-evk:/usr/share/jailhouse/scripts# cat
<br>&gt;      &gt; /sys/devices/system/cpu/cpu1/online
<br>&gt;      &gt; 0/
<br>&gt;      &gt;
<br>&gt;      &gt; =C2=A0Am I doing something wrong? How can I turn on both=
 the CPUS for the
<br>&gt;      &gt; inmate.
<br>&gt;=20
<br>&gt;     What does the non-root Linux kernel console output during boot=
? Are
<br>&gt;     there any error messages that might give you a hint why bringi=
ng up
<br>&gt;     secondary CPUs failed?
<br>&gt;=20
<br>&gt;     Ralf
<br>&gt;=20
<br>&gt;      &gt;
<br>&gt;      &gt; Thanks and Regards,
<br>&gt;      &gt; Bharathiraja Nallathambi
<br>&gt;      &gt;
<br>&gt;      &gt; --
<br>&gt;      &gt; You received this message because you are subscribed to =
the Google
<br>&gt;      &gt; Groups &quot;Jailhouse&quot; group.
<br>&gt;      &gt; To unsubscribe from this group and stop receiving emails=
 from it,
<br>&gt;     send
<br>&gt;      &gt; an email to <a href data-email-masked rel=3D"nofollow">j=
ailhouse-de...@googlegroups.com</a>
<br>&gt;      &gt; &lt;mailto:<a href data-email-masked rel=3D"nofollow">ja=
ilhouse-de...@googlegroups.com</a>&gt;.
<br>&gt;      &gt; To view this discussion on the web visit
<br>&gt;      &gt;
<br>&gt;     <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/CAG=
A%3DGbzmH9eiuBrKjVeeKf--5fRFVGxwyCe6D20e4MDn66d3tw%40mail.gmail.com" target=
=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com=
/url?hl=3Den&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/CAGA%2=
53DGbzmH9eiuBrKjVeeKf--5fRFVGxwyCe6D20e4MDn66d3tw%2540mail.gmail.com&amp;so=
urce=3Dgmail&amp;ust=3D1712961643760000&amp;usg=3DAOvVaw03NybswZsS0_KTAeCi-=
8YS">https://groups.google.com/d/msgid/jailhouse-dev/CAGA%3DGbzmH9eiuBrKjVe=
eKf--5fRFVGxwyCe6D20e4MDn66d3tw%40mail.gmail.com</a> &lt;<a href=3D"https:/=
/groups.google.com/d/msgid/jailhouse-dev/CAGA%3DGbzmH9eiuBrKjVeeKf--5fRFVGx=
wyCe6D20e4MDn66d3tw%40mail.gmail.com" target=3D"_blank" rel=3D"nofollow" da=
ta-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://gr=
oups.google.com/d/msgid/jailhouse-dev/CAGA%253DGbzmH9eiuBrKjVeeKf--5fRFVGxw=
yCe6D20e4MDn66d3tw%2540mail.gmail.com&amp;source=3Dgmail&amp;ust=3D17129616=
43760000&amp;usg=3DAOvVaw03NybswZsS0_KTAeCi-8YS">https://groups.google.com/=
d/msgid/jailhouse-dev/CAGA%3DGbzmH9eiuBrKjVeeKf--5fRFVGxwyCe6D20e4MDn66d3tw=
%40mail.gmail.com</a>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/=
jailhouse-dev/CAGA%3DGbzmH9eiuBrKjVeeKf--5fRFVGxwyCe6D20e4MDn66d3tw%40mail.=
gmail.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"_blank" rel=
=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&am=
p;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/CAGA%253DGbzmH9eiuBrK=
jVeeKf--5fRFVGxwyCe6D20e4MDn66d3tw%2540mail.gmail.com?utm_medium%3Demail%26=
utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1712961643760000&amp;usg=
=3DAOvVaw3Q_7P7QCcHxoxH-G5mMrGk">https://groups.google.com/d/msgid/jailhous=
e-dev/CAGA%3DGbzmH9eiuBrKjVeeKf--5fRFVGxwyCe6D20e4MDn66d3tw%40mail.gmail.co=
m?utm_medium=3Demail&amp;utm_source=3Dfooter</a> &lt;<a href=3D"https://gro=
ups.google.com/d/msgid/jailhouse-dev/CAGA%3DGbzmH9eiuBrKjVeeKf--5fRFVGxwyCe=
6D20e4MDn66d3tw%40mail.gmail.com?utm_medium=3Demail&amp;utm_source=3Dfooter=
" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.go=
ogle.com/url?hl=3Den&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-de=
v/CAGA%253DGbzmH9eiuBrKjVeeKf--5fRFVGxwyCe6D20e4MDn66d3tw%2540mail.gmail.co=
m?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D171=
2961643760000&amp;usg=3DAOvVaw3Q_7P7QCcHxoxH-G5mMrGk">https://groups.google=
.com/d/msgid/jailhouse-dev/CAGA%3DGbzmH9eiuBrKjVeeKf--5fRFVGxwyCe6D20e4MDn6=
6d3tw%40mail.gmail.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt;&g=
t;.
<br>&gt;=20
<br>&gt; --=20
<br>&gt; You received this message because you are subscribed to the Google=
=20
<br>&gt; Groups &quot;Jailhouse&quot; group.
<br>&gt; To unsubscribe from this group and stop receiving emails from it, =
send=20
<br>&gt; an email to <a href data-email-masked rel=3D"nofollow">jailhouse-d=
e...@googlegroups.com</a>=20
<br>&gt; &lt;mailto:<a href data-email-masked rel=3D"nofollow">jailhouse-de=
...@googlegroups.com</a>&gt;.
<br>&gt; To view this discussion on the web visit=20
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/4cf5731=
e-a3ff-47ca-a1d7-c4f11a9e096bn%40googlegroups.com" target=3D"_blank" rel=3D=
"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=
=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/4cf5731e-a3ff-47ca-a1d7-=
c4f11a9e096bn%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D17129616437=
60000&amp;usg=3DAOvVaw3W-1kwadCq_GFZdahsYARD">https://groups.google.com/d/m=
sgid/jailhouse-dev/4cf5731e-a3ff-47ca-a1d7-c4f11a9e096bn%40googlegroups.com=
</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/4cf5731=
e-a3ff-47ca-a1d7-c4f11a9e096bn%40googlegroups.com?utm_medium=3Demail&amp;ut=
m_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://groups.google.com/d/=
msgid/jailhouse-dev/4cf5731e-a3ff-47ca-a1d7-c4f11a9e096bn%2540googlegroups.=
com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1=
712961643760000&amp;usg=3DAOvVaw2bxOKWTThl_GF3Axw5lY77">https://groups.goog=
le.com/d/msgid/jailhouse-dev/4cf5731e-a3ff-47ca-a1d7-c4f11a9e096bn%40google=
groups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt;.
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/48c5d6a9-60bf-4c79-ab16-799add45753fn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/48c5d6a9-60bf-4c79-ab16-799add45753fn%40googlegroups.co=
m</a>.<br />

------=_Part_202527_135087558.1712875346110--

------=_Part_202526_634897700.1712875346110--
