Return-Path: <jailhouse-dev+bncBCL6VUP7RYARBAPUYXTAKGQEESDNJXY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x239.google.com (mail-oi1-x239.google.com [IPv6:2607:f8b0:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 251A4163BF
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 May 2019 14:28:51 +0200 (CEST)
Received: by mail-oi1-x239.google.com with SMTP id r84sf5662116oia.9
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 May 2019 05:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=VcEho1cpGiYnqp3PfbGdXFHDEtvPHSnT07kgdKVOnRk=;
        b=VWb0o7Cp8SvZQwPe2s1pWu96bvU5EQZ3cMRZo1KJJ8znHCvZtWxFEL+QEB5YAnpWs9
         Qn3ocOuQds3KaxAhUXr6SHkNIwme6ota+5mCzMfETNf6WikM3RknIKommyrfP73kiz8L
         m0llkPHYbeIp0VYRyG6IIcCO5l4+sgHb74roRiDh96N3WiSfdCG4BuLU5ulfqbaOLgLI
         AhkRMZMXD8eCComtW3Wh7Kr8SNCbkY6iSSSEVZakyK87l/ZicVnMiVWMCOClGxC7V5ta
         otSHbopcg3+XjuIVZ+hcyZc+mKLMNGVPjHIb3xT1eA62hli9BUbhVhIMwR8IsWriyvjt
         2cZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=VcEho1cpGiYnqp3PfbGdXFHDEtvPHSnT07kgdKVOnRk=;
        b=hZEMXtF93+CSmqI/pg0KjoF0BzHbw/V6TCRcUYC9FuUwcgP/6v8BDsFby0g0tTVq12
         J1s7Hos8iZ/qF+OKMOrfA4L9Iet+/ireFFrAUxYGdDDhmD42x0efUATAN7WYA81fTKMu
         mrtZNUD4dk4pdi7DaDQFu7NhRe0nTsuDaWpf4WVLeYXEbm/jwojgGNGfC8xasYYTXaIZ
         R3xZA6zcMTxtMDVqVOOX7xNdZIZ11h+v7NjykOxCsZLu0lYq+XHxkfY9nVtleOZ0vARs
         b9/hZLrzphDpODXwK5GCmqitHVQDn4s+Mi2k/PMCQ8V2scUEleoTihTvhUZoHHF4wReW
         SgUg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUmh4r1U1R4ae4kDknrdB8ruYtb+oq+IpPGv5/aqd05PRCVIewu
	mI5PNi09yD30ylYgva7uB/s=
X-Google-Smtp-Source: APXvYqwgXIPjnHc0Jg4Ln7+24FgWWYBBrpexVlFBAIwPjHpuirOWUyiTW5aZnptaSvYI1KTeEZ/93g==
X-Received: by 2002:aca:48d8:: with SMTP id v207mr2309157oia.126.1557232129852;
        Tue, 07 May 2019 05:28:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6830:119:: with SMTP id i25ls141000otp.8.gmail; Tue, 07
 May 2019 05:28:49 -0700 (PDT)
X-Received: by 2002:a05:6830:2094:: with SMTP id y20mr6699237otq.340.1557232129193;
        Tue, 07 May 2019 05:28:49 -0700 (PDT)
Date: Tue, 7 May 2019 05:28:48 -0700 (PDT)
From: =?UTF-8?Q?Hakk=C4=B1_Kurumahmut?= <hkurumahmut84@hotmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <36a1c92b-732e-4f4a-81e4-159b89919f84@googlegroups.com>
In-Reply-To: <3bcebf94-23a5-18d3-1f0b-bb25717167a3@siemens.com>
References: <edd9ef72-beae-42c3-94c7-ac5bf29ba57d@googlegroups.com>
 <594f54f4-eb5c-5b64-2d49-38997bcf2f8b@siemens.com>
 <50b964d8-41e5-49af-96dc-3080cbd3966e@googlegroups.com>
 <62d847c0-b4b6-4395-b603-ecf2f87095d7@googlegroups.com>
 <3bcebf94-23a5-18d3-1f0b-bb25717167a3@siemens.com>
Subject: Re: Unsupported DMAR Device Scope Structure
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2720_307072259.1557232128525"
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

------=_Part_2720_307072259.1557232128525
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

7 May=C4=B1s 2019 Sal=C4=B1 08:52:46 UTC+3 tarihinde Jan Kiszka yazd=C4=B1:
> On 06.05.19 20:38, Hakk=C4=B1 Kurumahmut wrote:
> > 6 May=C4=B1s 2019 Pazartesi 18:19:07 UTC+3 tarihinde jeanne....@gmail.c=
om yazd=C4=B1:
> >> For sure ! You can find the requested file attached.
> >>
> >> best regards,
> >>
> >>
> >> Le lundi 6 mai 2019 16:11:05 UTC+2, Jan Kiszka a =C3=A9crit=C2=A0:
> >>> On 06.05.19 15:47, jeanne.romefort@gmail.com wrote:
> >>>> Hello,
> >>>>
> >>>> I'm trying to run jailhouse on a HP ProLiant ML350 Gen10.
> >>>> ACPI DMAR is available, but my hardware-check fails with this
> >>>>
> >>>> error :
> >>>> 	"Unsupported DMAR Device Scope Structure"
> >>>>
> >>>> I also tried on a HP ProLiant DL360p Gen8 but I ended up with the sa=
me error...
> >>>>
> >>>>
> >>>> Any idea of this trouble ?
> >>>>
> >>>
> >>> Can you share an archive generated by "jailhouse config collect"? The=
n we can
> >>> analyze locally.
> >>>
> >>> Jan
> >>>
> >>> --=20
> >>> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> >>> Corporate Competence Center Embedded Linux
> >=20
> > DMAR region parser is detected Device Scope size more than 8 byte.
> >=20
> >=20
> > VT-d Spec at 8.3.1
> >=20
> > If the =E2=80=98Path=E2=80=99 field length is more than 2 bytes (N > 1)=
, the Device Scope
> > Entry identifies a device behind one or more system software visible PC=
I-
> > PCI bridges. Bus rebalancing actions by system software modifying bus
> > assignments of the device=E2=80=99s parent bridge impacts the bus numbe=
r portion
> > of device=E2=80=99s requester-id.
> >=20
> > This devices
> >=20
> > 1C.7.0.0
> > 1C.7.0.2
> >=20
> >=20
> > Current Script does not support this type device... Scripts must be rea=
d Dev Scope length and than it is read the DMAR file to collect correct dat=
a.
> >=20
> >=20
> > Jan can provide technical information on this issue. I have no idea why=
 it's not supported.
> >=20
>=20
> I think I was "just" too lazy to implement the needed logic behind that.
>=20
> The tricky thing here is surely the identification of the final bus numbe=
r the=20
> BIOS or Linux as chosen for the device described that way. It will be nee=
ded in=20
> order to identify the device entry in our configuration. Likely, we have =
to walk=20
> the topology, first identify the bridge and then query that one for its b=
us=20
> number in order to describe the device.
>=20
> Jan
>=20
> --=20
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> Corporate Competence Center Embedded Linux

Hi,

Temporary solution but is not solution is below. Change relative function w=
ith them. Hardware check will be pass but new problems may be seen.


def parse_dmar_devscope(f):
    (scope_type, scope_len) =3D struct.unpack('<BB', f.read(2))

    N =3D (int)((scope_len - 6) / 2) - 1

    (id, starting_bus, starting_dev, starting_fn) =3D \
            struct.unpack('<xxBBBB', f.read(6))

    while N !=3D 0:
        N-=3D1
        (secondary_dev, secondary_fn) =3D \
            struct.unpack('<BB', f.read(2))

    return (scope_type, scope_len, id, starting_bus, starting_dev, starting=
_fn)


Feature                         Availability
------------------------------  ------------------
Number of CPUs > 1              ok
Long mode                       ok
x2APIC                          ok

VT-x (VMX)                      ok
  VMX outside SMX               ok
  VMX inside SMX                ok
  IA32_TRUE_*_CLTS              ok
  NMI exiting                   ok
  Preemption timer              ok
  I/O bitmap                    ok
  MSR bitmap                    ok
  Secondary controls            ok
  Optional CR3 interception     ok
  Virtualize APIC access        ok
  RDTSCP                        ok
  Unrestricted guest            ok
  EPT                           ok
    4-level page walk           ok
    EPTP write-back             ok
    2M pages                    ok
    1G pages                    missing (optional)
    INVEPT                      ok
      Single or all-context     ok
  VM-exit save IA32_PAT         ok
  VM-exit load IA32_PAT         ok
  VM-exit save IA32_EFER        ok
  VM-exit load IA32_EFER        ok
  VM-entry load IA32_PAT        ok
  VM-entry load IA32_EFER       ok
  Activity state HLT            ok

VT-d (IOMMU #0)                 ok
  39-bit AGAW                   ok
  48-bit AGAW                   ok
  2M pages                      ok
  1G pages                      ok
  Queued invalidation           ok
  Interrupt remapping           ok
  Extended interrupt mode       ok

VT-d (IOMMU #1)                 ok
  39-bit AGAW                   ok
  48-bit AGAW                   ok
  2M pages                      ok
  1G pages                      ok
  Queued invalidation           ok
  Interrupt remapping           ok
  Extended interrupt mode       ok

Check passed!

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/36a1c92b-732e-4f4a-81e4-159b89919f84%40googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_2720_307072259.1557232128525--
