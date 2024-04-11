Return-Path: <jailhouse-dev+bncBDFMXFHWY4HBB65N4GYAMGQETAXU6NQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb40.google.com (mail-yb1-xb40.google.com [IPv6:2607:f8b0:4864:20::b40])
	by mail.lfdr.de (Postfix) with ESMTPS id 8776B8A20EE
	for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Apr 2024 23:32:45 +0200 (CEST)
Received: by mail-yb1-xb40.google.com with SMTP id 3f1490d57ef6-dc6ceade361sf512319276.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Apr 2024 14:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1712871164; x=1713475964; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RRze+4CCffirbxoirahi4p4KBUq8l3RJ+OCWRa/CgVE=;
        b=e7zOvnrRGcSbxpxfjG8TFhzdAm1jClqYiTF5jq03wJPgGPQNXcb29PFG+4gS3cczhV
         wf1IRfsQml6TYYhrHZkaHkIVCE949Sr0tBbhV1WfRbwHBwLZeg1cAvum7rzmzPFoKdaT
         nIktAbKEiHC3zXYzHmmLN69+m22GKxSXDTtXuBFafWlgeJeeft0dWEYXZifcvX4iPR89
         GjvvDrDB9UKdV/oo3H06G/3pnKF2gEfsNhTLsg3QpRoV1jg13b79aVdebyqbs/dkryqx
         GSdFGgIytW0kRbYxIJ8+pGyr6ZBb646kWAWmiFYxNy4FtVgSI93+UIIC7arV6/mEavNS
         PiPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712871164; x=1713475964; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RRze+4CCffirbxoirahi4p4KBUq8l3RJ+OCWRa/CgVE=;
        b=l8vSjal6FYtpOZHs+MhKTMMi8CwQqyxXdWQOjqJdfjqOf3RvWaXXfgdjTt+2RykpVS
         bOD+ErAiyXvIohc0H0+a/ftkChNvOefMwXlHBQrrvbYTqeuoTVmjDk+i31afrToBsJay
         EdsOGR3FI3nqyJmbBtR4HK86JJKg+c/p4jzHnuS0S7rvsq3huItdTHStgmVLWYl8oQp6
         6/w/h4m73RJx70qmQaSy/3mjboQxHLxhs9+N3ugLtZQuliSEQHYLeVFG1i7tDLc4XiZ9
         w0zZjN5vTugUpBgleGRQSzncSglXR4e5cqp5SluXjM4I4gA2rNI72mTAfnIHCJRXO+bg
         FJug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712871164; x=1713475964;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RRze+4CCffirbxoirahi4p4KBUq8l3RJ+OCWRa/CgVE=;
        b=Il1RCwa20cJtLyalumTq7PrLGLPNwjHGDnBq5XP8PKeyYH9pJ1/M1il/r0k/FiIeu4
         xUId87otl5ODQNyVI2BETOZrbUEm3ByyRvm5NJC9lWPEPnEEQTg7GnlE1lk1ya3DbhW8
         jh3WJVZAeGK+7ZekLu0FuWnNin3byWElnAkil6uCuRKpknBdnTZtvV0nztpYBzmG2F1c
         53TgZiznOYsUXKr8XZXWAKGI64SBF8P90QHKfltxkLPQ+lIjFlSyPm440rlRUhevcqyd
         oFe8USiO4XKRW3jNycn6v7O5acNddLtyhIiT5V5cXFHwVu/D/EmvSmQSzpfNc/6kndAt
         AVqQ==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCWNxlOC8WrOC5NOGWZTc2vwROMEAMiCEzg67JkCqgr0fdDJLUAqOJaBjb041j97DVwpJ+VTPW2YJBp/9CwvMg8wy1ZgawconX2Nkew=
X-Gm-Message-State: AOJu0YyTPvPBZMiNrsPex5G/xogPoz1/LLpgquFqIPKqQtFwpYgYRH7O
	956SnWSQlay5U2/eP0PfwayMfmPiH2j8Gq7TMDmZQJ5WEoGjMiml
