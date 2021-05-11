Return-Path: <jailhouse-dev+bncBC7PTOEB2ALRBM5G5GCAMGQESS5TFRA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf39.google.com (mail-qv1-xf39.google.com [IPv6:2607:f8b0:4864:20::f39])
	by mail.lfdr.de (Postfix) with ESMTPS id B173B37A405
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 May 2021 11:49:40 +0200 (CEST)
Received: by mail-qv1-xf39.google.com with SMTP id h17-20020a0cb4d10000b02901c51890529dsf15010100qvf.18
        for <lists+jailhouse-dev@lfdr.de>; Tue, 11 May 2021 02:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=1OLfVDl8DhWrBCyRo0fl6JB2CRLwOZtZCp73UbZToa4=;
        b=QntZ2nGDY3CcpPgtNBZiLzw8eNzDvMMkChwNp8ak0E603KqM2RDTf3ISn1KcIuQw0a
         adU8A67CF9TjWfrsWedPtnUls2lvZDA3J93khExSYg4X3Arckbld1RbUDiBCnLE/DtJI
         TSl7MGqYKrP2AC6FrzXCo/v1Lburl3tQ2/Aeec2Id6mNnNS+7wOJyG/pKf2Fzf4k2rnZ
         ay8fMB8EI5uT4RiDJKebmkFYK7RIEV/cvhN1ISwF1j+N9z76QS7sMDLo3sEksvNvsAix
         fIecQqgiMAgrwMUHALE+ZglkAa40Or+840Dhjp3GUWQdpgDkqhXMuntLKRYnpWGxKDv1
         +uHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=1OLfVDl8DhWrBCyRo0fl6JB2CRLwOZtZCp73UbZToa4=;
        b=lR7T/gRDS5LjCViPZjzjs3GawPzPn3NQQe/AciarEoQ3vBg3vCMj2MmPLycAB424/z
         oGcTwlgYtlJr4adj/c52anc+7RTfkUSmk9+xi5OMCh/mUD4YEsJoAMlATKEaZYgt0zOp
         zDWfG9Weh4hlkJiU+GfMcLRicbSiSJJjLo9IgtyyLxVUUhy637Mo+LyyWZc9fWT8yg0L
         HrhtU9ci0GyMegOwvs00BBO6X+l5PD4zKYxNBXTVK3S+glQUfdj/ub58P7zAl+hQT3VW
         /i4uWiM7f3xC4ealJB/Ao9EGAdKuKL1ymnHdWCQd9ibAW0BGrC178v0nbHQH7ZSRsVGI
         cZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=1OLfVDl8DhWrBCyRo0fl6JB2CRLwOZtZCp73UbZToa4=;
        b=tvYdDzQd+luopQjTgxPmXGbFB+s9hzrUVd30HfQRf5Nehw0vku8ASBUqn0grOKe7j5
         8t0tYLY5eUCp3/nWgiNOLQv+MnsHRTiKCyT/uVKqfbtlNrTWrHBQfN5HreyAcsGp3Ofx
         RLmMt9s4GwdPYTJhupa4pDzs08UEZFi/SVctmxc6Hq5tyrfgKgYRfmJ6o+X5B8OmH8tH
         c9A+eJMQ0lENazMjYShfsB2lu1U3vtS7DkjFJZsL6P7SWFYRE+g/HXOMlqF0k5ZoC9Nf
         9mnVwTEgvpbIK1PsYxGNbcjxETRQw7V7jml7uwQykDXIigmONfWuA0ZZk1sEIJ5N3QOH
         j4Yg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533bVwTMVDai4NLjhvTl+kgWsct8vPui90xC66q2JoJQkpc6+eFd
	w3d2YI8z+ojkqbOOOrxy2js=
X-Google-Smtp-Source: ABdhPJxWW4/mRH7xsAnNsTXm5Rimmq93q3tge/ssEcDEGtAMU3yWSrgvv/db22uAC44aoe+np5yE8Q==
X-Received: by 2002:a37:5b84:: with SMTP id p126mr27438089qkb.142.1620726579661;
        Tue, 11 May 2021 02:49:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:4cca:: with SMTP id l10ls7999147qtv.2.gmail; Tue, 11 May
 2021 02:49:39 -0700 (PDT)
X-Received: by 2002:ac8:7d15:: with SMTP id g21mr18401752qtb.351.1620726579072;
        Tue, 11 May 2021 02:49:39 -0700 (PDT)
Date: Tue, 11 May 2021 02:49:38 -0700 (PDT)
From: along li <v6543210@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <c0339bd0-f3c0-4528-84d6-b269ab187a77n@googlegroups.com>
In-Reply-To: <1f70b1bf-63c2-0f05-bfd3-0c5ea0225a11@web.de>
References: <62da4e40-0182-45bb-8944-eb26fcb14456n@googlegroups.com>
 <1f70b1bf-63c2-0f05-bfd3-0c5ea0225a11@web.de>
