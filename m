Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB4UKULUAKGQEE26ZCVQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 0769B498E7
	for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Jun 2019 08:32:19 +0200 (CEST)
Received: by mail-wm1-x33d.google.com with SMTP id y130sf294543wmg.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 23:32:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560839538; cv=pass;
        d=google.com; s=arc-20160816;
        b=Iryy82qAobEOTQU3I8H0sUAd2lSHdxEBf7OjiaDr84ibt0YIJQBWfMoyjILd9LWIfr
         YVmqUnPlRnR3zWxqojk5AKrfN946RIy5nrlROCagSXGk70FVLE/DEq7b/GfND7OU4G9C
         cz/WTW18ynF1ITqqGb6Rlvlnpz15N4g+JxNmyJTmVpNLgtHPxu1J9qRMxEP4O/C6N+ch
         TaYCbEk8jTKjIN/pRry3CZgaG3vhcFcJU7RJWX8qWD+xplW5L3E8IQ2osq2oucGiZF8W
         YfIgia1NuBThXZmYJ2laeRqtexEFKqkpqnEKPjRcJr3h+LT6ZTKlratAp/UDTqOK2kg0
         w+jg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=MmI2QLxUEutJaXFMoY7okBAUGaIsMmEocQwnvjMOtCg=;
        b=evn7BdmUEV3yoxxdofTxtzxEqq+meGMC7gXgrVwSJrPpia1fJqMjOMdzpV+SbpM6Ek
         I4ek9tySg8mpRm4KOm3YRER6k32Z7MyVf3LPIVSoaNCSKvZ3wqu59f2TErJ8mF77hySV
         /PqzuzaWReuwzkoICqll8pxG1viSmpigEDu/SksEWoa+CeN03lLEjT4KeezO9PsVQHzc
         +hs15vSBrg1Sh6PXhDqViZV+E6MxJ/UtnoFRGX5HPLOQfIhvpNm4OvBbj4P/C5ocRwp5
         jAGD57IGiO0D2cvNqXYzlcUK6LqbUbo9E2EPkk/wGIU82TCqYKNur8s8wwQYG1cmcekS
         rCWw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=MmI2QLxUEutJaXFMoY7okBAUGaIsMmEocQwnvjMOtCg=;
        b=SRa/ZuuJ1AaltGUL32MnLWltPse6m12+P6SHJPivADbq/Ave8uXYpPs8dxVLkNR0EL
         2GpmN5ICmkZ6GavHslRWBsMb4JgDaELMmU/cuuttcUrlzxVw3X3Oj+KcgAU/iPktJ/Mw
         SbEIvhC3DWcvqqzTMfEetIRNZZbM2zcsnAnfPM20I9vWgovVBtHDNk9txIrQPK34tcGi
         YqoUXLigUvTIREJSZ6MLwn8Q4bCyDyyDsKc7G/NwxeRrtCze6Lb43a5nnkSc6RdDy85n
         KEgcddRYrWE3xSSjYrM+pm5xR7NTyaKpOuk0pamcUzwOI0kPMmEYlj6LhRXHQpz48bM0
         P7EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=MmI2QLxUEutJaXFMoY7okBAUGaIsMmEocQwnvjMOtCg=;
        b=qwnxGek+OJGPloZGLjcz5n9SWPqENTGOg8UjzYKaCja7Z4RSRkXufKXW956w//FBQk
         5lm/FKmPFefmJzHJ9b3RZD4u7114hXW1Jw7cbziFX5uwEQAVY8GIPRg6w96s0JPgdtbx
         NEk/2xq1iUZzuUB8oNolZqGKfQ1nNP94/uyS+dE+67AYEvBizvseLCpkoTG1oILiAkdQ
         y5fBe23/y1Dz6+GSlrDvjxbqHC8DpCk4B15Fy3JcvfXZIp2JvOlc55sDNhRAhOtYCwtB
         DTLGNYy51ioE1pAKBjjzQG8JbiZOi2jRZW7KFL3qEJ9bAqP5tr3i7haxxIkfJlrii4jr
         ps5A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXuD2E15pUXxfcsaXwE5RrYZsZAlxnNf833a/QkUOcfINtgIbKE
	gPQ3aGoK+GiLVzlcHOc6m+w=
X-Google-Smtp-Source: APXvYqxxPjX77hgdVtIW+BcJSyHSnvgJZC8vbtuGgEEzHOC1bdzf0/+/QJPIdq6oBwFAdYwClrzIaw==
X-Received: by 2002:a1c:2e09:: with SMTP id u9mr1803982wmu.137.1560839538641;
        Mon, 17 Jun 2019 23:32:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:80a3:: with SMTP id 32ls1359552wrl.16.gmail; Mon, 17 Jun
 2019 23:32:18 -0700 (PDT)