X-Google-Smtp-Source: AGHT+IHwXLjhSaXD1MHnNTOBb4wm0QUdlp9gIVaBoxasvfLrFUZzz76moLd1dhv/Z2ABtkS260u6Bw==
X-Received: by 2002:a5b:87:0:b0:dce:fd56:b213 with SMTP id b7-20020a5b0087000000b00dcefd56b213mr736702ybp.7.1712871164229;
        Thu, 11 Apr 2024 14:32:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:e0c2:0:b0:dcc:4b24:c0e3 with SMTP id x185-20020a25e0c2000000b00dcc4b24c0e3ls648989ybg.1.-pod-prod-07-us;
 Thu, 11 Apr 2024 14:32:42 -0700 (PDT)
X-Received: by 2002:a0d:ca14:0:b0:615:134c:7ef3 with SMTP id m20-20020a0dca14000000b00615134c7ef3mr165031ywd.9.1712871161945;
        Thu, 11 Apr 2024 14:32:41 -0700 (PDT)
Date: Thu, 11 Apr 2024 14:32:40 -0700 (PDT)
From: Di Majo Massimiliano <massimilianodimajo097@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <1c7db360-5f01-4749-98c3-4947f5e41a56n@googlegroups.com>
In-Reply-To: <337ae457-ade4-4974-a06f-72072de7e355n@googlegroups.com>
References: <337ae457-ade4-4974-a06f-72072de7e355n@googlegroups.com>
Subject: Re: Problems with starting non root Zephyr cell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_208372_267020449.1712871160778"
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

------=_Part_208372_267020449.1712871160778
Content-Type: multipart/alternative; 
	boundary="----=_Part_208373_2115148290.1712871160778"

------=_Part_208373_2115148290.1712871160778
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

On Tuesday, January 16, 2024 at 10:51:21=E2=80=AFAM UTC+1 Zaira Abdel Majid=
 wrote:

> Hello there, I'm doing a project for a uni course where we have to put=20
> zephyr in a non rootcell in jailhouse to execute a wasm module. We've=20
> managed to successfully run a wasm app in zephyr and the second step is t=
o=20
> bring this all on jailhouse. Reading the docs, I've found that i need jus=
t=20
> the following few instructions to do this (we've used the default=20
> zephyr-demo found in configs used also in this example=20
> <https://docs.zephyrproject.org/latest/samples/drivers/ethernet/eth_ivshm=
em/README.html>,=20
> and the .bin here refers to the bin generated by building our application=
)
> jailhouse cell create /etc/jailhouse/qemu-arm64-zephyr-demo.cell
> jailhouse cell load qemu-arm64-zephyr-demo zephyr.bin --address 0x7000000=
0
> jailhouse cell start qemu-arm64-zephyr-demo
> but when the cell is created and started i can't see the output expected=
=20
> that we saw without jailhouse. We initially thought that this was a confi=
g=20
> problem since our zephyr.elf base address is 0x000000004000098c (we've=20
> obtained this with the command objdump, i will leave the output for=20
> reference) and the RAM in this demo starts at 0x70000000, so we changed t=
he=20
> qemu-arm64-zephyr-demo.c (in particular we changed the lines regarding th=
e=20
> virtual and physical address of ram and the cpu reset address) and launch=
ed=20
> make to "update" the corresponding .cell file, but when we try to load th=
e=20
> cell we get the message JAILHOUSE_CELL_LOAD invalid argument. Something=
=20
> strange we noticed is that even after the invalid argument error we still=
=20
> got the message "cell loaded". Do you have any hint to help us? I will=20
> leave the configuration file we've updated, the picture with the output w=
e=20
> got (keep in mind that on the shell on the left we've created the cell an=
d=20
> after that we established a new ssh connection with qemu/jailhouse on=20
> another shell because the former shell couldn't accept inputs anymore; th=
is=20
> issue is normal according to the aforementioned zephyr documentation) and=
=20
> the output we expect from zephyr. (sorry if the questions may sound a bit=
=20
> dumb or if i may have expressed some concepts unproperly but this is the=
=20
> first time using jailhouse or type 1 hypervisors so we're really struggli=
ng)[image:=20
> Schermata del 2024-01-16 10-31-56.png][image: Schermata del 2024-01-16=20
> 10-34-05.png][image: Schermata del 2024-01-16 10-47-09.png]

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/1c7db360-5f01-4749-98c3-4947f5e41a56n%40googlegroups.com.

