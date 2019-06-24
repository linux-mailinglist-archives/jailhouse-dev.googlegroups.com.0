Return-Path: <jailhouse-dev+bncBCC7DQPESQPRBTHRYTUAKGQERDPU5RA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73a.google.com (mail-qk1-x73a.google.com [IPv6:2607:f8b0:4864:20::73a])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC3351CA4
	for <lists+jailhouse-dev@lfdr.de>; Mon, 24 Jun 2019 22:55:41 +0200 (CEST)
Received: by mail-qk1-x73a.google.com with SMTP id z13sf2832076qka.15
        for <lists+jailhouse-dev@lfdr.de>; Mon, 24 Jun 2019 13:55:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561409740; cv=pass;
        d=google.com; s=arc-20160816;
        b=T3I0WiVswb3LiwUgXmlYrRYzOLPUtFNexhETPvuPhPEH7m32bAmbs+KVcld9ghe4nB
         rX5vznPfk1pCiGZyg51YwEOiXfwwSueAis8fRGf4uXj81YpeW7XoXa/Nth9lIdFryBKB
         uUtMoIY4fzzOZPjT1it2I7QZXVZadRj5H51q8f3xtpbswbbLtKE1DTeFtK6ke5RuiGXa
         ZaortuBlBtOgwYa+dCBa/cw+/qdlnp2ibWQhwG6sAOKPKbvyLUixQTfFCRetNbEvyQSu
         Cl0+GbT8U65ESPOPVz2sdREkvVr1qlutWHqftFw3RbO39YZHlicO1Pa83t+lW65lWdbW
         0bNg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=q5PsC8q0PCnMm2QsvCLbfHt4/4YHIifO0c/0erZ3hKY=;
        b=vS3rhG5aI0UawfWVYc4CQ9LkvM+O7i1Nk5ePTz+ccYbHHxzMvbT1nDfoN0CqM6OmmL
         t8b3nEfnZUiYVf5PZAWactQqHEu3TXD1d5B0M+ivuozaT1V6j5Qq+nWIPHUmM/IgcaYo
         f9JZTkue2zOaBOq97OZigxw3eh397cqTgoTYlubjv3+4Ctz/pSOt3QuGXitxERXKbOq1
         q59yQYKhZSAwMx6Rjhplt9VpTi6QfqTyeDujRRn6jtQ5kK0DHg2gLyy9Ym0sE8xX/Buq
         fVLRRlxUzfIvHP/246XrgmgzxNoHhrNJ07cuA1x4lN7Px0LWW9NTEc7zApRY7SjZuyEV
         XXDg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=st6uMnxu;
       spf=pass (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::742 as permitted sender) smtp.mailfrom=racedrive1503@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=q5PsC8q0PCnMm2QsvCLbfHt4/4YHIifO0c/0erZ3hKY=;
        b=UT/0W8wACQRIX+K3fSzQreKVn4Epcnb+9/Aeqa72MLT+EZd9oHGWDEvzO5fNr43uLv
         FX4K2PFCD+SaJ5V2ZsLOEp71RMemXhjIhDJuHJZoaY8RtORF8WLsTEZcCJlQypol/UTz
         WSjRm1FnDqs/tyv7GNE7rWZ05IWxlAxkQs0nhnf3fUF8DyHLJ9eVqkeyi2L8Jqbaz1DC
         eq6yS1oHdiN9b0uTManCUfVarmDIrpGaRbfdkHfF+WjVsKDWOi8LOj3H4dLNcOuMm4co
         FQUTk2StWWRL0xRTb3bjpx9ssKOqlS46qsJCGohtNWwgkTUETkxliAVdQCAIG3F8qr56
         EW7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=q5PsC8q0PCnMm2QsvCLbfHt4/4YHIifO0c/0erZ3hKY=;
        b=ZTg9o1jPJKvwJMyYU1qnpwGKeFlqaYDGMfUxEKq1GpqQADOl2ad7vm++0tRkAJj71A
         oFgb7tGN407WaMAOGxkPGjl6i1cMbb2MLc1YaxL0nKWs7yJiGuTrPD1X+er5y3y4dvCy
         0NyotdqciqOQ0boKtrQMs8TQB/p/5tdJFi4SqotvEVmqNfgElksTQ5DXz2sjBlQpc71i
         Ki7yL8TZQeSLHuGwX7D0YddHQ/zJM6fG6x8Un1IZ51Bq2n3u61LqLSsI+AAtMPgyfQh1
         EKACZ5rBayxGazxE9X3pEjDXb/5zsln79rJFIYy+9vFNUwvbCwpMrzeLT5gImCmeGpLE
         ZvdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=q5PsC8q0PCnMm2QsvCLbfHt4/4YHIifO0c/0erZ3hKY=;
        b=RKrnzbSnodZ26dpEeSzuPYg5aB62+ZzDDysucSwEsIerqC6g8Lro3tJfFlmpaxoj2u
         ZKS9A9ho8L3wBF4PR96gbWUsecf12zuWiN5i4IOA1hr7Vqe72kFtTUM/DEBDQpUei1K4
         5Bk6l75aczcH9VTprbXDZBBGsBWMOtSWLKebourQ+nNIJETPPJgoYv15f+qXmPRiavjC
         47zp0wBECW9zNZWAQHI/4jAiprNElrLagaC9JVdRfHzPC13F3Q1NNL0J7szEE0vQjGus
         7ZyiYKswouLwS9ItHP93aEWpyZAt86FnsyHqJObvvq+cwBeBd9UHUipJ0nRDaKIH7J/m
         kxpw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWfsoPlNNw+LLQUjm9NPKLdmP/A/Y/yjhUl+vCEeTnzTG//j5ey
	/HRdJ3mNJNEP4EAtYyZd5os=