X-Received: by 2002:adf:9003:: with SMTP id h3mr1246601wrh.172.1560839538084;
        Mon, 17 Jun 2019 23:32:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560839538; cv=none;
        d=google.com; s=arc-20160816;
        b=IZAd4Nhyee7JUMYNd4JJqlK0Q6FqdxdDpI8utGpyXh96CR3SpsGlreYJZYeaR+dLo1
         HBdNU66UwKvV0DRbQrNeuwKpURQmnu0Txm5N0L54GWlqNhevKnR/tAZrzqdZeI1mu+aR
         9hvFjbZ2g04ie+V/58XQwpWCcZi3o2EfzRH7YzdHL6Jx98qsocoEGkEpMDFr93qw7K38
         6jGKJfXRr03xV/sw1WNiNfWUp8tg1Z4TlHMB2ZyU3ZcUBHuxFRwJo8lEi4snEw5SlFG7
         LrCK+8Yy73r877QxD07PEumuIJ0rwqhh2P3/110wYzvLCJejRVi00LGnZ/IYduT6RZ57
         MvKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=kGcKmIbdA31VAl6O6PRDYZV20zDgNmng1RgdEvyxVIo=;
        b=rxW9DyNQhGEHoLHyu8ct/0+CwRoY6GZiFFOtuyfqjqMAi/jgiZ8MStzWbPAVFofl3H
         s5MxC1PBHYw5Q9ps71U46Y3VHEnjMtpwujiA0HMGgbo+5YzczUcUy322tR7/Wy+v5i/f
         TfPHKgwAUfKCq6UZ/M55UICFJexY8bdrh7DO98+zzg/9WagKQDreauW0CoPZLtzk57I6
         6J7y4l0bKJN5FRknZ6XCv3FkoIfiTWxE1F3+sPq7d5VfyhoQHz0VRp5/zt8GmrrByTVa
         Rd0lMEPjfQmLn8nbJ+Q2nhZGzgKaDuRmt4oZs1oVVYW4eShV3LeT6Ty/BAxV8vJAWaRO
         vkCw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id j1si76599wme.3.2019.06.17.23.32.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 23:32:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x5I6WHdg031260
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Jun 2019 08:32:17 +0200
Received: from [167.87.39.124] ([167.87.39.124])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x5I6WGpP009650;
	Tue, 18 Jun 2019 08:32:17 +0200
Subject: Re: Linux non-root node question
To: Wayne <racedrive1503@gmail.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <CA++Khc2iKk1J6+0huh5__dS4HyujXzV9r+LbKLzuVZ4K3Bt5eA@mail.gmail.com>
 <ad13aaa6-41ac-14fd-33fe-fa4f6dfc789e@oth-regensburg.de>
 <CA++Khc36sP7ABEsR5Bp+gpts0DUBENqV6eFDPazfs5kR_QRGaw@mail.gmail.com>
 <42ce8fed-792a-ac86-7611-ee9b13dd7815@oth-regensburg.de>
 <CA++Khc13nuahbog_WVD-BJi0asHEa8TxMAvB5M5damJGJ_5inA@mail.gmail.com>
 <d2e2b271-4e43-4126-5433-8304d4984e7a@oth-regensburg.de>
 <CA++Khc2LGq3gGydG2Ojxn2xcbPoc6VzvhoO4_ikFMFMdQ_aYOg@mail.gmail.com>
 <bd92264a-60c1-6f76-07f0-93cb9bd08a01@siemens.com>
 <CA++Khc0seBDnN2hD7EJh3g25unUEFqBuiRSm5HwOE+1JEX0D2Q@mail.gmail.com>
 <63552042-48d0-cb32-e893-28ae4ab29ccd@siemens.com>
 <CA++Khc3Mj=SFen+_f7RE5g1Paq1AhHQOrBX3HqNoJvvbymQh0w@mail.gmail.com>
 <5b90a899-c42a-a360-8398-c3af35920765@siemens.com>
 <CA++Khc0whU3=U86WGNEtLUZoOkKuYLiEA+nqOjW1UFcRDeGTRQ@mail.gmail.com>
 <0da95034-9bd0-4415-4d3b-5f6687a84563@siemens.com>
 <CA++Khc1Xjt8yMT39shFraJnzSWp8Ctc9-Cv-mNxOqf+UkxhyxA@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <36306f60-8b63-f32d-2559-3a1ca6f53e87@siemens.com>
Date: Tue, 18 Jun 2019 08:32:16 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <CA++Khc1Xjt8yMT39shFraJnzSWp8Ctc9-Cv-mNxOqf+UkxhyxA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 17.06.19 21:06, Wayne wrote:
> Hi Jan,
>=20
> I am still having trouble getting the non-root linux kernel to boot up.=
=C2=A0 Based=20
> on your suggestions I tried two scenarios and am using your AMD kernel co=
nfig=20
> you pointed me to above:
>=20
> 1. Attempted to use the 70MB root linux initramfs (generated through kern=
el=20
> "make install"), but I get this error:

