Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBYGEUPUAKGQEXDZIOHI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BD04A1B6
	for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Jun 2019 15:08:48 +0200 (CEST)
Received: by mail-wm1-x33a.google.com with SMTP id t141sf518292wmt.7
        for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Jun 2019 06:08:48 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560863328; cv=pass;
        d=google.com; s=arc-20160816;
        b=iruZmw2cTl/jgAJcjRJRDy+4rvt4D2/rD2MwcF/djMHYMhw79+eD8gyoa3mRQDqsD3
         SPudWtvAVczNbaJ0deetYEbZ2bXDLMq+i5nJQzktauW91EqvqyzTxvQv5DeEqSDSwAn+
         mzHFbX+nIe4bAgoZK/wRfYK/GV6m8dyMUgI3IxiRicN33w0uXFUlFeDudqF8GiWU/Kju
         cVvgrcIlNj8lGPnQTHx5bgsDq/K2oUV4EtVIUntnnex+DBt29WsmE8Du2bzS8wkIVxNY
         k6dja9sCQMgtljLsCCA7cUowPeUcuigDNbQXZ146Jpde23aKjppPLVFaI8V/C3G/tkhW
         ng8w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=ursp5r2N35eYJdAGRRMDIM4ekhc4YEFnPocG2WzP+hc=;
        b=Wf8g1r0+MGSdAeIhTENYZVANHLA4SwjskuoFY8UfTjv5YJWeyCoCyydH3r4ODUox0B
         S1A+j7EQbd53Gr7gSctrq6KfkB43Ki8dVHtOODvRiqJVohQtcKTnaE+8D9TuQt5doqW8
         oMCSt9fetjr6cHuFbPvkmqJMF1lZZYEt5uRvIwejMPR+PBgyC8n16cGDcuJjuhii6JQt
         dH8XgohbN6uNcCxnYbAchuWMxSgZPZ9JDYwX32SJYBrIaVm+WyPTo9qMaNz86RNVjHei
         VVaGH0tAyXr+11c4PX6goMncJRoNQqifU/rWmK01DuTl94MQSjlbf4+qkZfrpvv41GPg
         3dPg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ursp5r2N35eYJdAGRRMDIM4ekhc4YEFnPocG2WzP+hc=;
        b=giHqXu02AsoeGrc0o4E0x3Tg/hB2UONppZXifXs2Q0+DXnvv/ZI9WpsvWS01fKDBXP
         VY1NQ07PB/i+wy7YnBK0FH03Y6On8GlX0mJAbAxRtfpNDEW6pbrWlzCNa/MwSZ2ug5kF
         x63ORYuwvS5hTCyOWWqb2fqqYaNdsMNd7XAybZ2+V6WJXqt89PT68P4F4qjxt40QSiSI
         36vQ42YoTV4AptnKSS6fuPTwOZRtiVJEdSljOiZ0E4bhpRo8cU3yIdOb9qQvWqB7y2YF
         tQ+uJYfCZhM2og99KC5wkeNayUmyncf9P3Bfp8+EjInXDo6j59eWldtCpTu06eij2Lvb
         R6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ursp5r2N35eYJdAGRRMDIM4ekhc4YEFnPocG2WzP+hc=;
        b=ErPeS6Hz1yEcJZjToyvMaYBxa8iR/d5j0yBZOKq0yqm4hkJ/XCAmUN5rGGo7KXugnO
         tAc/hFvkPTKMKXHbwrRZRX/fK6XrR9yNTTeu9KVgode8m7fxaYD20UE5dg21p9ul7Xyd
         Qmk9fETMCxFc6R1E8RstbwJUI0ViZ8CBFoiS2TnVqFiGHPfrTPHJ4bAwVIfW2cUMwnyp
         rhIWy20j0Gtjm8cVUj4xa5AQ5dsKpchgUdAOEqZhNFDeeBcNc0ZKzLYOkmusJa+XIy7G
         KBZfPx7hZEDIG/UWZX2c91liaxG0cnjnmtEvTmkg+zdpCEorYc5a5N6TWKnePISA5IqU
         KUNA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV9el2TaZLd+AJ2veLKrK8pQPPsjbFcjerItZqXPaFGl2wL9+Rz
	g1DJPPDKgBTb2OXXp694ljY=
