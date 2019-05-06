Return-Path: <jailhouse-dev+bncBCL6VUP7RYARBJ76YHTAKGQEC7LHFUA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23c.google.com (mail-oi1-x23c.google.com [IPv6:2607:f8b0:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 902CD153C7
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 May 2019 20:38:32 +0200 (CEST)
Received: by mail-oi1-x23c.google.com with SMTP id v13sf674550oie.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 May 2019 11:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Fk8ApRzsNccQHpRS/KZEkWtANtDIk8KTdTHSCt4dGkU=;
        b=n7idRZCGFa2Gnveq0XfUnpn3SES0sg8uTtZ+u5hl/nhEkImkMFfpmHqM4UbFrJci39
         vZzMaNkXCtq7jNG0rn2lGq/WuPZNmkA1RUNmP7Nh9BAtMWYsYEWWS/X0c7uAPH7C7u96
         xDhDGdLlOLEYiHeNVOC847Nh+83lxgRgwtImt+6xYajzAGDw5FMBJAwGFGIabpMd3Lgh
         31pcx/27EAA8VUoDvyIQvWvhalpR9+j7s7CZLmBUEvtczb5O6WRCrJHzvMbXe2OqvPXK
         rwEsS3M2egYnJK824EvviqkvXoDpXNSXvISBMFkoO7QH+/7r+qPl+xiTO54sNdKyid48
         TuBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Fk8ApRzsNccQHpRS/KZEkWtANtDIk8KTdTHSCt4dGkU=;
        b=jeWWkQRuLPqBaPeQdduRtRvyeiy/zkVXx3UGUH0jOFOJQRjDTb/J1upE3th1tPgBYM
         IXCTzkjPc+awORewQdzgFLbjJqYvmS3upGcFirtZWOhqnsCOnA+JLR+aKu9LkF6i8kzo
         z43t60cq1WfMRTB5JLIv9/64k7jA/uXN0mr2mVtGHoV/HEtF+YE3FsXQX1+tRGb+mWJw
         tUPGws198X2CuBgAEQK+3173BlJQpWMedBrqiv84WYPkVcD+eJ4O2V7ms6ruZzyYvJcw
         KuUu0ca6/K6lRXcDMtE+Wd7AVNKZZOTm/WR0QfXayzIYWPldlzf/sOeMmOZ6kueEqsu6
         9wCA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX0QNDCxxMLoRjDw9EQH5pkadx9HPi7JZBTG6dmjSIggWz8Y9Xf
	dAZJ56z3PnYPvC28V5exMhw=
X-Google-Smtp-Source: APXvYqxNyxYBrYlZRXKZszRQ7U4TKu+FZHHh3eKGXA2uo4d8/Z3DUFnymhYI4iZ78CwvD+5Ae3y1NA==
X-Received: by 2002:aca:4883:: with SMTP id v125mr1621706oia.76.1557167911518;
        Mon, 06 May 2019 11:38:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a54:4086:: with SMTP id i6ls628155oii.3.gmail; Mon, 06 May
 2019 11:38:31 -0700 (PDT)
X-Received: by 2002:aca:4911:: with SMTP id w17mr2168779oia.28.1557167910678;
        Mon, 06 May 2019 11:38:30 -0700 (PDT)
Date: Mon, 6 May 2019 11:38:29 -0700 (PDT)
From: =?UTF-8?Q?Hakk=C4=B1_Kurumahmut?= <hkurumahmut84@hotmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <62d847c0-b4b6-4395-b603-ecf2f87095d7@googlegroups.com>
In-Reply-To: <50b964d8-41e5-49af-96dc-3080cbd3966e@googlegroups.com>
References: <edd9ef72-beae-42c3-94c7-ac5bf29ba57d@googlegroups.com>
 <594f54f4-eb5c-5b64-2d49-38997bcf2f8b@siemens.com>
 <50b964d8-41e5-49af-96dc-3080cbd3966e@googlegroups.com>
Subject: Re: Unsupported DMAR Device Scope Structure
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2323_1982919101.1557167910068"
X-Original-Sender: hkurumahmut84@hotmail.com
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

------=_Part_2323_1982919101.1557167910068
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

6 May=C4=B1s 2019 Pazartesi 18:19:07 UTC+3 tarihinde jeanne....@gmail.com y=
azd=C4=B1:
> For sure ! You can find the requested file attached.
>=20
> best regards,
>=20
>=20
> Le lundi 6 mai 2019 16:11:05 UTC+2, Jan Kiszka a =C3=A9crit=C2=A0:
> > On 06.05.19 15:47, jeanne.romefort@gmail.com wrote:
> > > Hello,
> > >=20
> > > I'm trying to run jailhouse on a HP ProLiant ML350 Gen10.
> > > ACPI DMAR is available, but my hardware-check fails with this
> > >=20
> > > error :
> > > 	"Unsupported DMAR Device Scope Structure"
> > >=20
> > > I also tried on a HP ProLiant DL360p Gen8 but I ended up with the sam=
e error...
> > >=20
> > >=20
> > > Any idea of this trouble ?
> > >=20
> >=20
> > Can you share an archive generated by "jailhouse config collect"? Then =
we can=20
> > analyze locally.
> >=20
> > Jan
> >=20
> > --=20
> > Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> > Corporate Competence Center Embedded Linux

DMAR region parser is detected Device Scope size more than 8 byte.


VT-d Spec at 8.3.1

If the =E2=80=98Path=E2=80=99 field length is more than 2 bytes (N > 1), th=
e Device Scope
Entry identifies a device behind one or more system software visible PCI-
PCI bridges. Bus rebalancing actions by system software modifying bus
assignments of the device=E2=80=99s parent bridge impacts the bus number po=
rtion
of device=E2=80=99s requester-id.

This devices=20

1C.7.0.0
1C.7.0.2


Current Script does not support this type device... Scripts must be read De=
v Scope length and than it is read the DMAR file to collect correct data.


Jan can provide technical information on this issue. I have no idea why it'=
s not supported.



def parse_dmar_devscope(f):
    (scope_type, scope_len, id, bus, dev, fn) =3D \
        struct.unpack('<BBxxBBBB', f.read(8))
    if scope_len !=3D 8:
        raise RuntimeError('Unsupported DMAR Device Scope Structure')
    return (scope_type, scope_len, id, bus, dev, fn)


DRHD: struct_len: 176 offset: 16 -> flags: 0 segment: 0 base: 0xfbefe000

DevScope: offset: 16 ->  scope_type: 2 scope_len: 8 id: 0 bus: 32 dev: 0 fn=
: 0
DevScope: offset: 24 ->  scope_type: 2 scope_len: 8 id: 0 bus: 32 dev: 1 fn=
: 0
DevScope: offset: 32 ->  scope_type: 2 scope_len: 8 id: 0 bus: 32 dev: 1 fn=
: 1
DevScope: offset: 40 ->  scope_type: 2 scope_len: 8 id: 0 bus: 32 dev: 2 fn=
: 0
DevScope: offset: 48 ->  scope_type: 2 scope_len: 8 id: 0 bus: 32 dev: 2 fn=
: 1
DevScope: offset: 56 ->  scope_type: 2 scope_len: 8 id: 0 bus: 32 dev: 2 fn=
: 2
DevScope: offset: 64 ->  scope_type: 2 scope_len: 8 id: 0 bus: 32 dev: 2 fn=
: 3
DevScope: offset: 72 ->  scope_type: 2 scope_len: 8 id: 0 bus: 32 dev: 3 fn=
: 0
DevScope: offset: 80 ->  scope_type: 2 scope_len: 8 id: 0 bus: 32 dev: 3 fn=
: 1
DevScope: offset: 88 ->  scope_type: 2 scope_len: 8 id: 0 bus: 32 dev: 3 fn=
: 2
DevScope: offset: 96 ->  scope_type: 2 scope_len: 8 id: 0 bus: 32 dev: 3 fn=
: 3
DevScope: offset: 104 ->  scope_type: 3 scope_len: 8 id: 10 bus: 32 dev: 5 =
fn: 4
DevScope: offset: 112 ->  scope_type: 1 scope_len: 8 id: 0 bus: 32 dev: 4 f=
n: 0
DevScope: offset: 120 ->  scope_type: 1 scope_len: 8 id: 0 bus: 32 dev: 4 f=
n: 1
DevScope: offset: 128 ->  scope_type: 1 scope_len: 8 id: 0 bus: 32 dev: 4 f=
n: 2
DevScope: offset: 136 ->  scope_type: 1 scope_len: 8 id: 0 bus: 32 dev: 4 f=
n: 3
DevScope: offset: 144 ->  scope_type: 1 scope_len: 8 id: 0 bus: 32 dev: 4 f=
n: 4
DevScope: offset: 152 ->  scope_type: 1 scope_len: 8 id: 0 bus: 32 dev: 4 f=
n: 5
DevScope: offset: 160 ->  scope_type: 1 scope_len: 8 id: 0 bus: 32 dev: 4 f=
n: 6
DevScope: offset: 168 ->  scope_type: 1 scope_len: 8 id: 0 bus: 32 dev: 4 f=
n: 7

DRHD: struct_len: 40 offset: 16 -> flags: 1 segment: 0 base: 0xf4ffe000

DevScope: offset: 16 ->  scope_type: 3 scope_len: 8 id: 8 bus: 0 dev: 30 fn=
: 1
DevScope: offset: 24 ->  scope_type: 3 scope_len: 8 id: 0 bus: 0 dev: 5 fn:=
 4
DevScope: offset: 32 ->  scope_type: 4 scope_len: 8 id: 0 bus: 0 dev: 31 fn=
: 0

RMRR: struct_len: 40 offset: 24 ->  base: 0xbdffd000 limit: 3187671039

DevScope: offset: 24 ->  scope_type: 1 scope_len: 8 id: 0 bus: 0 dev: 29 fn=
: 0
DevScope: offset: 32 ->  scope_type: 1 scope_len: 8 id: 0 bus: 0 dev: 26 fn=
: 0

RMRR: struct_len: 54 offset: 24 ->  base: 0xbdff6000 limit: 3187658751

DevScope: offset: 24 ->  scope_type: 1 scope_len: 10 id: 0 bus: 0 dev: 28 f=
n: 7		Unsupported DMAR Device Scope Structure

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_2323_1982919101.1557167910068--