X-Google-Smtp-Source: APXvYqxSXDp2iI7WXMqCVr//IvFdwi0qGd+uYYyv4T+iyBtreFQMHWnfjzb+bV/w9ojrsAXggJX/Ig==
X-Received: by 2002:a0c:8701:: with SMTP id 1mr10960621qvh.214.1561409740357;
        Mon, 24 Jun 2019 13:55:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:5556:: with SMTP id o22ls1617166qtr.3.gmail; Mon, 24 Jun
 2019 13:55:40 -0700 (PDT)
X-Received: by 2002:ac8:3518:: with SMTP id y24mr30813673qtb.55.1561409739989;
        Mon, 24 Jun 2019 13:55:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561409739; cv=none;
        d=google.com; s=arc-20160816;
        b=fQqL7LrfBnd/CHAC7AWXh2np+2eN1r9LVWM0ZGd+PIEWnel3dBx9XcKrnjvzunOxaI
         vYP6PZ+YEl3q2SGi+HYIMyTIbJZOHvNz3mXEnBrRzmy5CuKo5WCKIjl+2ZJsk9b4+gii
         UGw99FJcsecb6L6NozXeRwmNqO/toWv5OQM4JgOCpwu4LGjTkBFEzpq4f3mSw6CxtMsf
         5IbAZZu2e3g+fp6uyiXESm04egjgOE1hiN0gaVbps0vkMv4LCJfMU3Q265R/30oj9kG1
         FxU12wz6Sm8aNn8QIM7bZ31XH3gWRHo/QE2UJkApeQUl/Gd6us9kUzF7KQySizNciTdU
         eRrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gDtPckhSvRFjLnk1xMO0DxRQZqr8z9/AwZ69GSw5JuM=;
        b=Pw+ii+boxvwstaAeK/ShICyMAPVPxWp9CZH1gmmNww1XFXz9tkl4TDeFUAAA4XDyfn
         oY1Nrn8drdiWB8yLnpO4KYhsFC9ALrjCI3a+taN28AOWVozLo1ekVXjxiBDEGPsYEwmD
         SD7GLNCA2ladGMP9YezjKXDCExzZhi5OOmVWuSEqW8s7VKbU4cVMGJc/6Abz6DvVe9H8
         xS5qJe9TvntyeX6Usge+g4/zw+4usekxrtrdqF4uXP2MRlUURnr55QnyJWhK+UF/Oe0f
         VA/VRLeRRCx3Ncat7dhEAeFFIBDVE0Ztu0ei5lHPnvj2OFbMMvk68U3r27IcGSfhOFe+
         eTog==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=st6uMnxu;
       spf=pass (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::742 as permitted sender) smtp.mailfrom=racedrive1503@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com. [2607:f8b0:4864:20::742])
        by gmr-mx.google.com with ESMTPS id m8si599311qtp.0.2019.06.24.13.55.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Jun 2019 13:55:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::742 as permitted sender) client-ip=2607:f8b0:4864:20::742;