X-Google-Smtp-Source: APXvYqzKsRdHn769BnCSCphlrscaI5v/9VJY4giD1r8ENT/8Sz5q+q9Utw/2F2uEA8/ClJZqTc5E+A==
X-Received: by 2002:a05:6000:100a:: with SMTP id a10mr11862166wrx.154.1560863328216;
        Tue, 18 Jun 2019 06:08:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:b6c3:: with SMTP id g186ls963266wmf.5.gmail; Tue, 18 Jun
 2019 06:08:47 -0700 (PDT)
X-Received: by 2002:a1c:9696:: with SMTP id y144mr3618221wmd.73.1560863327535;
        Tue, 18 Jun 2019 06:08:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560863327; cv=none;
        d=google.com; s=arc-20160816;
        b=O9ZpG96Ofz5fjDta++rSBxTb6zPGjUzmRYPER5BDTSyab24NOVyLEP2jJ4JL4h8GX7
         LEFnTzLI3om09Ymje5mg5QCNou1WZ2sFcKCaP+YwFIPcP09d+0fDR/nAWhJNzUudwftd
         lXeEsNHsN6RT2XV6hePA1J2jummkpzRWpPsoP7iW0APp1eSTys06Af0sD3APX1L4SOCJ
         NfNJpfEFkkw2TA+HuS+K2dusPakXDUBXF7hKa79+ltZeQ1aZQVs7AZEBLia3NsTva6TB
         JCU83H060m5S/Lla60s6dcXUkzRftY18fkvu0PzLpB85vEamD9m6FLgG9+yQzfSxPtoJ
         xcFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=VKRyzzRBgH517/P+cqrBw6c2hll2MOkw1/E7wwITmDA=;
        b=WJUj883ar1oqEohCr/f2la+B3kAoIYmElZ+nOEN8tN6/NqFW6gSXNJBCXNR5ERTmzv
         fgIeiYXBy1cVlLMyp7GjCp/cXhbDVAneY2MoAJ2EHF3QZbLqAy3MJL75oM8/zEFDQiKw
         V/BvbRZHc814juMQOS6SAje47h1r9bJvHH+nNfztNibTsSqJia++5UQnAa6gcBYR/fkR
         UEEaRoZAK/r9+4guvZBFlP3EHbANQIH9FS3XgqxzedFewCPtek8UBPTdsAGk0hnqGS9I
         Q1iIWwlVA7fTRwcjnCHgx4oe4bfgf5C3wcs0Ey88geIhWS3jQzZhdcmMUDax1ugr97Nv
         19UQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id j18si580666wrc.1.2019.06.18.06.08.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Jun 2019 06:08:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x5ID8kge001626
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Jun 2019 15:08:46 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x5ID8kZU012544;
	Tue, 18 Jun 2019 15:08:46 +0200
Subject: Re: Linux non-root node question
To: Wayne <racedrive1503@gmail.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <CA++Khc2iKk1J6+0huh5__dS4HyujXzV9r+LbKLzuVZ4K3Bt5eA@mail.gmail.com>
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
 <36306f60-8b63-f32d-2559-3a1ca6f53e87@siemens.com>
 <CA++Khc3hURr3dFrw2ga=uf9A02KZ1OEEtMAPOVJyCAP3Fs+fmw@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <889c96a9-a7dc-4385-28e5-437fbc4d5008@siemens.com>
Date: Tue, 18 Jun 2019 15:08:45 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <CA++Khc3hURr3dFrw2ga=uf9A02KZ1OEEtMAPOVJyCAP3Fs+fmw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 18.06.19 14:10, Wayne wrote:
> Jan/Ralf:
>=20
> I just meant that my initramfs files get generated by the "dracut" script=
, which=20
> gets run automatically when executing "make install" in the kernel=20
> distribution.=C2=A0 I would be happy to try your x86 initrd binary, it ma=
y tell us=20
> something.=C2=A0 I haven't been able to install buildroot successfully.=
=C2=A0 Is there any=20

Sent.