What do you mean with "generated through kernel"?

>=20
> [ =C2=A0 =C2=A02.648665] rootfs image is not initramfs (write error); loo=
ks like an initrd
> [ =C2=A0 =C2=A02.655732] /initrd.image: incomplete write (-28 !=3D 719058=
93)
> [ =C2=A0 =C2=A02.672708] Freeing initrd memory: 70224K
>=20
> Since we suspect possible image corruption by the kernel extracting,=C2=
=A0 I doubled=20
> my guest linux memory allocation.=C2=A0 Therefore I now have 416MB of mem=
ory reserved=20
> by the root linux command line for the guest.=C2=A0 I can see that the "M=
emTotal"=20
> available in /proc/meminfo went down by approx 416MB accordingly after up=
dating=20
> the root command memmap arg.=C2=A0 However, if I try to execute the "jail=
house cell=20
> linux ..." command with a=C2=A0 memory region .size of 400MB (or even 256=
MB) then=20
> jailhouse throws the following error:
>=20
> Traceback (most recent call last):
>  =C2=A0 File "./tools/jailhouse-cell-linux", line 824, in <module>
>  =C2=A0 =C2=A0 cell =3D JailhouseCell(config)
>  =C2=A0 File "/home/test/jailhouse-next/tools/../pyjailhouse/cell.py", li=
ne 36, in=20
> __init__
>  =C2=A0 =C2=A0 raise e
>  =C2=A0 File "/home/test/jailhouse-next/tools/../pyjailhouse/cell.py", li=
ne 33, in=20
> __init__
>  =C2=A0 =C2=A0 fcntl.ioctl(self.dev <http://self.dev>,=20
> JailhouseCell.JAILHOUSE_CELL_CREATE, create)
> OSError: [Errno 12] Cannot allocate memory
>=20
>  =C2=A0Any thoughts here?

Nothing obvious in the configs. Well, you have the 0x3a600000 range twice i=
n the=20
root cell config. That should not cause the problem, though. Should still b=
e fixed.

Maybe you are running out of hypervisor memory because your hardware does n=
ot=20
support large pages and therefore requires larger paging structure. But tha=
t's=20
also rather unlikely - unless the hardware is 5 years or so old. What all d=
oes=20
"jailhouse hardware check" report?

>=20
> 2. If I use my 30MB guest linux 4.19 initramfs instead (generated through=
 kernel=20
> "make install"), then it gets passed the extracting phase but falls into =
the=20
> dracut emergency shell.=C2=A0 The shell then keeps scrolling repeatedly o=
n the UART=20
> (ttyS0):
> :/#
> :/#
> :/#
> ...
> Any thoughts on why this scrolling is occuring? I'm viewing the serial ou=
tput on=20
> another linux machine with "cat /dev/ttyS0".
>=20
> Any idea why its dropping into the emergency prompt rather than continuin=
g to=20
> boot the kernel?=C2=A0 The initramfs was just re-generated with "make ins=
tall" and=20
> should match the 4.19 guest.

Given all the problems and variables, I would rather recommend trying a=20
known-to-work initrd first, ie. the one we generate via buildroot. If it he=
lps,=20
I can share a binary for x86 offlist. From there, you can stepwise change m=
ore=20
variables.

Jan

>=20
> Note that my root kernel is vanilla 4.16 and my non-root linux guest is 4=
.19=20
> jailhouse enabling from siemens.=C2=A0 I attached my latest System config=
 and=20
> non-linux cell config.
>=20
>=20
> Thanks for your repeated help,
>=20
> Wayne
>=20
> On Thu, Jun 13, 2019 at 2:55 PM Jan Kiszka <jan.kiszka@siemens.com=20
> <mailto:jan.kiszka@siemens.com>> wrote:
>=20
>     On 13.06.19 20:49, Wayne wrote:
>      > I added the "-k 10" to the command and unfortunately it did not ma=
ke a
>      > difference with the unpacking.=C2=A0 If I add=C2=A0 "root=3D/dev/r=
am0" it does get
>     past the
>      > unpacking, but throws the panic for "System is deadlocked on memor=
y".
>      >
>      > I have attached my current non-root kernel config.=C2=A0 Should I =
expect to be
>     able
>      > to log in to the non-root if I use the same initramfs as the root =
linux?
>      >
>=20
>     You should at least expect to see no error messages of the kernel, po=
ssibly
>     some
>     futile probing of devices and then likely a console prompt.
>=20
>     Let's try my kernel config from jailhouse-images first. If that works=
, you can
>     tune from there towards your needs. I still think there is some sizin=
g issue or
>     so, but I'm not seeing the key difference immediately.
>=20
>     Jan
>=20
>     --=20
>     Siemens AG, Corporate Technology, CT RDA IOT SES-DE
>     Corporate Competence Center Embedded Linux
>=20
--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/36306f60-8b63-f32d-2559-3a1ca6f53e87%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