Received: by mail-qk1-x742.google.com with SMTP id t8so10914831qkt.1
        for <jailhouse-dev@googlegroups.com>; Mon, 24 Jun 2019 13:55:39 -0700 (PDT)
X-Received: by 2002:a37:a194:: with SMTP id k142mr9964148qke.313.1561409739790;
 Mon, 24 Jun 2019 13:55:39 -0700 (PDT)
MIME-Version: 1.0
References: <CA++Khc2iKk1J6+0huh5__dS4HyujXzV9r+LbKLzuVZ4K3Bt5eA@mail.gmail.com>
 <bd92264a-60c1-6f76-07f0-93cb9bd08a01@siemens.com> <CA++Khc0seBDnN2hD7EJh3g25unUEFqBuiRSm5HwOE+1JEX0D2Q@mail.gmail.com>
 <63552042-48d0-cb32-e893-28ae4ab29ccd@siemens.com> <CA++Khc3Mj=SFen+_f7RE5g1Paq1AhHQOrBX3HqNoJvvbymQh0w@mail.gmail.com>
 <5b90a899-c42a-a360-8398-c3af35920765@siemens.com> <CA++Khc0whU3=U86WGNEtLUZoOkKuYLiEA+nqOjW1UFcRDeGTRQ@mail.gmail.com>
 <0da95034-9bd0-4415-4d3b-5f6687a84563@siemens.com> <CA++Khc1Xjt8yMT39shFraJnzSWp8Ctc9-Cv-mNxOqf+UkxhyxA@mail.gmail.com>
 <36306f60-8b63-f32d-2559-3a1ca6f53e87@siemens.com> <CA++Khc3hURr3dFrw2ga=uf9A02KZ1OEEtMAPOVJyCAP3Fs+fmw@mail.gmail.com>
 <889c96a9-a7dc-4385-28e5-437fbc4d5008@siemens.com> <CA++Khc2-Cv==+eJCS8cN-ShK7q==Qs7UpW-ZfoUcEZ2Tam5c7Q@mail.gmail.com>
 <3bb0abe5-55ca-b9b5-edff-6bc8d0ef85af@siemens.com> <CA++Khc2YjAfFL1x-uU_N9FoUhZUMSsKQ2bKHAbd17U=HA_90Nw@mail.gmail.com>
 <CA++Khc0Kev1DGnKeKr2Dd3B4qHWZxZFrgDsMFQ1PX+OHYxDNsA@mail.gmail.com> <3660acb8-e530-9625-bcac-177b8c84b642@siemens.com>
In-Reply-To: <3660acb8-e530-9625-bcac-177b8c84b642@siemens.com>
From: Wayne <racedrive1503@gmail.com>
Date: Mon, 24 Jun 2019 16:55:28 -0400
Message-ID: <CA++Khc0Fxz3NKS5p0ApbTtos5j5GtuJzBOJ+4jT31faXn7fbrw@mail.gmail.com>
Subject: Re: Linux non-root node question
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="000000000000e39e41058c1808b7"
X-Original-Sender: racedrive1503@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=st6uMnxu;       spf=pass
 (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::742
 as permitted sender) smtp.mailfrom=racedrive1503@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--000000000000e39e41058c1808b7
Content-Type: text/plain; charset="UTF-8"

Hi Jan,

I have a couple more questions on serial device (UART) allocation.  If I
have two serial devices, ttyS0 (IRQ4 w/address 0x3f8) and ttyS1(IRQ3
w/address 0x2f8).  Is the setup below the correct way to allocate ttyS0 to
the root linux and the ttyS1 to a non-root linux guest?