------=_Part_208373_2115148290.1712871160778
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
 Tuesday, January 16, 2024 at 10:51:21=E2=80=AFAM UTC+1 Zaira Abdel Majid w=
rote:<br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.=
8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">Hello t=
here, I&#39;m doing a project for a uni course where we have to put zephyr =
in a non rootcell in jailhouse to execute a wasm module. We&#39;ve managed =
to successfully run a wasm app in zephyr and the second step is to bring th=
is all on jailhouse. Reading the docs, I&#39;ve found that i need just the =
following few instructions to do this (we&#39;ve used the default zephyr-de=
mo found in configs used also <a href=3D"https://docs.zephyrproject.org/lat=
est/samples/drivers/ethernet/eth_ivshmem/README.html" target=3D"_blank" rel=
=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&am=
p;q=3Dhttps://docs.zephyrproject.org/latest/samples/drivers/ethernet/eth_iv=
shmem/README.html&amp;source=3Dgmail&amp;ust=3D1712957548736000&amp;usg=3DA=
OvVaw04S1-o4vHtJpBPp5JKH8YW">in this example</a>,
 and the .bin here refers to the bin generated by building our=20
application)<br>jailhouse cell create /etc/jailhouse/qemu-arm64-zephyr-demo=
.cell<br>jailhouse cell load qemu-arm64-zephyr-demo zephyr.bin --address 0x=
70000000<br>jailhouse cell start qemu-arm64-zephyr-demo<br>but when the cel=
l is created and started i can&#39;t see the output expected that we saw wi=
thout jailhouse. We initially thought that this was a config problem since =
our zephyr.elf base address is 0x000000004000098c (we&#39;ve obtained this =
with the command objdump, i will leave the output for reference) and the RA=
M in this demo starts at 0x70000000, so we changed the qemu-arm64-zephyr-de=
mo.c (in particular we changed the lines regarding the virtual and physical=
 address of ram and the cpu reset address) and launched make to &quot;updat=
e&quot; the corresponding .cell file, but when we try to load the cell we g=
et the message JAILHOUSE_CELL_LOAD invalid argument. Something strange we n=
oticed is that even after the invalid argument error we still got the messa=
ge &quot;cell loaded&quot;. Do you have any hint to help us? I will leave t=
he configuration file we&#39;ve updated, the picture with the output we got=
 (keep in mind that on the shell on the left we&#39;ve created the cell and=
 after that we established a new ssh connection with qemu/jailhouse on anot=
her shell because the former shell couldn&#39;t accept inputs anymore; this=
 issue is normal according to the aforementioned zephyr documentation) and =
the output we expect from zephyr. (sorry if the questions may sound a bit d=
umb or if i may have expressed=20
some concepts unproperly but this is the first time using jailhouse or=20
type 1 hypervisors so we&#39;re really struggling)<img alt=3D"Schermata del=
 2024-01-16 10-31-56.png" width=3D"566px" height=3D"123px" src=3D"https://g=
roups.google.com/group/jailhouse-dev/attach/7c0361da307f2/Schermata%20del%2=
02024-01-16%2010-31-56.png?part=3D0.1&amp;view=3D1"><img alt=3D"Schermata d=
el 2024-01-16 10-34-05.png" width=3D"566px" height=3D"61px" src=3D"https://=
groups.google.com/group/jailhouse-dev/attach/7c0361da307f2/Schermata%20del%=
202024-01-16%2010-34-05.png?part=3D0.3&amp;view=3D1"><img alt=3D"Schermata =
del 2024-01-16 10-47-09.png" width=3D"566px" height=3D"113px" src=3D"https:=
//groups.google.com/group/jailhouse-dev/attach/7c0361da307f2/Schermata%20de=
l%202024-01-16%2010-47-09.png?part=3D0.4&amp;view=3D1"></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/1c7db360-5f01-4749-98c3-4947f5e41a56n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/1c7db360-5f01-4749-98c3-4947f5e41a56n%40googlegroups.co=
m</a>.<br />

------=_Part_208373_2115148290.1712871160778--

------=_Part_208372_267020449.1712871160778--