Subject: Re: can none-PCI devices be partitioned into cells?
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_772_262610594.1620726578550"
X-Original-Sender: v6543210@gmail.com
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

------=_Part_772_262610594.1620726578550
Content-Type: multipart/alternative; 
	boundary="----=_Part_773_109480398.1620726578550"

------=_Part_773_109480398.1620726578550
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Most  arm  devices has no  PCI bus,  but   SOC  devices.

If  devices (like network card or gpio)  can not  be partitioned into=20
cells  in  current  version,   How inmate controll  the hardware ?=20
What  scenario   is jailhouse  used for ?

How the realtime  can be proved  for  jailhouse?





=E5=9C=A82021=E5=B9=B45=E6=9C=881=E6=97=A5=E6=98=9F=E6=9C=9F=E5=85=AD UTC+8=
 =E4=B8=8B=E5=8D=883:11:56<Jan Kiszka> =E5=86=99=E9=81=93=EF=BC=9A

> On 30.04.21 04:35, along li wrote:
> > PCI devices can be partitioned into cells, as we all know.
> > But  some arm board  don't have PCI  bus.  The devices is  designed=20
> > into SOC.=20
> >
> > can none-PCI devices  be partitioned into cells?=20
> > for example  network card in raspberry pi 4,    Can it be partitioned
> > into cells?
> >
> > Any  demo or sugessition is wellcome!
>
> Yes, you can also factor out non-PCI devices and assign them to non-root
> cells. Platform devices generally have MMIO (-> memory region) and IRQs
> (-> irqchip) as resources. Identify and add them to the non-root cell
> config.
>
> The only challenge can be managing clock control or pin muxing for such
> devices. The control knobs can be located in devices that are hard or
> impossible to partition.
>
> Jan
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c0339bd0-f3c0-4528-84d6-b269ab187a77n%40googlegroups.com.

------=_Part_773_109480398.1620726578550
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Most&nbsp; arm&nbsp; devices has no&nbsp; PCI bus,&nbsp; but&nbsp; &nb=
sp;SOC&nbsp; devices.</div><div><br></div><div>If&nbsp; devices (like netwo=
rk card or gpio)&nbsp; can not&nbsp; be partitioned into cells&nbsp; in&nbs=
p; current&nbsp; version,&nbsp; &nbsp;How inmate controll&nbsp; the hardwar=
e ?&nbsp;</div><div>What&nbsp; scenario&nbsp; &nbsp;is jailhouse&nbsp; used=
 for ?</div><div><br></div><div>How the realtime&nbsp; can be proved&nbsp; =
for&nbsp; jailhouse?</div><div><br></div><div><br></div><div><br></div><br>=
<br><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">=E5=
=9C=A82021=E5=B9=B45=E6=9C=881=E6=97=A5=E6=98=9F=E6=9C=9F=E5=85=AD UTC+8 =
=E4=B8=8B=E5=8D=883:11:56&lt;Jan Kiszka> =E5=86=99=E9=81=93=EF=BC=9A<br/></=
div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-=
left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">On 30.04.21 04:35, =
along li wrote:
<br>&gt; PCI devices can be partitioned into cells, as we all know.
<br>&gt; But=C2=A0 some arm board=C2=A0 don&#39;t have PCI=C2=A0 bus.=C2=A0=
 The devices is=C2=A0 designed=C2=A0
<br>&gt; into SOC.=C2=A0
<br>&gt;
<br>&gt; can none-PCI devices=C2=A0 be partitioned into cells?=C2=A0
<br>&gt; for example=C2=A0 network card in raspberry pi 4,=C2=A0 =C2=A0 Can=
 it be partitioned
<br>&gt; into cells?
<br>&gt;
<br>&gt; Any=C2=A0 demo or sugessition is wellcome!
<br>
<br>Yes, you can also factor out non-PCI devices and assign them to non-roo=
t
<br>cells. Platform devices generally have MMIO (-&gt; memory region) and I=
RQs
<br>(-&gt; irqchip) as resources. Identify and add them to the non-root cel=
l
<br>config.
<br>
<br>The only challenge can be managing clock control or pin muxing for such
<br>devices. The control knobs can be located in devices that are hard or
<br>impossible to partition.
<br>
<br>Jan
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/c0339bd0-f3c0-4528-84d6-b269ab187a77n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/c0339bd0-f3c0-4528-84d6-b269ab187a77n%40googlegroups.co=
m</a>.<br />

------=_Part_773_109480398.1620726578550--

------=_Part_772_262610594.1620726578550--