> specific reason why you would need it for an x86 poweredge as opposed to =
the=20
> standard dracut/mkinitramfs for the guest?

The reason is primarily size, a bit convenience: For demo and test purposes=
, you=20
want a number of tools and services inside the initramfs that a normal does=
 not=20
contain (ssh/sshd, various hw diagnostic tools, rt-tests, iperf etc.). Of=
=20
course, you can manually define the rules to copy them in via dracut, likel=
y=20
quite a bit of work, but then the size would not be 8M. Sure, the latter is=
 only=20
an issue for smaller embedded targets.

>=20
> Running the "jailhouse hardware check" reports "ok" for all categories ex=
cept=20
> for the following (which report "optional"):
>=20
> VT-x (VMX) :
> VMX inside SMX=C2=A0 =C2=A0missing (optional)
>=20
> VT-d (IOMMU #0-3) :
> 39-bit AGAW=C2=A0 missing (optional)
>=20
> (2M pages and 1G pages show as ok)

Wasn't the reason, ok...

Jan

>=20
> Wayne
>=20
> On Tue, Jun 18, 2019 at 2:32 AM Jan Kiszka <jan.kiszka@siemens.com=20
> <mailto:jan.kiszka@siemens.com>> wrote:
>=20
>     On 17.06.19 21:06, Wayne wrote:
>      > Hi Jan,
>      >
>      > I am still having trouble getting the non-root linux kernel to boo=
t up.=20
>     Based
>      > on your suggestions I tried two scenarios and am using your AMD ke=
rnel
>     config
>      > you pointed me to above:
>      >
>      > 1. Attempted to use the 70MB root linux initramfs (generated throu=
gh kernel
>      > "make install"), but I get this error:
>=20
>     What do you mean with "generated through kernel"?
>=20
>      >
>      > [ =C2=A0 =C2=A02.648665] rootfs image is not initramfs (write erro=
r); looks like an
>     initrd
>      > [ =C2=A0 =C2=A02.655732] /initrd.image: incomplete write (-28 !=3D=
 71905893)
>      > [ =C2=A0 =C2=A02.672708] Freeing initrd memory: 70224K
>      >
>      > Since we suspect possible image corruption by the kernel extractin=
g,=C2=A0 I
>     doubled
>      > my guest linux memory allocation.=C2=A0 Therefore I now have 416MB=
 of memory
>     reserved
>      > by the root linux command line for the guest.=C2=A0 I can see that=
 the "MemTotal"
>      > available in /proc/meminfo went down by approx 416MB accordingly a=
fter
>     updating
>      > the root command memmap arg.=C2=A0 However, if I try to execute th=
e "jailhouse
>     cell
>      > linux ..." command with a=C2=A0 memory region .size of 400MB (or e=
ven 256MB) then
>      > jailhouse throws the following error:
>      >
>      > Traceback (most recent call last):
>      >=C2=A0 =C2=A0 File "./tools/jailhouse-cell-linux", line 824, in <mo=
dule>
>      >=C2=A0 =C2=A0 =C2=A0 cell =3D JailhouseCell(config)
>      >=C2=A0 =C2=A0 File "/home/test/jailhouse-next/tools/../pyjailhouse/=
cell.py", line
>     36, in
>      > __init__
>      >=C2=A0 =C2=A0 =C2=A0 raise e
>      >=C2=A0 =C2=A0 File "/home/test/jailhouse-next/tools/../pyjailhouse/=
cell.py", line
>     33, in
>      > __init__
>      >=C2=A0 =C2=A0 =C2=A0 fcntl.ioctl(self.dev <http://self.dev> <http:/=
/self.dev>,
>      > JailhouseCell.JAILHOUSE_CELL_CREATE, create)
>      > OSError: [Errno 12] Cannot allocate memory
>      >
>      >=C2=A0 =C2=A0Any thoughts here?
>=20
>     Nothing obvious in the configs. Well, you have the 0x3a600000 range t=
wice in
>     the
>     root cell config. That should not cause the problem, though. Should s=
till be
>     fixed.
>=20
>     Maybe you are running out of hypervisor memory because your hardware =
does not
>     support large pages and therefore requires larger paging structure. B=
ut that's
>     also rather unlikely - unless the hardware is 5 years or so old. What=
 all does