// .irq chips array in the root config
.irqchips = {
{
.address = 0xfec00000,
.id = 0x1f0ff,
.pin_bitmap = {
0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
},
},

//.irq chips array in the guest config
.irqchips = {
{
.address = 0xfec00000,
.id = 0x1f0ff,
.pin_bitmap = { 0x00008 }, /*remap ttyS1 to the linux guest, root keeps
ttyS0 */
},

//.pio_bitmap root (keep ttyS0, lose ttyS1)
.pio_bitmap = {
[ 0x2f8/8 ...  0x2ff/8] = -1, /* serial2 */
[ 0x3f8/8 ...  0x3ff/8] = 0, /* serial1 */
},

//.pio_bitmap guest (keep ttyS1, lost ttyS0)
.pio_bitmap = {
[ 0x2f8/8 ...  0x2ff/8] = -1, /* serial2 */
[ 0x3f8/8 ...  0x3ff/8] = 0, /* serial1 */
},

Also, is there any way to prevent the non-root from trying to probe against
ttyS0 at startup and causing a memory access violation?  I'm aware of the
8250.nr_uarts=1, but it seems to default to enumerating ttyS0.

Thanks again for all of your help,
Wayne

On Wed, Jun 19, 2019 at 12:24 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:

> On 19.06.19 18:15, Wayne wrote:
> > Hi Jan:
> >
> > I figured out my problem with Jailhouse throwing the "Cannot allocate
> memory"
> > error when trying to create a guest cell with more than 200MB RAM.  I
> had to
> > increase my hypervisor memory size from 6MB to 64MB.  Now I can unpack
> my larger
>
> Ah, makes sense. You should see the allocation stats after each major
> operation
> on the Jailhouse console. Forgot to point to that out because I thought we
> weren't that tight but rather had another problem that caused excessive
> memory need.
>
> > root initramfs (~70MB) successfully, but now that falls into the dracut
> > emergency shell too.  This appears to be occurring when the kernel tries
> to
> > pivot/switch to the "real" root filesystem.
>
> Yeah, dracut won't give you a "real" system without much more work.
>
> >
> > I can boot into a real kernel prompt with your rootfs.cpio, but I really
> would
> > like to be running a copy of the full root linux....just with the
> filesystem
> > being entirely in the ramdisk.  Any thoughts on how to accomplish this?
> It
> > seems like buildroot can generate images based on busybox, with the ash
> shell.
> > I really would like bash support.
> >
>
> You should achieve that by packing a regular rootfs into a cpio.
>
> Jan
>
> > Thanks for all of your help getting to this point,
> > Wayne
> >
> > On Tue, Jun 18, 2019 at 1:09 PM Wayne <racedrive1503@gmail.com
> > <mailto:racedrive1503@gmail.com>> wrote:
> >
> >     Jan:
> >
> >     To summarize:
> >     1. My smaller guest initramfs (~30MB) unpacks properly, but then
> falls into
> >     the dracut emergency shell.  Now that i'm using minicom it no longer
> scrolls
> >     repeatedly.  I still can't get to a proper kernel login prompt.
> >     2. My larger root initramfs (~70MB) fails to unpack, and also
> jailhouse
> >     fails to create the guest if I attempt to allocate more memory.
> >     3. I can get to the kernel login prompt (and login successfully) if
> I use
> >     your rootfs.cpio binary.  This option so far is the most promising.
> >
> >     Thanks for your assistance,
> >     Wayne
> >
> >     On Tue, Jun 18, 2019 at 12:01 PM Jan Kiszka <jan.kiszka@siemens.com
> >     <mailto:jan.kiszka@siemens.com>> wrote:
> >
> >         On 18.06.19 17:48, Wayne wrote:
> >          > Jan/Ralf:
> >          >
> >          > Ok, with the rootfs.cpio you just provided I can see the
> following on
> >         my serial
> >          > port:
> >          >
> >          > Welcome to Buildroot
> >          > jailhouse login:
> >          >
> >          > So that's progress.  Is there a default user name and
> password to use to
> >          > complete the login?  That would point to the problem being
> booting
> >         against my
> >          > initramfs files.
> >
> >         "root" without password is the login.
> >
> >          >
> >          > Also, the issue where my serial output scrolled continuously
> was due
> >         to the
> >          > capture method.  I switched to minicom and no longer see that
> occur.
> >
> >         OK, consistent sign. Then we are back to a size issue, not a
> format
> >         problem: You
> >         larger image is too large, but enlarging the inmate does not
> work. If it
> >         would,
> >         your larger image will likely boot as well.
> >
> >          >
> >          > Any further thoughts on why jailhouse fails to load the guest
> when I
> >         set the
> >          > memory region greater than 200MB?
> >
> >         I need to analyze your config, maybe try it out.
> >
> >         Jan
> >
> >         --
> >         Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> >         Corporate Competence Center Embedded Linux
> >
>
> --
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> Corporate Competence Center Embedded Linux
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc0Fxz3NKS5p0ApbTtos5j5GtuJzBOJ%2B4jT31faXn7fbrw%40mail.gmail.com.
For more options, visit https://groups.google.com/d/optout.

--000000000000e39e41058c1808b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Jan,<div><br>I have a couple more questions on serial d=
evice (UART) allocation.=C2=A0 If I have two serial devices, ttyS0 (IRQ4 w/=
address 0x3f8) and ttyS1(IRQ3 w/address 0x2f8).=C2=A0 Is the setup below th=
e correct way to allocate ttyS0 to the root linux and the ttyS1 to a non-ro=
ot linux guest?</div><div><br></div><div>// .irq chips array in the root co=
nfig</div><div>.irqchips =3D {<br>{<br>			.address =3D 0xfec00000,<br>			.i=
d =3D 0x1f0ff,<br>			.pin_bitmap =3D {<br>				0xffffffff, 0xffffffff, 0xfff=
fffff, 0xffffffff=C2=A0<br>			},<br>		},<br></div><div><br></div><div>//.ir=
q chips array in the guest config</div><div>.irqchips =3D {<br>{<br>.addres=
s =3D 0xfec00000,<br>.id =3D 0x1f0ff,<br>.pin_bitmap =3D { 0x00008 }, /*rem=
ap ttyS1 to the linux guest, root keeps ttyS0 */<br>},=C2=A0=C2=A0<br></div=
><div><br></div><div>//.pio_bitmap root (keep ttyS0, lose ttyS1)</div><div>=
.pio_bitmap =3D {<br></div><div>[ 0x2f8/8 ... =C2=A00x2ff/8] =3D -1, /* ser=
ial2 */<br></div><div>[ 0x3f8/8 ... =C2=A00x3ff/8] =3D 0, /* serial1 */<br>=
</div><div>},</div><div><br></div><div><div>//.pio_bitmap guest (keep ttyS1=
, lost ttyS0)</div><div>.pio_bitmap =3D {<br></div><div>[ 0x2f8/8 ... =C2=
=A00x2ff/8] =3D -1, /* serial2 */<br></div><div>[ 0x3f8/8 ... =C2=A00x3ff/8=
] =3D 0, /* serial1 */<br></div><div>},</div></div><div><br></div><div>Also=
, is there any way to prevent the non-root from trying to probe against tty=
S0 at startup and causing a memory access violation?=C2=A0 I&#39;m aware of=
 the 8250.nr_uarts=3D1, but it seems to default to enumerating ttyS0.</div>=
<div><br></div><div>Thanks again for all of your help,<br></div><div>Wayne<=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Wed, Jun 19, 2019 at 12:24 PM Jan Kiszka &lt;<a href=3D"mailto:jan.=
kiszka@siemens.com">jan.kiszka@siemens.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On 19.06.19 18:15, Wayne wrote:<b=
r>
&gt; Hi Jan:<br>
&gt; <br>
&gt; I figured out my problem with Jailhouse throwing the &quot;Cannot allo=
cate memory&quot; <br>
&gt; error when trying to create a guest cell with more than 200MB RAM.=C2=
=A0 I had to <br>
&gt; increase my hypervisor memory size from 6MB to 64MB.=C2=A0 Now I can u=
npack my larger <br>
<br>
Ah, makes sense. You should see the allocation stats after each major opera=
tion <br>
on the Jailhouse console. Forgot to point to that out because I thought we =
<br>
weren&#39;t that tight but rather had another problem that caused excessive=
 memory need.<br>
<br>
&gt; root initramfs (~70MB) successfully, but now that falls into the dracu=
t <br>
&gt; emergency shell too.=C2=A0 This appears to be occurring when the kerne=
l tries to <br>
&gt; pivot/switch to the &quot;real&quot; root filesystem.<br>
<br>
Yeah, dracut won&#39;t give you a &quot;real&quot; system without much more=
 work.<br>
<br>
&gt; <br>
&gt; I can boot into a real kernel prompt with your rootfs.cpio, but I real=
ly would <br>
&gt; like to be running a copy of the full root linux....just with the file=
system <br>
&gt; being entirely in the ramdisk.=C2=A0 Any thoughts on how to accomplish=
 this?=C2=A0 It <br>
&gt; seems like buildroot can generate images based on busybox, with the as=
h shell.=C2=A0 <br>
&gt; I really would like bash support.<br>
&gt; <br>
<br>
You should achieve that by packing a regular rootfs into a cpio.<br>
<br>
Jan<br>
<br>
&gt; Thanks for all of your help getting to this point,<br>
&gt; Wayne<br>
&gt; <br>
&gt; On Tue, Jun 18, 2019 at 1:09 PM Wayne &lt;<a href=3D"mailto:racedrive1=
503@gmail.com" target=3D"_blank">racedrive1503@gmail.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:racedrive1503@gmail.com" target=3D"_blank=
">racedrive1503@gmail.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Jan:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0To summarize:<br>
&gt;=C2=A0 =C2=A0 =C2=A01. My smaller guest initramfs (~30MB) unpacks prope=
rly, but then falls into<br>
&gt;=C2=A0 =C2=A0 =C2=A0the dracut emergency shell.=C2=A0 Now that i&#39;m =
using minicom it no longer scrolls<br>
&gt;=C2=A0 =C2=A0 =C2=A0repeatedly.=C2=A0 I still can&#39;t get to a proper=
 kernel login prompt.<br>
&gt;=C2=A0 =C2=A0 =C2=A02. My larger root initramfs (~70MB) fails to unpack=
, and also jailhouse<br>
&gt;=C2=A0 =C2=A0 =C2=A0fails to create the guest if I attempt to allocate =
more memory.<br>
&gt;=C2=A0 =C2=A0 =C2=A03. I can get to the kernel login prompt (and login =
successfully) if I use<br>
&gt;=C2=A0 =C2=A0 =C2=A0your rootfs.cpio binary.=C2=A0 This option so far i=
s the most promising.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Thanks for your assistance,<br>
&gt;=C2=A0 =C2=A0 =C2=A0Wayne<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Tue, Jun 18, 2019 at 12:01 PM Jan Kiszka &lt;<a =
href=3D"mailto:jan.kiszka@siemens.com" target=3D"_blank">jan.kiszka@siemens=
.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jan.kiszka@siemens.com=
" target=3D"_blank">jan.kiszka@siemens.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On 18.06.19 17:48, Wayne wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; Jan/Ralf:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; Ok, with the rootfs.cpio you ju=
st provided I can see the following on<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0my serial<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; port:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; Welcome to Buildroot<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; jailhouse login:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; So that&#39;s progress.=C2=A0 I=
s there a default user name and password to use to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; complete the login?=C2=A0 That =
would point to the problem being booting<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0against my<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; initramfs files.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;root&quot; without password is =
the login.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; Also, the issue where my serial=
 output scrolled continuously was due<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; capture method.=C2=A0 I switche=
d to minicom and no longer see that occur.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OK, consistent sign. Then we are back=
 to a size issue, not a format<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0problem: You<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0larger image is too large, but enlarg=
ing the inmate does not work. If it<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0would,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0your larger image will likely boot as=
 well.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; Any further thoughts on why jai=
lhouse fails to load the guest when I<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; memory region greater than 200M=
B?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I need to analyze your config, maybe =
try it out.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Jan<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Siemens AG, Corporate Technology, CT =
RDA IOT SES-DE<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Corporate Competence Center Embedded =
Linux<br>
&gt; <br>
<br>
-- <br>
Siemens AG, Corporate Technology, CT RDA IOT SES-DE<br>
Corporate Competence Center Embedded Linux<br>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CA%2B%2BKhc0Fxz3NKS5p0ApbTtos5j5GtuJzBOJ%2B4jT31fa=
Xn7fbrw%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://gr=
oups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc0Fxz3NKS5p0ApbTtos5j5GtuJz=
BOJ%2B4jT31faXn7fbrw%40mail.gmail.com</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

--000000000000e39e41058c1808b7--