>     "jailhouse hardware check" report?
>=20
>      >
>      > 2. If I use my 30MB guest linux 4.19 initramfs instead (generated =
through
>     kernel
>      > "make install"), then it gets passed the extracting phase but fall=
s into the
>      > dracut emergency shell.=C2=A0 The shell then keeps scrolling repea=
tedly on the
>     UART
>      > (ttyS0):
>      > :/#
>      > :/#
>      > :/#
>      > ...
>      > Any thoughts on why this scrolling is occuring? I'm viewing the se=
rial
>     output on
>      > another linux machine with "cat /dev/ttyS0".
>      >
>      > Any idea why its dropping into the emergency prompt rather than
>     continuing to
>      > boot the kernel?=C2=A0 The initramfs was just re-generated with "m=
ake install"
>     and
>      > should match the 4.19 guest.
>=20
>     Given all the problems and variables, I would rather recommend trying=
 a
>     known-to-work initrd first, ie. the one we generate via buildroot. If=
 it helps,
>     I can share a binary for x86 offlist. From there, you can stepwise ch=
ange more
>     variables.
>=20
>     Jan
>=20
>      >
>      > Note that my root kernel is vanilla 4.16 and my non-root linux gue=
st is 4.19
>      > jailhouse enabling from siemens.=C2=A0 I attached my latest System=
 config and
>      > non-linux cell config.
>      >
>      >
>      > Thanks for your repeated help,
>      >
>      > Wayne
>      >
>      > On Thu, Jun 13, 2019 at 2:55 PM Jan Kiszka <jan.kiszka@siemens.com
>     <mailto:jan.kiszka@siemens.com>
>      > <mailto:jan.kiszka@siemens.com <mailto:jan.kiszka@siemens.com>>> w=
rote:
>      >
>      >=C2=A0 =C2=A0 =C2=A0On 13.06.19 20:49, Wayne wrote:
>      >=C2=A0 =C2=A0 =C2=A0 > I added the "-k 10" to the command and unfor=
tunately it did not make a
>      >=C2=A0 =C2=A0 =C2=A0 > difference with the unpacking.=C2=A0 If I ad=
d=C2=A0 "root=3D/dev/ram0" it does get
>      >=C2=A0 =C2=A0 =C2=A0past the
>      >=C2=A0 =C2=A0 =C2=A0 > unpacking, but throws the panic for "System =
is deadlocked on memory".
>      >=C2=A0 =C2=A0 =C2=A0 >
>      >=C2=A0 =C2=A0 =C2=A0 > I have attached my current non-root kernel c=
onfig.=C2=A0 Should I
>     expect to be
>      >=C2=A0 =C2=A0 =C2=A0able
>      >=C2=A0 =C2=A0 =C2=A0 > to log in to the non-root if I use the same =
initramfs as the root
>     linux?
>      >=C2=A0 =C2=A0 =C2=A0 >
>      >
>      >=C2=A0 =C2=A0 =C2=A0You should at least expect to see no error mess=
ages of the kernel,
>     possibly
>      >=C2=A0 =C2=A0 =C2=A0some
>      >=C2=A0 =C2=A0 =C2=A0futile probing of devices and then likely a con=
sole prompt.
>      >
>      >=C2=A0 =C2=A0 =C2=A0Let's try my kernel config from jailhouse-image=
s first. If that
>     works, you can
>      >=C2=A0 =C2=A0 =C2=A0tune from there towards your needs. I still thi=
nk there is some
>     sizing issue or
>      >=C2=A0 =C2=A0 =C2=A0so, but I'm not seeing the key difference immed=
iately.
>      >
>      >=C2=A0 =C2=A0 =C2=A0Jan
>      >
>      >=C2=A0 =C2=A0 =C2=A0--
>      >=C2=A0 =C2=A0 =C2=A0Siemens AG, Corporate Technology, CT RDA IOT SE=
S-DE
>      >=C2=A0 =C2=A0 =C2=A0Corporate Competence Center Embedded Linux
>      >
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
jailhouse-dev/889c96a9-a7dc-4385-28e5-437fbc4d5008%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
