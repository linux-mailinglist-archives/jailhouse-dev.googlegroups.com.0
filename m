Return-Path: <jailhouse-dev+bncBCC7DQPESQPRBP5O7LTQKGQEEZVQBCY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-xc3c.google.com (mail-yw1-xc3c.google.com [IPv6:2607:f8b0:4864:20::c3c])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDA23BB3A
	for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Jun 2019 19:45:36 +0200 (CEST)
Received: by mail-yw1-xc3c.google.com with SMTP id s204sf11007123yws.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Jun 2019 10:45:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560188735; cv=pass;
        d=google.com; s=arc-20160816;
        b=pwThbhUzc8YfbKOljxKAjoyELnPvOSMACJIhAJ0Mo9UNDSTb0uAFd+TdCcQ1PYfbVe
         1qZX/D90eHGVGg4ujJmwbcxyM5xqA7/CGO2Slu16KzM/4mV5KhZf8wUHD+IngI/Sh2dR
         n2alJAbs6u3jmGMMAX4t+TOp0C/9aILoIIQo/lymMi2gnCzl0Uo2ZvZbVqQNVoXSNFFq
         qXUzAoOXvvheKRYzz3gyKVO2dFt3IE9qnpV8LXZrFG3JDednclHiRmYR7WWfRFXoVq6q
         2HycoWcaIAraW+DnRSSkhx9LNYHvBsg4zR/6v4B6hksfqqFtZYkqaTHb+ee+tuPLfKqT
         CFOA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=LKTCDaqjh8ML6ETK6a//TJOq/gcsF5tcldWoPShH8gU=;
        b=ODpakonc61aLes3vAzCTL1fEET3LbIzQgGb4f+WKvHjp7+u1SfCLMD/kIPrPXfMkTa
         4x/UNmxYaBr5U3OfCfWTymAKwaSboWSVvbRIVQsZ0WZ/i1HkUIBjX0t3kfqoXrQ1pMgs
         dCpv8XMpJNe47iyh50ssTgs1JiT4O0m+6VLC5D3oi+MjAC1Ve8FkcSnWJG3qu8wntivj
         dniYxDTjsOnNB36/4dKP26oS9jwA4+6EXTCWahXb9QCLY/p6S/nyZ5hq0oypwaDCZiHv
         9mD0jI/EcXtzcPgjx7Uytg0OTixVrY3go2L+KlrbOuPDMwj7lA7efAyQpxg2OnFrXAv9
         N1cQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=PL8ygkwC;
       spf=pass (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::829 as permitted sender) smtp.mailfrom=racedrive1503@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LKTCDaqjh8ML6ETK6a//TJOq/gcsF5tcldWoPShH8gU=;
        b=fDqAe7+jPZ46X00ZvGa11yjUun9xKtheBLzLJ67uWLBAnGRuIX4uHjG95LiPYyxzU2
         7LA6/ntp4drPpCQktO1MEATEZIpMvGZUWbPscltGFp359+QZUdadQ4jneRHH7qX7/kgb
         0EiGF7g3PWxg1ezUY7QcDtM68exEYdS32BmQBkKBe5E+dWpppjjTuRvVylvGVuUeMsKy
         oL8VYxc2DJl0e9ZvIO/mWL3wldxRF+ceLR/ZMDaAKVWOfPBxMTFKCtgHj/+WB7lmdtZF
         Ys9aM0dS+t4PhsVx3rwgbk4Ez3XdqNmUjq4bjjcN+TyyTjg/n6O4IcIvTvOvbHhSbQAF
         qGgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LKTCDaqjh8ML6ETK6a//TJOq/gcsF5tcldWoPShH8gU=;
        b=unq4S3P0REaEFC1xzM+TR/koleCRZ0UuGJE1ueTFEQnblNX+aFtGOCNSBbcRjFUI0l
         W/moukK5EudPD0sOK3dnMIF2l6wpZIJcU69f41jU8MXZp0X8X9BdOscctGmnnvlG5J5K
         hsXZsD8XXNfZ9/7h7o6D7rqkMYRv9qAjsieUPzAbWO9VC0LEkTqMJX8qcg6HOcGkun59
         uwgny8QkG2ES7Ds6UHsSDegr49StRyY2oyyR2HLHhxjktSMJuqJ0RXoqL4yV2mMxHknY
         9TAXuRyELouU8cEuImgt2Gs4JYxdB88/Rw6jIxmdkW6kEmjod2e4XUAb2Fzdmj2HXRwV
         V1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LKTCDaqjh8ML6ETK6a//TJOq/gcsF5tcldWoPShH8gU=;
        b=UPv/VJ5Sl/qdSZIPgu4gDtt3nSF9TEamwM/NRlFqq1e3v+k0Z03mj19SZNRI6rA0K5
         Rb++JAtFm5481H8b0ion1QDcPdEFYjPoxOKvzFS/BQNzY+9i2OQy+h8xsySyQofYM1q2
         uY4WaKtiHd6Ech+wIEMEvAAyCu17BnBL78wkyyrjAuMtLiskj46yd3cOb0SykBBKQkGl
         8OvQTwM5uZWU70kfGeYt98SAf3d9JtMXS/y1iB8N18cFQztVo8rSZhedIA+J89sOM79u
         F4iMxGwx4ewsl1A4rSeHfxGk59rPcFvPJdgioOVuYEIAQeMVGvRIOjcGOp8WGN9/MF91
         uL6Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXLAjlhvj9hFZO2n42vnaD5eShT0U7800X5JECRg08/fuddvyIB
	OX9bA6OPRwHaSfWc8N7iS9w=
X-Google-Smtp-Source: APXvYqwA5+pyXZL/Y7T/2iRPeN4l85AO//zJA/dpOU0qylwqIRvJRvlWM/RbonVKjJE4Jx0Av9AIug==
X-Received: by 2002:a81:3d10:: with SMTP id k16mr35035916ywa.460.1560188735582;
        Mon, 10 Jun 2019 10:45:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:ed7:: with SMTP id 206ls699812ybo.9.gmail; Mon, 10 Jun
 2019 10:45:35 -0700 (PDT)
X-Received: by 2002:a25:55c3:: with SMTP id j186mr35399177ybb.213.1560188734977;
        Mon, 10 Jun 2019 10:45:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560188734; cv=none;
        d=google.com; s=arc-20160816;
        b=VF2JIChXw61mB3S1o/C/idGTDcbCHo9J07kSEh06WC7HHFD47zrJB1AxGUbRqxHs9c
         zFZn6yL/FOncuwWwmka5dA36jgrhT7M9HfDOBBvfwwWeHTkOPesUpnJtNQtltzZ2+yol
         gEGIBfG9gW/VTb7pUcCFxEA2WGxSuIaNnXgRzSbfLFmpYRE2uRJWZMQ740Ki2ow1xhuv
         pijC4ZHMV+fgtNaRpBWOXnUbx4CtpU0rNcWu+bLDp5Z+lTiWcQ+HmrTpmXXS0zElZm63
         Pgat83t6Z+NxvxuHQifALpj13+pE8lsP78n69e2gP7K/iah7TrjHutHepsP85fwtQ3WT
         jm+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=epi6xKUelRAiPVjlIJ05aQCI1GIhYmskHhBDkuah/Fk=;
        b=dBP7jZSiA1inIImJ92PNrw3QjMl68LVHlsf0RzavxwECBM2Of3e5zFZVbgqlI4oBQm
         JMinXN7GaVEWtQkQ9tQb1nraGsB3M8VgN+Zton/kNth9ekhda4QEMEYTFpoIre+j9kna
         n9Vp5k8XR7TscRdN5LUlVPsiwWErzaJ2eAOgHq4Iy3qu6/57HT3lUbVbS1xHCMzXca59
         6SAMJtJ/P7BYSDwboN/Q+aGg631RYkVriG4rtGwgncfX9KoLqqVYs00ui+qGljVLlDGc
         8JxFIWKmCezOcxeny965++qf1qEEtjkSp3BVgqH2R7vC8QTqd5exEzkTM8ujLvbrUOzP
         VYaA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=PL8ygkwC;
       spf=pass (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::829 as permitted sender) smtp.mailfrom=racedrive1503@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com. [2607:f8b0:4864:20::829])
        by gmr-mx.google.com with ESMTPS id v16si490159ywv.1.2019.06.10.10.45.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 10:45:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::829 as permitted sender) client-ip=2607:f8b0:4864:20::829;
Received: by mail-qt1-x829.google.com with SMTP id m29so11476476qtu.1
        for <jailhouse-dev@googlegroups.com>; Mon, 10 Jun 2019 10:45:34 -0700 (PDT)
X-Received: by 2002:ac8:4619:: with SMTP id p25mr28454644qtn.73.1560188734563;
 Mon, 10 Jun 2019 10:45:34 -0700 (PDT)
MIME-Version: 1.0
References: <CA++Khc2iKk1J6+0huh5__dS4HyujXzV9r+LbKLzuVZ4K3Bt5eA@mail.gmail.com>
 <57edbc3b-cadc-c850-8310-4640fc623085@oth-regensburg.de> <CA++Khc3HLaSEo9z2jd6hVLuDK-zd4P6au0KP3+6db8KBR47izQ@mail.gmail.com>
 <166c6ad9-379c-bad6-f30f-8af4f97b8bb1@oth-regensburg.de>
In-Reply-To: <166c6ad9-379c-bad6-f30f-8af4f97b8bb1@oth-regensburg.de>
From: Wayne <racedrive1503@gmail.com>
Date: Mon, 10 Jun 2019 13:45:23 -0400
Message-ID: <CA++Khc0yQbb3BjzCuR+6JLVqvx7EA3F5JHCFtf5FpN41CiGGVA@mail.gmail.com>
Subject: Re: Linux non-root node question
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: jailhouse-dev@googlegroups.com, jan.kiszka@siemens.com
Content-Type: multipart/mixed; boundary="0000000000004eaf5b058afbbf10"
X-Original-Sender: racedrive1503@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=PL8ygkwC;       spf=pass
 (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::829
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

--0000000000004eaf5b058afbbf10
Content-Type: multipart/alternative; boundary="0000000000004eaf57058afbbf0e"

--0000000000004eaf57058afbbf0e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for your responses Ralf and Jan.

Yes, I have successfully gotten both the apic-demo and tiny-demo cells to
work on my system before attempting to load the non-root linux.  I can see
serial output from them.

However, if I try to share the UART between root and inmate for them I run
into a crash on the hypervisor if the root linux attempts to write to the
UART (after creating/starting a demo).  Does the root linux lose access
once an inmate is created/started?  Or am I missing something from my
System config or tiny-demo config that allows them to share?  I attached
the crash in hypervisor_output.txt.

Also, I noticed the tiny-demo output on the UART gets mirrored on the
Jailhouse virtual console.  Does that mean that its writing to the serial
through the hypervisor and not directly accessing ttyS0 itself?  If so, is
there a way to create the cell to write ttyS0 directly as a test?  To see
if it exhibits same behavior as the non-root linux.

FYI, I create the tiny-demo like this:

jailhouse cell create configs/x86/tiny-demo.cell
jailhouse cell load tiny-demo inmates/demos/x86/tiny-demo.cell
jailhouse cell start tiny-demo

Going back to my original non-root linux question, I don't see any output
when connected over ttyS0.  Its address is 0x3f8 ("serial 1") in the PIO,
and that seems to work fine for the other simple demos, minus the
hypervisor crash issue above when sharing.  I know there is the other
"serial 2" port but I haven't tried to use that one.

non root linux launched with:
/tools/jailhouse cell linux configs/x86/linux-x86.cell
/boot/vmlinux-4.1.16-Guest -c "console=3DttyS0,115200"

I can try the 4.19 siemens kernel and "next" branch for jailhouse you
suggested.  Do you think that combination will resolve the missing serial
for the non-root linux?  Otherwise, did my kernel config, system config,
and non-root linux cell configs look OK?

Thanks again for your help.


On Fri, Jun 7, 2019 at 5:30 PM Ralf Ramsauer <
ralf.ramsauer@oth-regensburg.de> wrote:

> Hi Wayne,
>
> On 6/7/19 10:04 PM, Wayne wrote:
> > Hi Ralf,
> >
> > Thank you for your responses.  I have attached the requested config
> > files.  I am now just trying to use the same bzImage for the root and
> > the non-root linux node.
>
> One question that you didn't answer: do apic-demo or tiny-demo work?
> They need to to have correct .console parameter set, so ensure that
> parameters are set if you run those demos in your linux-demo cell. Just
> compare it to tiny-demo.c or apic-demo.c
>
> >
> > Yes, I am using vanilla 4.16 because the documentation indicated that i=
t
> > is the first mainline release to officially support Jailhouse Guest
> > images.  Do you suggest that I use something else?
>
> As Jan already wrote: Try to use Siemens' 4.19 branch.
>
> >
> > Right now i'm just trying to get some serial output from the non-root
> > Linux.  Hopefully, I have that configured correctly.  Ideally, I would
> > like to share the same serial console for the Root node and non-root
> > node eventually if possible.  I have been OK with using the virtual
> > console (jailhouse console -f) for the Hypervisor output.
>
> In addition to Jan's comment:
>
> Currently you only have access to the jailhouse console via 'jailhouse
> console' from your root cell. Imagine your root cell crashes for some
> reason. You will never see the fault reason, which makes things hard to
> debug.
>
> I would suggest to configure the hypervisor to use the serial console.
> You can share the device with the non-root Linux, that's no problem.
>
> In this case, the non-root kernel's output will always be printed to the
> serial console. Directly, if you choose console=3DttySx, and indirectly
> via the hypervisor if you choose console=3Djailhouse.
>
> BTW: According to your config, your system is a PowerEdge, and the
> non-root cell gets both, 0x2f8 and 0x3f8. Are you sure that ttyS1 is the
> correct console that you are connected to?
>
> Just mentioning this as we have a similar machine here, and, afair, both
> platform serial device are 'usable', but one ends in the nirvana while
> it is accessible.
>
> Ah, and one last thing: try to switch to the current next branch for
> jailhouse. Jan just integrated a few patches from me that might also be
> relevant for your machine.
>
> HTH
>   Ralf
>
> >
> > Wayne
> >
> > On Fri, Jun 7, 2019 at 9:10 AM Ralf Ramsauer
> > <ralf.ramsauer@oth-regensburg.de
> > <mailto:ralf.ramsauer@oth-regensburg.de>> wrote:
> >
> >     Hi,
> >
> >     On 6/7/19 2:28 PM, Wayne wrote:
> >     > Hello,
> >     >
> >     > I am new to Linux development and Jailhouse.  I have successfully
> >     booted
> >     > the Jailhouse Hypervisor and root cell on a bare metal X86 Linux
> >     system
> >     > (No QEMU).  I am now trying to load a non-root Linux cell and I
> have a
> >     > few questions.  Jailhouse accepts and starts my non-root linux ce=
ll
> >     > configuration and I see it as "running" through the "jailhouse ce=
ll
> >     > list" command.  However, I don't see any serial output from the
> >     > "non-root linux" cell booting up.  I=E2=80=99m not sure what the =
non-root
> node
> >     > is doing at this point.
> >
> >     Ok, first of all, can you see any output from Jailhouse's demo
> inmates
> >     (e.g., tiny-demo or apic-demo)?
> >
> >     >
> >     >                My root node is a 4.16 kernel configured this way:
> >     >                               1. CONFIG_JAILHOUSE_GUEST is not se=
t
> >     >                               2. CONFIG_SERIO=3Dy
> >     >                               3. CONFIG_SERIAL_8250_RUNTIME_UARTS=
=3D4
> >     >
> >     >                My non-root node is a 4.16 kernel configured this
> way:
> >     >                               1. CONFIG_JAILHOUSE_GUEST=3Dy
> >     >                               2. CONFIG_SERIO=3Dm (can't seem to
> disable
> >     > completely in my config for 4.16)
> >     >                               3. CONFIG_SERIAL_8250_RUNTIME_UARTS=
=3D1
> >
> >     Could you please provide a full .config? What branch are you exactl=
y
> >     using? Vanilla 4.16?
> >
> >     Please attach your system config and your non-root linux config as
> well.
> >
> >     You may also want to try https://github.com/siemens/linux . See
> >     jailhouse-enabling branches for some releases.
> >
> >     >
> >     > In general, do the kernel config settings have to match between
> >     the root
> >     > node and non-linux or is the above fine?
> >
> >     No, they do not have to be the same, but they can. Still, an analys=
is
> >     requires your .config.
> >
> >     >
> >     > The vmlinux-4.1.16-Guest bzImage is approx 7MB, and the inmate
> node is
> >     > allocated ~75MB of RAM.
> >     >
> >     > I have a single UART, so I have configured the root cell system
> config
> >     > to output to the virtual hypervisor console:
> >
> >     Wait... You configured your root-cell to use the hypervisor debug
> >     console? How? It's only available once the hypervisor is enabled. H=
ow
> >     should this work?
> >
> >     But let's have a look at your configuration first.
> >
> >     So you want to:
> >       - Have the UART (0x3f8) available in the non-root cell
> >       - Use 0x3f8 as hypervisor debug console as well
> >       - No console for root-cell
> >
> >     Did I get this right?
> >
> >       Ralf
> >
> >     >
> >     > .flags =3D JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
> >     >
> >     > .debug_console =3D {
> >     > .type =3D JAILHOUSE_CON_TYPE_NONE,
> >     > },
> >     >
> >     > and I have configured the non-root linux cell to output to the
> UART:
> >     >
> >     > (Added serial 0x3f8 to pio bitmap for non-root linux) and started
> the
> >     > node with this:
> >     >
> >     > ./tools/jailhouse cell linux configs/x86/linux-x86.cell
> >     > /boot/vmlinux-4.1.16-Guest -c "console=3DttyS0,115200"
> >     > (Note I also tried "console=3Djailhouse" in the command above, an=
d
> that
> >     > produces the same result)
> >     >
> >     > I then see the following on my hypervisor console
> (./tools/jailhouse
> >     > console -f):
> >     >
> >     > Created cell "linux-x86-demo"
> >     > ...
> >     > Cell "linux-x86-demo" can be loaded
> >     > Started cell "linux-x86-demo"
> >     >
> >     > After a little while I do get a parked CPU error on the root node=
,
> >     looks
> >     > like its trying to do something with the UART as well:
> >     > FATAL: Invalid PIO read, port: 3fe size: 1
> >     >
> >     > I would expect something to pop out on the UART from the non-root
> >     linux
> >     > node first.  Note that root node has serial 0x3f8 disabled in its
> pio
> >     > bitmap.
> >     >
> >     > I verifed that the UART is functioning by allowing the hypervisor
> to
> >     > print to it and also performed an echo test over ttyS0.
> >     >
> >     > I have tried several configurations of kernel.....including your
> >     current
> >     > "queues/jailhouse" branch head kernel for the non-root node, alon=
g
> >     with
> >     > the kernel config for 4.7 posted in this thread below (but I get
> same
> >     > result as above when I start it, no kernel output):
> >     >
> >     >
> >      "
> https://groups.google.com/forum/#!searchin/jailhouse-dev/Re$3A$20Failed$2=
0to$20boot$20jailhouse%7Csort:relevance/jailhouse-dev/M7UO89XFIk0/Qi40DDuMB=
AAJ
> ".
> >     >
> >     > Any information you can provide to me will be helpful.  I'm not
> sure
> >     > what might be going wrong here.
> >     >
> >     > Thanks,
> >     > Wayne
> >     >
> >     > --
> >     > You received this message because you are subscribed to the Googl=
e
> >     > Groups "Jailhouse" group.
> >     > To unsubscribe from this group and stop receiving emails from it,
> send
> >     > an email to jailhouse-dev+unsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com>
> >     > <mailto:jailhouse-dev+unsubscribe@googlegroups.com
> >     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com>>.
> >     > To view this discussion on the web visit
> >     >
> >
> https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc2iKk1J6%2B0huh=
5__dS4HyujXzV9r%2BLbKLzuVZ4K3Bt5eA%40mail.gmail.com
> >     >
> >     <
> https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc2iKk1J6%2B0huh=
5__dS4HyujXzV9r%2BLbKLzuVZ4K3Bt5eA%40mail.gmail.com?utm_medium=3Demail&utm_=
source=3Dfooter
> >.
> >     > For more options, visit https://groups.google.com/d/optout.
> >
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CA%2B%2BKhc0yQbb3BjzCuR%2B6JLVqvx7EA3F5JHCFtf5FpN41CiGGVA%40m=
ail.gmail.com.
For more options, visit https://groups.google.com/d/optout.

--0000000000004eaf57058afbbf0e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Thank you for your responses Ralf and Jan.<br><b=
r>Yes, I have successfully gotten both the apic-demo and tiny-demo cells to=
 work on my system before attempting to load the non-root linux.=C2=A0 I ca=
n see serial output from them.<br><br>However, if I try to share the UART b=
etween root and inmate for them I run into a crash on the hypervisor if the=
 root linux attempts to write to the UART (after creating/starting a demo).=
=C2=A0 Does the root linux lose access once an inmate is created/started?=
=C2=A0 Or am I missing something from my System config or tiny-demo config =
that allows them to share?=C2=A0 I attached the crash in hypervisor_output.=
txt.<br><br>Also, I noticed the tiny-demo output on the UART gets mirrored =
on the Jailhouse virtual console.=C2=A0 Does that mean that its writing to =
the serial through the hypervisor and not directly accessing ttyS0 itself?=
=C2=A0 If so, is there a way to create the cell to write ttyS0 directly as =
a test?=C2=A0 To see if it exhibits same behavior as the non-root linux.<br=
><br>FYI, I create the tiny-demo like this:<br><br>jailhouse cell create co=
nfigs/x86/tiny-demo.cell<br>jailhouse cell load tiny-demo inmates/demos/x86=
/tiny-demo.cell =C2=A0<br>jailhouse cell start tiny-demo<br><br>Going back =
to my original non-root linux question, I don&#39;t see any output when con=
nected over ttyS0.=C2=A0 Its address is 0x3f8 (&quot;serial 1&quot;) in the=
 PIO, and that seems to work fine for the other simple demos, minus the hyp=
ervisor crash issue above when sharing.=C2=A0 I know there is the other &qu=
ot;serial 2&quot; port but I haven&#39;t tried to use that one.<br><br>non =
root linux launched with:<br>/tools/jailhouse cell linux configs/x86/linux-=
x86.cell /boot/vmlinux-4.1.16-Guest -c &quot;console=3DttyS0,115200&quot;<b=
r><br>I can try the 4.19 siemens kernel and &quot;next&quot; branch for jai=
lhouse you suggested.=C2=A0 Do you think that combination will resolve the =
missing serial for the non-root linux?=C2=A0 Otherwise, did my kernel confi=
g, system config, and non-root linux cell configs look OK?<br><br>Thanks ag=
ain for your help.<br></div><div><br></div></div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 7, 2019 at 5:3=
0 PM Ralf Ramsauer &lt;<a href=3D"mailto:ralf.ramsauer@oth-regensburg.de">r=
alf.ramsauer@oth-regensburg.de</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">Hi Wayne,<br>
<br>
On 6/7/19 10:04 PM, Wayne wrote:<br>
&gt; Hi Ralf,<br>
&gt; <br>
&gt; Thank you for your responses.=C2=A0 I have attached the requested conf=
ig<br>
&gt; files.=C2=A0 I am now just trying to use the same bzImage for the root=
 and<br>
&gt; the non-root linux node.<br>
<br>
One question that you didn&#39;t answer: do apic-demo or tiny-demo work?<br=
>
They need to to have correct .console parameter set, so ensure that<br>
parameters are set if you run those demos in your linux-demo cell. Just<br>
compare it to tiny-demo.c or apic-demo.c<br>
<br>
&gt; <br>
&gt; Yes, I am using vanilla 4.16 because the documentation indicated that =
it<br>
&gt; is the first mainline release to officially support Jailhouse Guest<br=
>
&gt; images.=C2=A0 Do you suggest that I use something else?<br>
<br>
As Jan already wrote: Try to use Siemens&#39; 4.19 branch.<br>
<br>
&gt; <br>
&gt; Right now i&#39;m just trying to get some serial output from the non-r=
oot<br>
&gt; Linux.=C2=A0 Hopefully, I have that configured correctly.=C2=A0 Ideall=
y, I would<br>
&gt; like to share the same serial console for the Root node and non-root<b=
r>
&gt; node eventually if possible.=C2=A0 I have been OK with using the virtu=
al<br>
&gt; console (jailhouse console -f) for the Hypervisor output.<br>
<br>
In addition to Jan&#39;s comment:<br>
<br>
Currently you only have access to the jailhouse console via &#39;jailhouse<=
br>
console&#39; from your root cell. Imagine your root cell crashes for some<b=
r>
reason. You will never see the fault reason, which makes things hard to<br>
debug.<br>
<br>
I would suggest to configure the hypervisor to use the serial console.<br>
You can share the device with the non-root Linux, that&#39;s no problem.<br=
>
<br>
In this case, the non-root kernel&#39;s output will always be printed to th=
e<br>
serial console. Directly, if you choose console=3DttySx, and indirectly<br>
via the hypervisor if you choose console=3Djailhouse.<br>
<br>
BTW: According to your config, your system is a PowerEdge, and the<br>
non-root cell gets both, 0x2f8 and 0x3f8. Are you sure that ttyS1 is the<br=
>
correct console that you are connected to?<br>
<br>
Just mentioning this as we have a similar machine here, and, afair, both<br=
>
platform serial device are &#39;usable&#39;, but one ends in the nirvana wh=
ile<br>
it is accessible.<br>
<br>
Ah, and one last thing: try to switch to the current next branch for<br>
jailhouse. Jan just integrated a few patches from me that might also be<br>
relevant for your machine.<br>
<br>
HTH<br>
=C2=A0 Ralf<br>
<br>
&gt; <br>
&gt; Wayne<br>
&gt; <br>
&gt; On Fri, Jun 7, 2019 at 9:10 AM Ralf Ramsauer<br>
&gt; &lt;<a href=3D"mailto:ralf.ramsauer@oth-regensburg.de" target=3D"_blan=
k">ralf.ramsauer@oth-regensburg.de</a><br>
&gt; &lt;mailto:<a href=3D"mailto:ralf.ramsauer@oth-regensburg.de" target=
=3D"_blank">ralf.ramsauer@oth-regensburg.de</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 6/7/19 2:28 PM, Wayne wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Hello,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I am new to Linux development and Jailhouse.=
=C2=A0 I have successfully<br>
&gt;=C2=A0 =C2=A0 =C2=A0booted<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; the Jailhouse Hypervisor and root cell on a ba=
re metal X86 Linux<br>
&gt;=C2=A0 =C2=A0 =C2=A0system<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; (No QEMU).=C2=A0 I am now trying to load a non=
-root Linux cell and I have a<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; few questions.=C2=A0 Jailhouse accepts and sta=
rts my non-root linux cell<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; configuration and I see it as &quot;running&qu=
ot; through the &quot;jailhouse cell<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; list&quot; command.=C2=A0 However, I don&#39;t=
 see any serial output from the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &quot;non-root linux&quot; cell booting up.=C2=
=A0 I=E2=80=99m not sure what the non-root node<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; is doing at this point.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Ok, first of all, can you see any output from Jailh=
ouse&#39;s demo inmates<br>
&gt;=C2=A0 =C2=A0 =C2=A0(e.g., tiny-demo or apic-demo)?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0My root node is a 4.16 kernel configured this way:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1. CONFIG_JAILH=
OUSE_GUEST is not set<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2. CONFIG_SERIO=
=3Dy<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3. CONFIG_SERIA=
L_8250_RUNTIME_UARTS=3D4<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0My non-root node is a 4.16 kernel configured this way:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1. CONFIG_JAILH=
OUSE_GUEST=3Dy<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2. CONFIG_SERIO=
=3Dm (can&#39;t seem to disable<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; completely in my config for 4.16)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3. CONFIG_SERIA=
L_8250_RUNTIME_UARTS=3D1<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Could you please provide a full .config? What branc=
h are you exactly<br>
&gt;=C2=A0 =C2=A0 =C2=A0using? Vanilla 4.16?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Please attach your system config and your non-root =
linux config as well.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0You may also want to try <a href=3D"https://github.=
com/siemens/linux" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
siemens/linux</a> . See<br>
&gt;=C2=A0 =C2=A0 =C2=A0jailhouse-enabling branches for some releases.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; In general, do the kernel config settings have=
 to match between<br>
&gt;=C2=A0 =C2=A0 =C2=A0the root<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; node and non-linux or is the above fine?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0No, they do not have to be the same, but they can. =
Still, an analysis<br>
&gt;=C2=A0 =C2=A0 =C2=A0requires your .config.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; The vmlinux-4.1.16-Guest bzImage is approx 7MB=
, and the inmate node is<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; allocated ~75MB of RAM.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I have a single UART, so I have configured the=
 root cell system config<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; to output to the virtual hypervisor console:<b=
r>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Wait... You configured your root-cell to use the hy=
pervisor debug<br>
&gt;=C2=A0 =C2=A0 =C2=A0console? How? It&#39;s only available once the hype=
rvisor is enabled. How<br>
&gt;=C2=A0 =C2=A0 =C2=A0should this work?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0But let&#39;s have a look at your configuration fir=
st.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0So you want to:<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 - Have the UART (0x3f8) available in the non=
-root cell<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 - Use 0x3f8 as hypervisor debug console as w=
ell<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 - No console for root-cell<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Did I get this right?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 Ralf<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; .flags =3D JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE=
,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; .debug_console =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; .type =3D JAILHOUSE_CON_TYPE_NONE,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; },<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; and I have configured the non-root linux cell =
to output to the UART:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; (Added serial 0x3f8 to pio bitmap for non-root=
 linux) and started the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; node with this:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ./tools/jailhouse cell linux configs/x86/linux=
-x86.cell<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; /boot/vmlinux-4.1.16-Guest -c &quot;console=3D=
ttyS0,115200&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; (Note I also tried &quot;console=3Djailhouse&q=
uot; in the command above, and that<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; produces the same result)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I then see the following on my hypervisor cons=
ole (./tools/jailhouse<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; console -f):<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Created cell &quot;linux-x86-demo&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ...<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Cell &quot;linux-x86-demo&quot; can be loaded<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Started cell &quot;linux-x86-demo&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; After a little while I do get a parked CPU err=
or on the root node,<br>
&gt;=C2=A0 =C2=A0 =C2=A0looks<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; like its trying to do something with the UART =
as well:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; FATAL: Invalid PIO read, port: 3fe size: 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I would expect something to pop out on the UAR=
T from the non-root<br>
&gt;=C2=A0 =C2=A0 =C2=A0linux<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; node first.=C2=A0 Note that root node has seri=
al 0x3f8 disabled in its pio<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; bitmap.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I verifed that the UART is functioning by allo=
wing the hypervisor to<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; print to it and also performed an echo test ov=
er ttyS0.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I have tried several configurations of kernel.=
....including your<br>
&gt;=C2=A0 =C2=A0 =C2=A0current<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &quot;queues/jailhouse&quot; branch head kerne=
l for the non-root node, along<br>
&gt;=C2=A0 =C2=A0 =C2=A0with<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; the kernel config for 4.7 posted in this threa=
d below (but I get same<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; result as above when I start it, no kernel out=
put):<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0&quot;<a href=3D"https://groups.google.com/fo=
rum/#!searchin/jailhouse-dev/Re$3A$20Failed$20to$20boot$20jailhouse%7Csort:=
relevance/jailhouse-dev/M7UO89XFIk0/Qi40DDuMBAAJ" rel=3D"noreferrer" target=
=3D"_blank">https://groups.google.com/forum/#!searchin/jailhouse-dev/Re$3A$=
20Failed$20to$20boot$20jailhouse%7Csort:relevance/jailhouse-dev/M7UO89XFIk0=
/Qi40DDuMBAAJ</a>&quot;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Any information you can provide to me will be =
helpful.=C2=A0 I&#39;m not sure<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; what might be going wrong here.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Thanks,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Wayne<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; --<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; You received this message because you are subs=
cribed to the Google<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Groups &quot;Jailhouse&quot; group.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; To unsubscribe from this group and stop receiv=
ing emails from it, send<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; an email to <a href=3D"mailto:jailhouse-dev%2B=
unsubscribe@googlegroups.com" target=3D"_blank">jailhouse-dev+unsubscribe@g=
ooglegroups.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jailhouse-dev%252Bunsu=
bscribe@googlegroups.com" target=3D"_blank">jailhouse-dev%2Bunsubscribe@goo=
glegroups.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &lt;mailto:<a href=3D"mailto:jailhouse-dev%2Bu=
nsubscribe@googlegroups.com" target=3D"_blank">jailhouse-dev+unsubscribe@go=
oglegroups.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jailhouse-dev%252Bunsu=
bscribe@googlegroups.com" target=3D"_blank">jailhouse-dev%2Bunsubscribe@goo=
glegroups.com</a>&gt;&gt;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; To view this discussion on the web visit<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://groups.google.com/d/msgid/jailho=
use-dev/CA%2B%2BKhc2iKk1J6%2B0huh5__dS4HyujXzV9r%2BLbKLzuVZ4K3Bt5eA%40mail.=
gmail.com" rel=3D"noreferrer" target=3D"_blank">https://groups.google.com/d=
/msgid/jailhouse-dev/CA%2B%2BKhc2iKk1J6%2B0huh5__dS4HyujXzV9r%2BLbKLzuVZ4K3=
Bt5eA%40mail.gmail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://groups.google.com/d/msgid/ja=
ilhouse-dev/CA%2B%2BKhc2iKk1J6%2B0huh5__dS4HyujXzV9r%2BLbKLzuVZ4K3Bt5eA%40m=
ail.gmail.com?utm_medium=3Demail&amp;utm_source=3Dfooter" rel=3D"noreferrer=
" target=3D"_blank">https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2=
BKhc2iKk1J6%2B0huh5__dS4HyujXzV9r%2BLbKLzuVZ4K3Bt5eA%40mail.gmail.com?utm_m=
edium=3Demail&amp;utm_source=3Dfooter</a>&gt;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; For more options, visit <a href=3D"https://gro=
ups.google.com/d/optout" rel=3D"noreferrer" target=3D"_blank">https://group=
s.google.com/d/optout</a>.<br>
&gt; <br>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CA%2B%2BKhc0yQbb3BjzCuR%2B6JLVqvx7EA3F5JHCFtf5FpN4=
1CiGGVA%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://gr=
oups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc0yQbb3BjzCuR%2B6JLVqvx7EA3=
F5JHCFtf5FpN41CiGGVA%40mail.gmail.com</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

--0000000000004eaf57058afbbf0e--
--0000000000004eaf5b058afbbf10
Content-Type: text/plain; charset="US-ASCII"; name="hypervisor_console.txt"
Content-Disposition: attachment; filename="hypervisor_console.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_jwqo08ar2>
X-Attachment-Id: f_jwqo08ar2

RkFUQUw6IEludmFsaWQgUElPIHdyaXRlLCBwb3J0OiAzZmEgc2l6ZTogMQpSSVA6IDB4ZmZmZmZm
ZmY4NTJiZGM1NiBSU1A6IDB4ZmZmZmJkNjJjNjIwYmI1OCBGTEFHUzogMjA2ClJBWDogMHgwMDAw
MDAwMDAwMDAwMDAxIFJCWDogMHhmZmZmZmZmZjg2ODUyNDYwIFJDWDogMHgwMDAwMDAwMDAwMDAw
MDAwClJEWDogMHgwMDAwMDAwMDAwMDAwM2ZhIFJTSTogMHgwMDAwMDAwMDAwMDAwM2ZhIFJESTog
MHhmZmZmZmZmZjg2ODUyNDYwCkNTOiAxMCBCQVNFOiAweDAwMDAwMDAwMDAwMDAwMDAgQVItQllU
RVM6IGEwOWIgRUZFUi5MTUEgMQpDUjA6IDB4MDAwMDAwMDA4MDA1MDAzMyBDUjM6IDB4MDAwMDAw
MDg1M2ZkNDAwMyBDUjQ6IDB4MDAwMDAwMDAwMDc2MjZlMApFRkVSOiAweDAwMDAwMDAwMDAwMDBk
MDEKUGFya2luZyBDUFUgMTUgKENlbGw6ICJSb290Q2VsbCIpCg==
--0000000000004eaf5b058afbbf10
Content-Type: application/octet-stream; name="master.c"
Content-Disposition: attachment; filename="master.c"
Content-Transfer-Encoding: base64
Content-ID: <f_jwqnz9ot0>
X-Attachment-Id: f_jwqnz9ot0

LyoKICogSmFpbGhvdXNlLCBhIExpbnV4LWJhc2VkIHBhcnRpdGlvbmluZyBoeXBlcnZpc29yCiAq
CiAqIENvcHlyaWdodCAoYykgU2llbWVucyBBRywgMjAxNC0yMDE3CiAqCiAqIFRoaXMgd29yayBp
cyBsaWNlbnNlZCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHUEwsIHZlcnNpb24gMi4gIFNl
ZQogKiB0aGUgQ09QWUlORyBmaWxlIGluIHRoZSB0b3AtbGV2ZWwgZGlyZWN0b3J5LgogKgogKiBB
bHRlcm5hdGl2ZWx5LCB5b3UgY2FuIHVzZSBvciByZWRpc3RyaWJ1dGUgdGhpcyBmaWxlIHVuZGVy
IHRoZSBmb2xsb3dpbmcKICogQlNEIGxpY2Vuc2U6CiAqCiAqIFJlZGlzdHJpYnV0aW9uIGFuZCB1
c2UgaW4gc291cmNlIGFuZCBiaW5hcnkgZm9ybXMsIHdpdGggb3Igd2l0aG91dAogKiBtb2RpZmlj
YXRpb24sIGFyZSBwZXJtaXR0ZWQgcHJvdmlkZWQgdGhhdCB0aGUgZm9sbG93aW5nIGNvbmRpdGlv
bnMKICogYXJlIG1ldDoKICoKICogMS4gUmVkaXN0cmlidXRpb25zIG9mIHNvdXJjZSBjb2RlIG11
c3QgcmV0YWluIHRoZSBhYm92ZSBjb3B5cmlnaHQKICogICAgbm90aWNlLCB0aGlzIGxpc3Qgb2Yg
Y29uZGl0aW9ucyBhbmQgdGhlIGZvbGxvd2luZyBkaXNjbGFpbWVyLgogKgogKiAyLiBSZWRpc3Ry
aWJ1dGlvbnMgaW4gYmluYXJ5IGZvcm0gbXVzdCByZXByb2R1Y2UgdGhlIGFib3ZlIGNvcHlyaWdo
dAogKiAgICBub3RpY2UsIHRoaXMgbGlzdCBvZiBjb25kaXRpb25zIGFuZCB0aGUgZm9sbG93aW5n
IGRpc2NsYWltZXIgaW4gdGhlCiAqICAgIGRvY3VtZW50YXRpb24gYW5kL29yIG90aGVyIG1hdGVy
aWFscyBwcm92aWRlZCB3aXRoIHRoZSBkaXN0cmlidXRpb24uCiAqCiAqIFRISVMgU09GVFdBUkUg
SVMgUFJPVklERUQgQlkgVEhFIENPUFlSSUdIVCBIT0xERVJTIEFORCBDT05UUklCVVRPUlMgIkFT
IElTIgogKiBBTkQgQU5ZIEVYUFJFU1MgT1IgSU1QTElFRCBXQVJSQU5USUVTLCBJTkNMVURJTkcs
IEJVVCBOT1QgTElNSVRFRCBUTywgVEhFCiAqIElNUExJRUQgV0FSUkFOVElFUyBPRiBNRVJDSEFO
VEFCSUxJVFkgQU5EIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFCiAqIEFSRSBESVND
TEFJTUVELiBJTiBOTyBFVkVOVCBTSEFMTCBUSEUgQ09QWVJJR0hUIEhPTERFUiBPUiBDT05UUklC
VVRPUlMgQkUKICogTElBQkxFIEZPUiBBTlkgRElSRUNULCBJTkRJUkVDVCwgSU5DSURFTlRBTCwg
U1BFQ0lBTCwgRVhFTVBMQVJZLCBPUgogKiBDT05TRVFVRU5USUFMIERBTUFHRVMgKElOQ0xVRElO
RywgQlVUIE5PVCBMSU1JVEVEIFRPLCBQUk9DVVJFTUVOVCBPRgogKiBTVUJTVElUVVRFIEdPT0RT
IE9SIFNFUlZJQ0VTOyBMT1NTIE9GIFVTRSwgREFUQSwgT1IgUFJPRklUUzsgT1IgQlVTSU5FU1MK
ICogSU5URVJSVVBUSU9OKSBIT1dFVkVSIENBVVNFRCBBTkQgT04gQU5ZIFRIRU9SWSBPRiBMSUFC
SUxJVFksIFdIRVRIRVIgSU4KICogQ09OVFJBQ1QsIFNUUklDVCBMSUFCSUxJVFksIE9SIFRPUlQg
KElOQ0xVRElORyBORUdMSUdFTkNFIE9SIE9USEVSV0lTRSkKICogQVJJU0lORyBJTiBBTlkgV0FZ
IE9VVCBPRiBUSEUgVVNFIE9GIFRISVMgU09GVFdBUkUsIEVWRU4gSUYgQURWSVNFRCBPRgogKiBU
SEUgUE9TU0lCSUxJVFkgT0YgU1VDSCBEQU1BR0UuCiAqCiAqIENvbmZpZ3VyYXRpb24gZm9yIERl
bGwgSW5jLiBQb3dlckVkZ2UgUjc0MAogKiBjcmVhdGVkIHdpdGggJy4vamFpbGhvdXNlIGNvbmZp
ZyBjcmVhdGUgc3lzY29uZmlnLmMnCiAqCiAqIE5PVEU6IFRoaXMgY29uZmlnIGV4cGVjdHMgdGhl
IGZvbGxvd2luZyB0byBiZSBhcHBlbmRlZCB0byB5b3VyIGtlcm5lbCBjbWRsaW5lCiAqICAgICAg
ICJtZW1tYXA9MHg1MjAwMDAwJDB4M2EwMDAwMDAiCiAqCiAqIDYgTUIgaHlwZXJ2aXNvciwgNzUg
TUIgaW5tYXRlcwogKi8KCiNpbmNsdWRlIDxqYWlsaG91c2UvdHlwZXMuaD4KI2luY2x1ZGUgPGph
aWxob3VzZS9jZWxsLWNvbmZpZy5oPgoKI2RlZmluZSBBUlJBWV9TSVpFKGEpIChzaXplb2YoYSkg
LyBzaXplb2YoKGEpWzBdKSkKCnN0cnVjdCB7CglzdHJ1Y3QgamFpbGhvdXNlX3N5c3RlbSBoZWFk
ZXI7CglfX3U2NCBjcHVzWzFdOwoJc3RydWN0IGphaWxob3VzZV9tZW1vcnkgbWVtX3JlZ2lvbnNb
ODVdOwoJc3RydWN0IGphaWxob3VzZV9pcnFjaGlwIGlycWNoaXBzWzVdOwoJX191OCBwaW9fYml0
bWFwWzB4MjAwMF07CglzdHJ1Y3QgamFpbGhvdXNlX3BjaV9kZXZpY2UgcGNpX2RldmljZXNbMTUw
XTsKCXN0cnVjdCBqYWlsaG91c2VfcGNpX2NhcGFiaWxpdHkgcGNpX2NhcHNbMTE0XTsKfSBfX2F0
dHJpYnV0ZV9fKChwYWNrZWQpKSBjb25maWcgPSB7CgkuaGVhZGVyID0gewoJCS5zaWduYXR1cmUg
PSBKQUlMSE9VU0VfU1lTVEVNX1NJR05BVFVSRSwKCQkucmV2aXNpb24gPSBKQUlMSE9VU0VfQ09O
RklHX1JFVklTSU9OLAoJCS5mbGFncyA9IEpBSUxIT1VTRV9TWVNfVklSVFVBTF9ERUJVR19DT05T
T0xFLAoJCS5oeXBlcnZpc29yX21lbW9yeSA9IHsKCQkJLnBoeXNfc3RhcnQgPSAweDNhMDAwMDAw
LAoJCQkuc2l6ZSA9IDB4NjAwMDAwLAoJCX0sCgoJCS5kZWJ1Z19jb25zb2xlID0gewoJCQkuYWRk
cmVzcyA9IDB4M2Y4LAoJCQkudHlwZSA9IEpBSUxIT1VTRV9DT05fVFlQRV84MjUwLAoJCQkuZmxh
Z3MgPSBKQUlMSE9VU0VfQ09OX0FDQ0VTU19QSU8gfAoJCQkJIEpBSUxIT1VTRV9DT05fUkVHRElT
VF8xLAoJCX0sCgkJLnBsYXRmb3JtX2luZm8gPSB7CgkJCS5wY2lfbW1jb25maWdfYmFzZSA9IDB4
ODAwMDAwMDAsCgkJCS5wY2lfbW1jb25maWdfZW5kX2J1cyA9IDB4ZmYsCgkJCS54ODYgPSB7CgkJ
CQkucG1fdGltZXJfYWRkcmVzcyA9IDB4NTA4LAoJCQkJLnZ0ZF9pbnRlcnJ1cHRfbGltaXQgPSAx
MDI0LAoJCQkJLmlvbW11X3VuaXRzID0gewoJCQkJCXsKCQkJCQkJLmJhc2UgPSAweGM1ZmZjMDAw
LAoJCQkJCQkuc2l6ZSA9IDB4MTAwMCwKCQkJCQl9LAoJCQkJCXsKCQkJCQkJLmJhc2UgPSAweGUw
ZmZjMDAwLAoJCQkJCQkuc2l6ZSA9IDB4MTAwMCwKCQkJCQl9LAoJCQkJCXsKCQkJCQkJLmJhc2Ug
PSAweGZiZmZjMDAwLAoJCQkJCQkuc2l6ZSA9IDB4MTAwMCwKCQkJCQl9LAoJCQkJCXsKCQkJCQkJ
LmJhc2UgPSAweGFhZmZjMDAwLAoJCQkJCQkuc2l6ZSA9IDB4MTAwMCwKCQkJCQl9LAoJCQkJfSwK
CQkJfSwKCQl9LAoJCS5yb290X2NlbGwgPSB7CgkJCS5uYW1lID0gIlJvb3RDZWxsIiwKCQkJLmNw
dV9zZXRfc2l6ZSA9IHNpemVvZihjb25maWcuY3B1cyksCgkJCS5udW1fbWVtb3J5X3JlZ2lvbnMg
PSBBUlJBWV9TSVpFKGNvbmZpZy5tZW1fcmVnaW9ucyksCgkJCS5udW1faXJxY2hpcHMgPSBBUlJB
WV9TSVpFKGNvbmZpZy5pcnFjaGlwcyksCgkJCS5waW9fYml0bWFwX3NpemUgPSBBUlJBWV9TSVpF
KGNvbmZpZy5waW9fYml0bWFwKSwKCQkJLm51bV9wY2lfZGV2aWNlcyA9IEFSUkFZX1NJWkUoY29u
ZmlnLnBjaV9kZXZpY2VzKSwKCQkJLm51bV9wY2lfY2FwcyA9IEFSUkFZX1NJWkUoY29uZmlnLnBj
aV9jYXBzKSwKCQl9LAoJfSwKCgkuY3B1cyA9IHsKCQkweDAwMDAwMDAwMDBmZmZmZmYsCgl9LAoK
CS5tZW1fcmVnaW9ucyA9IHsKCQkvKiBNZW1SZWdpb246IDAwMDAwMDAwLTAwMDliZmZmIDogU3lz
dGVtIFJBTSAqLwoJCXsKCQkJLnBoeXNfc3RhcnQgPSAweDAsCgkJCS52aXJ0X3N0YXJ0ID0gMHgw
LAoJCQkuc2l6ZSA9IDB4OWMwMDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpB
SUxIT1VTRV9NRU1fV1JJVEUgfAoJCQkJSkFJTEhPVVNFX01FTV9FWEVDVVRFIHwgSkFJTEhPVVNF
X01FTV9ETUEsCgkJfSwKCQkvKiBNZW1SZWdpb246IDAwMDljMDAwLTAwMDlmZmZmIDogcmVzZXJ2
ZWQgKi8KCQl7CgkJCS5waHlzX3N0YXJ0ID0gMHg5YzAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweDlj
MDAwLAoJCQkuc2l6ZSA9IDB4NDAwMCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwg
SkFJTEhPVVNFX01FTV9XUklURSB8CgkJCQlKQUlMSE9VU0VfTUVNX0VYRUNVVEUgfCBKQUlMSE9V
U0VfTUVNX0RNQSwKCQl9LAoJCS8qIE1lbVJlZ2lvbjogMDAwYTAwMDAtMDAwYmZmZmYgOiBQQ0kg
QnVzIDAwMDA6MDAgKi8KCQl7CgkJCS5waHlzX3N0YXJ0ID0gMHhhMDAwMCwKCQkJLnZpcnRfc3Rh
cnQgPSAweGEwMDAwLAoJCQkuc2l6ZSA9IDB4MjAwMDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9N
RU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUsCgkJfSwKCgkJLyogTWVtUmVnaW9uOiAwMDBl
MDAwMC0wMDBmZmZmZiA6IHJlc2VydmVkICovCgkJewoJCQkucGh5c19zdGFydCA9IDB4ZTAwMDAw
LAoJCQkudmlydF9zdGFydCA9IDB4ZTAwMDAwLAoJCQkuc2l6ZSA9IDB4MjAwMDAsCgkJCS5mbGFn
cyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUgfAoJCQkJSkFJTEhP
VVNFX01FTV9FWEVDVVRFIHwgSkFJTEhPVVNFX01FTV9ETUEsCgkJfSwKCgkJLyogTWVtUmVnaW9u
OiAwMDEwMDAwMC0zOWZmZmZmZiA6IFN5c3RlbSBSQU0gKi8KCQl7CgkJCS5waHlzX3N0YXJ0ID0g
MHgxMDAwMDAsCgkJCS52aXJ0X3N0YXJ0ID0gMHgxMDAwMDAsCgkJCS5zaXplID0gMHgzOWYwMDAw
MCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSB8
CgkJCQlKQUlMSE9VU0VfTUVNX0VYRUNVVEUgfCBKQUlMSE9VU0VfTUVNX0RNQSwKCQl9LAoKCQkv
KiBNZW1SZWdpb246IDNmMjAwMDAwLTU0NzM2ZmZmIDogU3lzdGVtIFJBTSAqLwoJCXsKCQkJLnBo
eXNfc3RhcnQgPSAweDNmMjAwMDAwLAoJCQkudmlydF9zdGFydCA9IDB4M2YyMDAwMDAsCgkJCS5z
aXplID0gMHg1MDgxNzAwMCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhP
VVNFX01FTV9XUklURSB8CgkJCQlKQUlMSE9VU0VfTUVNX0VYRUNVVEUgfCBKQUlMSE9VU0VfTUVN
X0RNQSwKCQl9LAoJCS8qIE1lbVJlZ2lvbjogNTQ3MzcwMDAtNWM3M2VmZmYgOiByZXNlcnZlZCAq
LwoJCXsKCQkJLnBoeXNfc3RhcnQgPSAweDU0NzM3MDAwLAoJCQkudmlydF9zdGFydCA9IDB4NTQ3
MzcwMDAsCgkJCS5zaXplID0gMHg4MDA4MDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JF
QUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFIHwKCQkJCUpBSUxIT1VTRV9NRU1fRVhFQ1VURSB8IEpB
SUxIT1VTRV9NRU1fRE1BLAoJCX0sCgkJLyogTWVtUmVnaW9uOiA1YzczZjAwMC02MGZkMmZmZiA6
IFN5c3RlbSBSQU0gKi8KCQl7CgkJCS5waHlzX3N0YXJ0ID0gMHg1YzczZjAwMCwKCQkJLnZpcnRf
c3RhcnQgPSAweDVjNzNmMDAwLAoJCQkuc2l6ZSA9IDB4NDg5NDAwMCwKCQkJLmZsYWdzID0gSkFJ
TEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSB8CgkJCQlKQUlMSE9VU0VfTUVN
X0VYRUNVVEUgfCBKQUlMSE9VU0VfTUVNX0RNQSwKCQl9LAoJCS8qIE1lbVJlZ2lvbjogNjBmZDMw
MDAtNjRmZDJmZmYgOiByZXNlcnZlZCAqLwoJCXsKCQkJLnBoeXNfc3RhcnQgPSAweDYwZmQzMDAw
LAoJCQkudmlydF9zdGFydCA9IDB4NjBmZDMwMDAsCgkJCS5zaXplID0gMHg0MDAwMDAwLAoJCQku
ZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFIHwKCQkJCUpB
SUxIT1VTRV9NRU1fRVhFQ1VURSB8IEpBSUxIT1VTRV9NRU1fRE1BLAoJCX0sCgkJLyogTWVtUmVn
aW9uOiA2NGZkMzAwMC02YzVjZWZmZiA6IFN5c3RlbSBSQU0gKi8KCQl7CgkJCS5waHlzX3N0YXJ0
ID0gMHg2NGZkMzAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweDY0ZmQzMDAwLAoJCQkuc2l6ZSA9IDB4
NzVmYzAwMCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9X
UklURSB8CgkJCQlKQUlMSE9VU0VfTUVNX0VYRUNVVEUgfCBKQUlMSE9VU0VfTUVNX0RNQSwKCQl9
LAoJCS8qIE1lbVJlZ2lvbjogNmM1Y2YwMDAtNmU3Y2VmZmYgOiBSZXNlcnZlZCAqLwoJCXsKCQkJ
LnBoeXNfc3RhcnQgPSAweDZjNWNmMDAwLAoJCQkudmlydF9zdGFydCA9IDB4NmM1Y2YwMDAsCgkJ
CS5zaXplID0gMHgyMjAwMDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlM
SE9VU0VfTUVNX1dSSVRFIHwKCQkJCUpBSUxIT1VTRV9NRU1fRVhFQ1VURSB8IEpBSUxIT1VTRV9N
RU1fRE1BLAoJCX0sCgkJLyogTWVtUmVnaW9uOiA2ZTdjZjAwMC02ZjVmZWZmZiA6IEFDUEkgTm9u
LXZvbGF0aWxlIFN0b3JhZ2UgKi8KCQl7CgkJCS5waHlzX3N0YXJ0ID0gMHg2ZTdjZjAwMCwKCQkJ
LnZpcnRfc3RhcnQgPSAweDZlN2NmMDAwLAoJCQkuc2l6ZSA9IDB4ZTMwMDAwLAoJCQkuZmxhZ3Mg
PSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFLAoJCX0sCgkJLyogTWVt
UmVnaW9uOiA2ZjVmZjAwMC02ZjdmZWZmZiA6IEFDUEkgVGFibGVzICovCgkJewoJCQkucGh5c19z
dGFydCA9IDB4NmY1ZmYwMDAsCgkJCS52aXJ0X3N0YXJ0ID0gMHg2ZjVmZjAwMCwKCQkJLnNpemUg
PSAweDIwMDAwMCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01F
TV9XUklURSwKCQl9LAoJCS8qIE1lbVJlZ2lvbjogNmY3ZmYwMDAtNmY3ZmZmZmYgOiBTeXN0ZW0g
UkFNICovCgkJewoJCQkucGh5c19zdGFydCA9IDB4NmY3ZmYwMDAsCgkJCS52aXJ0X3N0YXJ0ID0g
MHg2ZjdmZjAwMCwKCQkJLnNpemUgPSAweDEwMDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1f
UkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUgfAoJCQkJSkFJTEhPVVNFX01FTV9FWEVDVVRFIHwg
SkFJTEhPVVNFX01FTV9ETUEsCgkJfSwKCQkvKiBNZW1SZWdpb246IDZmODAwMDAwLThmZmZmZmZm
IDogUmVzZXJ2ZWQgKi8KCQl7CgkJCS5waHlzX3N0YXJ0ID0gMHg2ZjgwMDAwMCwKCQkJLnZpcnRf
c3RhcnQgPSAweDZmODAwMDAwLAoJCQkuc2l6ZSA9IDB4MjA4MDAwMDAsCgkJCS5mbGFncyA9IEpB
SUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUgfAoJCQkJSkFJTEhPVVNFX01F
TV9FWEVDVVRFIHwgSkFJTEhPVVNFX01FTV9ETUEsCgkJfSwKCQkKCQkvKiBNZW1SZWdpb246IDkx
MDAwMDAwLTkxZmZmZmZmIDogbWdhZHJtZmJfdnJhbSAqLwoJCXsKCQkJLnBoeXNfc3RhcnQgPSAw
eDkxMDAwMDAwLAoJCQkudmlydF9zdGFydCA9IDB4OTEwMDAwMDAsCgkJCS5zaXplID0gMHgxMDAw
MDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRF
LAoJCX0sCgoJCS8qIE1lbVJlZ2lvbjogOTIwMDAwMDAtOTI3ZmZmZmYgOiAwMDAwOjAzOjAwLjAg
Ki8KCQl7CgkJCS5waHlzX3N0YXJ0ID0gMHg5MjAwMDAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweDky
MDAwMDAwLAoJCQkuc2l6ZSA9IDB4ODAwMDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JF
QUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFLAoJCX0sCgkJLyogTWVtUmVnaW9uOiA5MjgwODAwMC05
MjgwYmZmZiA6IG1nYWRybWZiX21taW8gKi8KCQl7CgkJCS5waHlzX3N0YXJ0ID0gMHg5MjgwODAw
MCwKCQkJLnZpcnRfc3RhcnQgPSAweDkyODA4MDAwLAoJCQkuc2l6ZSA9IDB4NDAwMCwKCQkJLmZs
YWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSwKCQl9LAoJCS8q
IE1lbVJlZ2lvbjogOTJhMDAwMDAtOTJiZmZmZmYgOiBQQ0kgQnVzIDAwMDA6MDEgKi8KCQl7CgkJ
CS5waHlzX3N0YXJ0ID0gMHg5MmEwMDAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweDkyYTAwMDAwLAoJ
CQkuc2l6ZSA9IDB4MjAwMDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlM
SE9VU0VfTUVNX1dSSVRFLAoJCX0sCgkJLyogTWVtUmVnaW9uOiA5MmMwMDAwMC05MmM3ZmZmZiA6
IGFoY2kgKi8KCQl7CgkJCS5waHlzX3N0YXJ0ID0gMHg5MmMwMDAwMCwKCQkJLnZpcnRfc3RhcnQg
PSAweDkyYzAwMDAwLAoJCQkuc2l6ZSA9IDB4ODAwMDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9N
RU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUsCgkJfSwKCQkvKiBNZW1SZWdpb246IDkyYzgw
MDAwLTkyY2ZmZmZmIDogYWhjaSAqLwoJCXsKCQkJLnBoeXNfc3RhcnQgPSAweDkyYzgwMDAwLAoJ
CQkudmlydF9zdGFydCA9IDB4OTJjODAwMDAsCgkJCS5zaXplID0gMHg4MDAwMCwKCQkJLmZsYWdz
ID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSwKCQl9LAoJCS8qIE1l
bVJlZ2lvbjogOTJkMDAwMDAtOTJkMGZmZmYgOiB4aGNpLWhjZCAqLwoJCXsKCQkJLnBoeXNfc3Rh
cnQgPSAweDkyZDAwMDAwLAoJCQkudmlydF9zdGFydCA9IDB4OTJkMDAwMDAsCgkJCS5zaXplID0g
MHgxMDAwMCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9X
UklURSwKCQl9LAoJCS8qIE1lbVJlZ2lvbjogOTJkMTAwMDAtOTJkMTNmZmYgOiAwMDAwOjAwOjFm
LjIgKi8KCQl7CgkJCS5waHlzX3N0YXJ0ID0gMHg5MmQxMDAwMCwKCQkJLnZpcnRfc3RhcnQgPSAw
eDkyZDEwMDAwLAoJCQkuc2l6ZSA9IDB4NDAwMCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX01FTV9S
RUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSwKCQl9LAoJCS8qIE1lbVJlZ2lvbjogOTJkMTQwMDAt
OTJkMTVmZmYgOiAqLwoJCXsKCQkJLnBoeXNfc3RhcnQgPSAweDkyZDE0MDAwLAoJCQkudmlydF9z
dGFydCA9IDB4OTJkMTQwMDAsCgkJCS5zaXplID0gMHgyMDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9V
U0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFLAoJCX0sCgkJLyogTWVtUmVnaW9uOiA5
MmQxNjAwMC05MmQxN2ZmZiA6ICovCgkJewoJCQkucGh5c19zdGFydCA9IDB4OTJkMTYwMDAsCgkJ
CS52aXJ0X3N0YXJ0ID0gMHg5MmQxNjAwMCwKCQkJLnNpemUgPSAweDIwMDAsCgkJCS5mbGFncyA9
IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUsCgkJfSwKCQkvKiBNZW1S
ZWdpb246IDkyZDE4MDAwLTkyZDE4MGZmIDogMDAwMDowMDoxZi40ICovCgkJewoJCQkucGh5c19z
dGFydCA9IDB4OTJkMTgwMDAsCgkJCS52aXJ0X3N0YXJ0ID0gMHg5MmQxODAwMCwKCQkJLnNpemUg
PSAweDEwMDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1f
V1JJVEUsCgkJfSwKCQkvKiBNZW1SZWdpb246IDkyZDE5MDAwLTkyZDE5ZmZmIDogMDAwMDowMDox
Ni40ICovCgkJewoJCQkucGh5c19zdGFydCA9IDB4OTJkMTkwMDAsCgkJCS52aXJ0X3N0YXJ0ID0g
MHg5MmQxOTAwMCwKCQkJLnNpemUgPSAweDEwMDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1f
UkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUsCgkJfSwKCQkvKiBNZW1SZWdpb246IDkyZDFhMDAw
LTkyZDFhZmZmIDogMDAwMDowMDoxNi4xICovCgkJewoJCQkucGh5c19zdGFydCA9IDB4OTJkMWEw
MDAsCgkJCS52aXJ0X3N0YXJ0ID0gMHg5MmQxYTAwMCwKCQkJLnNpemUgPSAweDEwMDAsCgkJCS5m
bGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUsCgkJfSwKCQkv
KiBNZW1SZWdpb246IDkyZDFiMDAwLTkyZDFiZmZmIDogKi8KCQl7CgkJCS5waHlzX3N0YXJ0ID0g
MHg5MmQxYjAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweDkyZDFiMDAwLAoJCQkuc2l6ZSA9IDB4MTAw
MCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSwK
CQl9LAoJCS8qIE1lbVJlZ2lvbjogOTJkMWMwMDAtOTJkMWNmZmYgOiAwMDAwOjAwOjE0LjIgKi8K
CQl7CgkJCS5waHlzX3N0YXJ0ID0gMHg5MmQxYzAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweDkyZDFj
MDAwLAoJCQkuc2l6ZSA9IDB4MTAwMCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwg
SkFJTEhPVVNFX01FTV9XUklURSwKCQl9LAoJCS8qIE1lbVJlZ2lvbjogOTJkMWUwMDAtOTJkMWUw
ZmYgOiAqLwoJCXsKCQkJLnBoeXNfc3RhcnQgPSAweDkyZDFlMDAwLAoJCQkudmlydF9zdGFydCA9
IDB4OTJkMWUwMDAsCgkJCS5zaXplID0gMHgxMDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVN
X1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFLAoJCX0sCgkJLyogTWVtUmVnaW9uOiA5MmQxZjAw
MC05MmQxZjBmZiA6ICovCgkJewoJCQkucGh5c19zdGFydCA9IDB4OTJkMWYwMDAsCgkJCS52aXJ0
X3N0YXJ0ID0gMHg5MmQxZjAwMCwKCQkJLnNpemUgPSAweDEwMDAsCgkJCS5mbGFncyA9IEpBSUxI
T1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUsCgkJfSwKCQkvKiBNZW1SZWdpb246
IDkyZDIwMDAwLTkyZDIwZmZmIDogMDAwMDowMDowNS40ICovCgkJewoJCQkucGh5c19zdGFydCA9
IDB4OTJkMjAwMDAsCgkJCS52aXJ0X3N0YXJ0ID0gMHg5MmQyMDAwMCwKCQkJLnNpemUgPSAweDEw
MDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUs
CgkJfSwKCgkJLyogTWVtUmVnaW9uOiBhYjAwMDAwMC1hYjdmZmZmZiA6IHFlZCAqLwoJCXsKCQkJ
LnBoeXNfc3RhcnQgPSAweGFiMDAwMDAwLAoJCQkudmlydF9zdGFydCA9IDB4YWIwMDAwMDAsCgkJ
CS5zaXplID0gMHg4MDAwMDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxI
T1VTRV9NRU1fV1JJVEUsCgkJfSwKCQkvKiBNZW1SZWdpb246IGFiODAwMDAwLWFiZmZmZmZmIDog
cWVkICovCgkJewoJCQkucGh5c19zdGFydCA9IDB4YWI4MDAwMDAsCgkJCS52aXJ0X3N0YXJ0ID0g
MHhhYjgwMDAwMCwKCQkJLnNpemUgPSAweDgwMDAwMCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX01F
TV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSwKCQl9LAoJCS8qIE1lbVJlZ2lvbjogYWMwMDAw
MDAtYWM3ZmZmZmYgOiBxZWQgKi8KCQl7CgkJCS5waHlzX3N0YXJ0ID0gMHhhYzAwMDAwMCwKCQkJ
LnZpcnRfc3RhcnQgPSAweGFjMDAwMDAwLAoJCQkuc2l6ZSA9IDB4ODAwMDAwLAoJCQkuZmxhZ3Mg
PSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFLAoJCX0sCgkJLyogTWVt
UmVnaW9uOiBhYzgwMDAwMC1hY2ZmZmZmZiA6IHFlZCAqLwoJCXsKCQkJLnBoeXNfc3RhcnQgPSAw
eGFjODAwMDAwLAoJCQkudmlydF9zdGFydCA9IDB4YWM4MDAwMDAsCgkJCS5zaXplID0gMHg4MDAw
MDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUs
CgkJfSwKCQkvKiBNZW1SZWdpb246IGFkMDAwMDAwLWFkMDFmZmZmIDogcWVkICovCgkJewoJCQku
cGh5c19zdGFydCA9IDB4YWQwMDAwMDAsCgkJCS52aXJ0X3N0YXJ0ID0gMHhhZDAwMDAwMCwKCQkJ
LnNpemUgPSAweDIwMDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9V
U0VfTUVNX1dSSVRFLAoJCX0sCgkJLyogTWVtUmVnaW9uOiBhZDAyMDAwMC1hZDAzZmZmZiA6IHFl
ZCAqLwoJCXsKCQkJLnBoeXNfc3RhcnQgPSAweGFkMDIwMDAwLAoJCQkudmlydF9zdGFydCA9IDB4
YWQwMjAwMDAsCgkJCS5zaXplID0gMHgyMDAwMCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX01FTV9S
RUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSwKCQl9LAoJCS8qIE1lbVJlZ2lvbjogYWQwNDAwMDAt
YWQwNWZmZmYgOiBxZWQgKi8KCQl7CgkJCS5waHlzX3N0YXJ0ID0gMHhhZDA0MDAwMCwKCQkJLnZp
cnRfc3RhcnQgPSAweGFkMDQwMDAwLAoJCQkuc2l6ZSA9IDB4MjAwMDAsCgkJCS5mbGFncyA9IEpB
SUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUsCgkJfSwKCQkvKiBNZW1SZWdp
b246IGFkMDYwMDAwLWFkMDdmZmZmIDogcWVkICovCgkJewoJCQkucGh5c19zdGFydCA9IDB4YWQw
NjAwMDAsCgkJCS52aXJ0X3N0YXJ0ID0gMHhhZDA2MDAwMCwKCQkJLnNpemUgPSAweDIwMDAwLAoJ
CQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFLAoJCX0s
CgkJLyogTWVtUmVnaW9uOiBhZDA4MTAwMC1hZDA4ZmZmZiA6IHFlZCAqLwoJCXsKCQkJLnBoeXNf
c3RhcnQgPSAweGFkMDgxMDAwLAoJCQkudmlydF9zdGFydCA9IDB4YWQwODEwMDAsCgkJCS5zaXpl
ID0gMHhmMDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVN
X1dSSVRFLAoJCX0sCgkJLyogTWVtUmVnaW9uOiBhZDA5MTAwMC1hZDA5ZmZmZiA6IHFlZCAqLwoJ
CXsKCQkJLnBoeXNfc3RhcnQgPSAweGFkMDkxMDAwLAoJCQkudmlydF9zdGFydCA9IDB4YWQwOTEw
MDAsCgkJCS5zaXplID0gMHhmMDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBK
QUlMSE9VU0VfTUVNX1dSSVRFLAoJCX0sCgkJLyogTWVtUmVnaW9uOiBhZDBhMTAwMC1hZDBhZmZm
ZiA6IHFlZCAqLwoJCXsKCQkJLnBoeXNfc3RhcnQgPSAweGFkMGExMDAwLAoJCQkudmlydF9zdGFy
dCA9IDB4YWQwYTEwMDAsCgkJCS5zaXplID0gMHhmMDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0Vf
TUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFLAoJCX0sCgkJLyogTWVtUmVnaW9uOiBhZDBi
MTAwMC1hZDBiZmZmZiA6IHFlZCAqLwoJCXsKCQkJLnBoeXNfc3RhcnQgPSAweGFkMGIxMDAwLAoJ
CQkudmlydF9zdGFydCA9IDB4YWQwYjEwMDAsCgkJCS5zaXplID0gMHhmMDAwLAoJCQkuZmxhZ3Mg
PSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFLAoJCX0sCgkJLyogTWVt
UmVnaW9uOiBhZDEwMDAwMC1hZDEwMGZmZiA6IDAwMDA6MTY6MDUuNCAqLwoJCXsKCQkJLnBoeXNf
c3RhcnQgPSAweGFkMTAwMDAwLAoJCQkudmlydF9zdGFydCA9IDB4YWQxMDAwMDAsCgkJCS5zaXpl
ID0gMHgxMDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVN
X1dSSVRFLAoJCX0sCgkJLyogTWVtUmVnaW9uOiBhZDIwMDAwMC1hZDI3ZmZmZiA6IDAwMDA6MTc6
MDAuMCAqLwoJCXsKCQkJLnBoeXNfc3RhcnQgPSAweGFkMjAwMDAwLAoJCQkudmlydF9zdGFydCA9
IDB4YWQyMDAwMDAsCgkJCS5zaXplID0gMHg4MDAwMCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX01F
TV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSwKCQl9LAoJCS8qIE1lbVJlZ2lvbjogYWQyODAw
MDAtYWQyZmZmZmYgOiAwMDAwOjE3OjAwLjEgKi8KCQl7CgkJCS5waHlzX3N0YXJ0ID0gMHhhZDI4
MDAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweGFkMjgwMDAwLAoJCQkuc2l6ZSA9IDB4ODAwMDAsCgkJ
CS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUsCgkJfSwK
CQkvKiBNZW1SZWdpb246IGFkMzAwMDAwLWFkMzdmZmZmIDogMDAwMDoxNzowMC4yICovCgkJewoJ
CQkucGh5c19zdGFydCA9IDB4YWQzMDAwMDAsCgkJCS52aXJ0X3N0YXJ0ID0gMHhhZDMwMDAwMCwK
CQkJLnNpemUgPSAweDgwMDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlM
SE9VU0VfTUVNX1dSSVRFLAoJCX0sCgkJLyogTWVtUmVnaW9uOiBhZDM4MDAwMC1hZDNmZmZmZiA6
IDAwMDA6MTc6MDAuMyAqLwoJCXsKCQkJLnBoeXNfc3RhcnQgPSAweGFkMzgwMDAwLAoJCQkudmly
dF9zdGFydCA9IDB4YWQzODAwMDAsCgkJCS5zaXplID0gMHg4MDAwMCwKCQkJLmZsYWdzID0gSkFJ
TEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSwKCQl9LAoKCQkvKiBNZW1SZWdp
b246IGM2MDAwMDAwLWM2MGZmZmZmIDogMDAwMDo2NTowMC4wICovCgkJewoJCQkucGh5c19zdGFy
dCA9IDB4YzYwMDAwMDAsCgkJCS52aXJ0X3N0YXJ0ID0gMHhjNjAwMDAwMCwKCQkJLnNpemUgPSAw
eDEwMDAwMCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9X
UklURSwKCQl9LAoJCS8qIE1lbVJlZ2lvbjogYzYxMDAwMDAtYzYxMGRmZmYgOiBtZWdhc2FzOiBM
U0kgKi8KCQl7CgkJCS5waHlzX3N0YXJ0ID0gMHhjNjEwMDAwMCwKCQkJLnZpcnRfc3RhcnQgPSAw
eGM2MTAwMDAwLAoJCQkuc2l6ZSA9IDB4ZTAwMCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX01FTV9S
RUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSwKCQl9LAoJCS8qIE1lbVJlZ2lvbjogYzYxMGYwMDAt
YzYxMGZmZmYgOiBtZWdhc2FzOiBMU0kgKi8KCQl7CgkJCS5waHlzX3N0YXJ0ID0gMHhjNjEwZjAw
MCwKCQkJLnZpcnRfc3RhcnQgPSAweGM2MTBmMDAwLAoJCQkuc2l6ZSA9IDB4MTAwMCwKCQkJLmZs
YWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSwKCQl9LAoJCS8q
IE1lbVJlZ2lvbjogYzYyMDAwMDAtYzYyMDBmZmYgOiAwMDAwOjY0OjA1LjQgKi8KCQl7CgkJCS5w
aHlzX3N0YXJ0ID0gMHhjNjIwMDAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweGM2MjAwMDAwLAoJCQku
c2l6ZSA9IDB4MTAwMCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNF
X01FTV9XUklURSwKCQl9LAoJCS8qIE1lbVJlZ2lvbjogZTEwMDAwMDAtZTEwZmZmZmYgOiAwMDAw
OmIzOjAwLjAgKi8KCQl7CgkJCS5waHlzX3N0YXJ0ID0gMHhlMTAwMDAwMCwKCQkJLnZpcnRfc3Rh
cnQgPSAweGUxMDAwMDAwLAoJCQkuc2l6ZSA9IDB4MTAwMDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9V
U0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFLAoJCX0sCgkJLyogTWVtUmVnaW9uOiBl
MTEwMDAwMC1lMTFmZmZmZiA6IDAwMDA6YjM6MDAuMSAqLwoJCXsKCQkJLnBoeXNfc3RhcnQgPSAw
eGUxMTAwMDAwLAoJCQkudmlydF9zdGFydCA9IDB4ZTExMDAwMDAsCgkJCS5zaXplID0gMHgxMDAw
MDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUs
CgkJfSwKCQkvKiBNZW1SZWdpb246IGUyMDAwMDAwLWUyMDAxZmZmIDogbWx4NV9jb3JlICovCgkJ
ewoJCQkucGh5c19zdGFydCA9IDB4ZTIwMDAwMDAsCgkJCS52aXJ0X3N0YXJ0ID0gMHhlMjAwMDAw
MCwKCQkJLnNpemUgPSAweDIwMDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpB
SUxIT1VTRV9NRU1fV1JJVEUsCgkJfSwKCQkvKiBNZW1SZWdpb246IGUyMDAzMDAwLWUzZmZmZmZm
IDogbWx4NV9jb3JlICovCgkJewoJCQkucGh5c19zdGFydCA9IDB4ZTIwMDMwMDAsCgkJCS52aXJ0
X3N0YXJ0ID0gMHhlMjAwMzAwMCwKCQkJLnNpemUgPSAweDFmZmQwMDAsCgkJCS5mbGFncyA9IEpB
SUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUsCgkJfSwKCQkvKiBNZW1SZWdp
b246IGU0MDAwMDAwLWU0MDAxZmZmIDogbWx4NV9jb3JlICovCgkJewoJCQkucGh5c19zdGFydCA9
IDB4ZTQwMDAwMDAsCgkJCS52aXJ0X3N0YXJ0ID0gMHhlNDAwMDAwMCwKCQkJLnNpemUgPSAweDIw
MDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUs
CgkJfSwKCQkvKiBNZW1SZWdpb246IGU0MDAzMDAwLWU1ZmZmZmZmIDogbWx4NV9jb3JlICovCgkJ
ewoJCQkucGh5c19zdGFydCA9IDB4ZTQwMDMwMDAsCgkJCS52aXJ0X3N0YXJ0ID0gMHhlNDAwMzAw
MCwKCQkJLnNpemUgPSAweDFmZmQwMDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8
IEpBSUxIT1VTRV9NRU1fV1JJVEUsCgkJfSwKCQkvKiBNZW1SZWdpb246IGU2MDAwMDAwLWU2MDAw
ZmZmIDogMDAwMDpiMjowNS40ICovCgkJewoJCQkucGh5c19zdGFydCA9IDB4ZTYwMDAwMDAsCgkJ
CS52aXJ0X3N0YXJ0ID0gMHhlNjAwMDAwMCwKCQkJLnNpemUgPSAweDEwMDAsCgkJCS5mbGFncyA9
IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUsCgkJfSwKCgkJLyogTWVt
UmVnaW9uOiBmZDAwMDAwMC1mZTdmZmZmZiA6ICovCgkJewoJCQkucGh5c19zdGFydCA9IDB4ZmQw
MDAwMDAsCgkJCS52aXJ0X3N0YXJ0ID0gMHhmZDAwMDAwMCwKCQkJLnNpemUgPSAweDE3MDAwMDEs
CgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUsCgkJ
fSwKCgkJLyogTWVtUmVnaW9uOiBmZWQwMDAwMC1mZWQwMDNmZiA6IEhQRVQgMCAqLwoJCXsKCQkJ
LnBoeXNfc3RhcnQgPSAweGZlZDAwMDAwLAoJCQkudmlydF9zdGFydCA9IDB4ZmVkMDAwMDAsCgkJ
CS5zaXplID0gMHgxMDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9V
U0VfTUVNX1dSSVRFLAoJCX0sCgkJLyogTWVtUmVnaW9uOiBmZWQxMjAwMC1mZWQxMjAwZiA6IHBu
cCAwMDowMSAqLwoJCXsKCQkJLnBoeXNfc3RhcnQgPSAweGZlZDEyMDAwLAoJCQkudmlydF9zdGFy
dCA9IDB4ZmVkMTIwMDAsCgkJCS5zaXplID0gMHgxMDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0Vf
TUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFLAoJCX0sCgkJLyogTWVtUmVnaW9uOiBmZWQx
MjAxMC1mZWQxMjAxZiA6IHBucCAwMDowMSAqLwoJCXsKCQkJLnBoeXNfc3RhcnQgPSAweGZlZDEy
MDEwLAoJCQkudmlydF9zdGFydCA9IDB4ZmVkMTIwMTAsCgkJCS5zaXplID0gMHgxMDAwLAoJCQku
ZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFLAoJCX0sCgkJ
LyogTWVtUmVnaW9uOiBmZWQxYjAwMC1mZWQxYmZmZiA6IHBucCAwMDowMSAqLwoJCXsKCQkJLnBo
eXNfc3RhcnQgPSAweGZlZDFiMDAwLAoJCQkudmlydF9zdGFydCA9IDB4ZmVkMWIwMDAsCgkJCS5z
aXplID0gMHgxMDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0Vf
TUVNX1dSSVRFLAoJCX0sCgkJLyogTWVtUmVnaW9uOiBmZWQxYzAwMC1mZWQzZmZmZiA6IHBucCAw
MDowMSAqLwoJCXsKCQkJLnBoeXNfc3RhcnQgPSAweGZlZDFjMDAwLAoJCQkudmlydF9zdGFydCA9
IDB4ZmVkMWMwMDAsCgkJCS5zaXplID0gMHgyNDAwMCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX01F
TV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSwKCQl9LAoJCS8qIE1lbVJlZ2lvbjogZmVkNDAw
MDAtZmVkNDRmZmYgOiAqLwoJCXsKCQkJLnBoeXNfc3RhcnQgPSAweGZlZDQwMDAwLAoJCQkudmly
dF9zdGFydCA9IDB4ZmVkNDAwMDAsCgkJCS5zaXplID0gMHg1MDAwLAoJCQkuZmxhZ3MgPSBKQUlM
SE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFLAoJCX0sCgkJLyogTWVtUmVnaW9u
OiBmZWQ0NTAwMC1mZWQ4YmZmZiA6IHBucCAwMDowMSAqLwoJCXsKCQkJLnBoeXNfc3RhcnQgPSAw
eGZlZDQ1MDAwLAoJCQkudmlydF9zdGFydCA9IDB4ZmVkNDUwMDAsCgkJCS5zaXplID0gMHg0NzAw
MCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSwK
CQl9LAoKCQkvKiBNZW1SZWdpb246IGZmMDAwMDAwLWZmZmZmZmZmIDogKi8KCQl7CgkJCS5waHlz
X3N0YXJ0ID0gMHhmZjAwMDAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweGZmMDAwMDAwLAoJCQkuc2l6
ZSA9IDB4MTAwMDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0Vf
TUVNX1dSSVRFLAoJCX0sCgoJCS8qIE1lbVJlZ2lvbjogMTAwMDAwMDAwLTQyNDdmZmZmZiA6IFN5
c3RlbSBSQU0gKi8KCQl7CgkJCS5waHlzX3N0YXJ0ID0gMHgxMDAwMDAwMDAsCgkJCS52aXJ0X3N0
YXJ0ID0gMHgxMDAwMDAwMDAsCgkJCS5zaXplID0gMHgzMjQ4MDAwMDAsCgkJCS5mbGFncyA9IEpB
SUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUgfAoJCQkJSkFJTEhPVVNFX01F
TV9FWEVDVVRFIHwgSkFJTEhPVVNFX01FTV9ETUEsCgkJfSwKCQkvKiBNZW1SZWdpb246IDQyNDgw
MDAwMC00MjVmZmZmZmYgOiBLZXJuZWwgKi8KCQl7CgkJCS5waHlzX3N0YXJ0ID0gMHg0MjQ4MDAw
MDAsCgkJCS52aXJ0X3N0YXJ0ID0gMHg0MjQ4MDAwMDAsCgkJCS5zaXplID0gMHgxODAwMDAwLAoJ
CQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFIHwKCQkJ
CUpBSUxIT1VTRV9NRU1fRVhFQ1VURSB8IEpBSUxIT1VTRV9NRU1fRE1BLAoJCX0sCgkJLyogTWVt
UmVnaW9uOiA0MjYwMDAwMDAtODdmZmZmZmZmIDogU3lzdGVtIFJBTSAqLwoJCXsKCQkJLnBoeXNf
c3RhcnQgPSAweDQyNjAwMDAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweDQyNjAwMDAwMCwKCQkJLnNp
emUgPSAweDQ1YTAwMDAwMCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhP
VVNFX01FTV9XUklURSB8CgkJCQlKQUlMSE9VU0VfTUVNX0VYRUNVVEUgfCBKQUlMSE9VU0VfTUVN
X0RNQSwKCQl9LAoJCS8qIE1lbVJlZ2lvbjogMzgwMDAwMDAwMDAwLTM4MDAwMDFmZmZmZiA6IFBD
SSBCdXMgMDAwMDowMSAqLwoJCXsKCQkJLnBoeXNfc3RhcnQgPSAweDM4MDAwMDAwMDAwMCwKCQkJ
LnZpcnRfc3RhcnQgPSAweDM4MDAwMDAwMDAwMCwKCQkJLnNpemUgPSAweDIwMDAwMCwKCQkJLmZs
YWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSwKCQl9LAoJCS8q
IE1lbVJlZ2lvbjogMzgxMDAwMDAwMDAwLTM4MWZmZmZmZmZmZiA6IFBDSSBCdXMgMDAwMDoxNiAq
LwoJCXsKCQkJLnBoeXNfc3RhcnQgPSAweDM4MTAwMDAwMDAwMCwKCQkJLnZpcnRfc3RhcnQgPSAw
eDM4MTAwMDAwMDAwMCwKCQkJLnNpemUgPSAweDEwMDAwMDAwMDAsCgkJCS5mbGFncyA9IEpBSUxI
T1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUsCgkJfSwKCQkvKiBNZW1SZWdpb246
IDM4MjAwMDAwMDAwMC0zODJmZmZmZmZmZmYgOiBQQ0kgQnVzIDAwMDA6NjQgKi8KCQl7CgkJCS5w
aHlzX3N0YXJ0ID0gMHgzODIwMDAwMDAwMDAsCgkJCS52aXJ0X3N0YXJ0ID0gMHgzODIwMDAwMDAw
MDAsCgkJCS5zaXplID0gMHgxMDAwMDAwMDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JF
QUQgfCBKQUlMSE9VU0VfTUVNX1dSSVRFLAoJCX0sCgkJLyogTWVtUmVnaW9uOiAzODMwMDAwMDAw
MDAtMzgzZmZmZmZmZmZmIDogUENJIEJ1cyAwMDAwOmIyICovCgkJewoJCQkucGh5c19zdGFydCA9
IDB4MzgzMDAwMDAwMDAwLAoJCQkudmlydF9zdGFydCA9IDB4MzgzMDAwMDAwMDAwLAoJCQkuc2l6
ZSA9IDB4MTAwMDAwMDAwMCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhP
VVNFX01FTV9XUklURSwKCQl9LAoJCS8qIE1lbVJlZ2lvbjogMDAwYzAwMDAtMDAwZGZmZmYgOiBS
T01zICovCgkJewoJCQkucGh5c19zdGFydCA9IDB4YzAwMDAsCgkJCS52aXJ0X3N0YXJ0ID0gMHhj
MDAwMCwKCQkJLnNpemUgPSAweDIwMDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQg
fCBKQUlMSE9VU0VfTUVNX1dSSVRFLAoJCX0sCgkJLyogTWVtUmVnaW9uOiA1NDczODAwMC01Yzcz
ZmZmZiA6IEFDUEkgRE1BUiBSTVJSICovCgkJLyogUENJIGRldmljZTogNjU6MDAuMCAqLwoJCXsK
CQkJLnBoeXNfc3RhcnQgPSAweDU0NzM4MDAwLAoJCQkudmlydF9zdGFydCA9IDB4NTQ3MzgwMDAs
CgkJCS5zaXplID0gMHg4MDA4MDAwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfTUVNX1JFQUQgfCBK
QUlMSE9VU0VfTUVNX1dSSVRFIHwKCQkJCUpBSUxIT1VTRV9NRU1fRVhFQ1VURSB8IEpBSUxIT1VT
RV9NRU1fRE1BLAoJCX0sCgkJLyogTWVtUmVnaW9uOiA2ZTJjOTAwMC02ZTdjOGZmZiA6IEFDUEkg
RE1BUiBSTVJSICovCgkJLyogUENJIGRldmljZTogMDA6MTQuMCAqLwoJCXsKCQkJLnBoeXNfc3Rh
cnQgPSAweDZlMmM5MDAwLAoJCQkudmlydF9zdGFydCA9IDB4NmUyYzkwMDAsCgkJCS5zaXplID0g
MHg1MDAwMDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1f
V1JJVEUgfAoJCQkJSkFJTEhPVVNFX01FTV9FWEVDVVRFIHwgSkFJTEhPVVNFX01FTV9ETUEsCgkJ
fSwKCQkvKiBNZW1SZWdpb246IDZmNDQwMDAwLTZmNDQyZmZmIDogQUNQSSBETUFSIFJNUlIgKi8K
CQkvKiBQQ0kgZGV2aWNlOiAwMDoxNC4wICovCgkJewoJCQkucGh5c19zdGFydCA9IDB4NmY0NDAw
MDAsCgkJCS52aXJ0X3N0YXJ0ID0gMHg2ZjQ0MDAwMCwKCQkJLnNpemUgPSAweDMwMDAsCgkJCS5m
bGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUgfAoJCQkJSkFJ
TEhPVVNFX01FTV9FWEVDVVRFIHwgSkFJTEhPVVNFX01FTV9ETUEsCgkJfSwKCQkvKiBNZW1SZWdp
b246IDNhNjAwMDAwLTNmMWZmZmZmIDogSkFJTEhPVVNFIElubWF0ZSBNZW1vcnkgKi8KCQl7CgkJ
CS5waHlzX3N0YXJ0ID0gMHgzYTYwMDAwMCwKCQkJLnZpcnRfc3RhcnQgPSAweDNhNjAwMDAwLAoJ
CQkuc2l6ZSA9IDB4NGMwMDAwMCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJ
TEhPVVNFX01FTV9XUklURSwKCQl9LAoJfSwKCgkuaXJxY2hpcHMgPSB7CgkJLyogSU9BUElDIDgs
IEdTSSBiYXNlIDAgKi8KCQl7CgkJCS5hZGRyZXNzID0gMHhmZWMwMDAwMCwKCQkJLmlkID0gMHgz
ZjBmOCwKCQkJLnBpbl9iaXRtYXAgPSB7CgkJCQkweGZmZmZmZmZmLCAweGZmZmZmZmZmLCAweGZm
ZmZmZmZmLCAweGZmZmZmZmZmCgkJCX0sCgkJfSwKCQkvKiBJT0FQSUMgOSwgR1NJIGJhc2UgMjQg
Ki8KCQl7CgkJCS5hZGRyZXNzID0gMHhmZWMwMTAwMCwKCQkJLmlkID0gMHgzMDAyYywKCQkJLnBp
bl9iaXRtYXAgPSB7CgkJCQkweGZmZmZmZmZmLCAweGZmZmZmZmZmLCAweGZmZmZmZmZmLCAweGZm
ZmZmZmZmCgkJCX0sCgkJfSwKCQkvKiBJT0FQSUMgMTAsIEdTSSBiYXNlIDMyICovCgkJewoJCQku
YWRkcmVzcyA9IDB4ZmVjMDgwMDAsCgkJCS5pZCA9IDB4MTYyYywKCQkJLnBpbl9iaXRtYXAgPSB7
CgkJCQkweGZmZmZmZmZmLCAweGZmZmZmZmZmLCAweGZmZmZmZmZmLCAweGZmZmZmZmZmCgkJCX0s
CgkJfSwKCQkvKiBJT0FQSUMgMTEsIEdTSSBiYXNlIDQwICovCgkJewoJCQkuYWRkcmVzcyA9IDB4
ZmVjMTAwMDAsCgkJCS5pZCA9IDB4MTY0MmMsCgkJCS5waW5fYml0bWFwID0gewoJCQkJMHhmZmZm
ZmZmZiwgMHhmZmZmZmZmZiwgMHhmZmZmZmZmZiwgMHhmZmZmZmZmZgoJCQl9LAoJCX0sCgkJLyog
SU9BUElDIDEyLCBHU0kgYmFzZSA0OCAqLwoJCXsKCQkJLmFkZHJlc3MgPSAweGZlYzE4MDAwLAoJ
CQkuaWQgPSAweDJiMjJjLAoJCQkucGluX2JpdG1hcCA9IHsKCQkJCTB4ZmZmZmZmZmYsIDB4ZmZm
ZmZmZmYsIDB4ZmZmZmZmZmYsIDB4ZmZmZmZmZmYKCQkJfSwKCQl9LAoJfSwKCgkucGlvX2JpdG1h
cCA9IHsKCQlbICAgICAwLzggLi4uICAgMHgxZi84XSA9IC0xLAoJCVsgIDB4MjAvOCAuLi4gICAw
eDI3LzhdID0gMHgwMCwgLyogcGljMSAqLwoJCVsgIDB4MjcvOCAuLi4gICAweDJmLzhdID0gMHgw
MCwgLyogcGljMSAqLwoJCVsgIDB4MzAvOCAuLi4gICAweDM3LzhdID0gLTEsIAoJCVsgIDB4Mzcv
OCAuLi4gICAweDNmLzhdID0gLTEsIAoJCVsgIDB4NDAvOCAuLi4gICAweDQ3LzhdID0gMHhmMCwg
LyogUElUICovCgkJWyAgMHg0OC84IC4uLiAgIDB4NWYvOF0gPSAtMSwKCQlbICAweDYwLzggLi4u
ICAgMHg2Ny84XSA9IDB4ZWMsIC8qIEhBQ0s6IE5NSSBzdGF0dXMvY29udHJvbCAqLwoJCVsgIDB4
NjgvOCAuLi4gICAweDZmLzhdID0gLTEsCgkJWyAgMHg3MC84IC4uLiAgIDB4NzcvOF0gPSAweGZj
LCAvKiBSVEMgKi8KCQlbICAweDc4LzggLi4uICAweDJmNy84XSA9IC0xLAoJCVsgMHgyZjgvOCAu
Li4gIDB4MmZmLzhdID0gMHgwMCwgLyogc2VyaWFsMSAqLwoJCVsgMHgzMDAvOCAuLi4gIDB4M2Rm
LzhdID0gMHgwMCwgLyogVkdBICovCgkJWyAweDNlMC84IC4uLiAgMHgzZjcvOF0gPSAtMSwKCQlb
IDB4M2Y4LzggLi4uICAweDNmZi84XSA9IDB4MDAsIC8qIHNlcmlhbDIgKi8KCQlbIDB4ZDAwLzgg
Li4uIDB4ZmZmZi84XSA9IDAsIC8qIEhBQ0s6IFBDSSBidXMgKi8KCX0sCgoJLnBjaV9kZXZpY2Vz
ID0gewoJCS8qIFBDSURldmljZTogMDA6MDAuMCAqLwoJCXsKCQkJLnR5cGUgPSBKQUlMSE9VU0Vf
UENJX1RZUEVfREVWSUNFLAoJCQkuaW9tbXUgPSAzLAoJCQkuZG9tYWluID0gMHgwLAoJCQkuYmRm
ID0gMHgwLAoJCQkuYmFyX21hc2sgPSB7CgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAw
MDAwMDAwLAoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJfSwKCQkJ
LmNhcHNfc3RhcnQgPSAwLAoJCQkubnVtX2NhcHMgPSA5LAoJCQkubnVtX21zaV92ZWN0b3JzID0g
MCwKCQkJLm1zaV82NGJpdHMgPSAwLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4
X3JlZ2lvbl9zaXplID0gMHgwLAoJCQkubXNpeF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJLyogUENJ
RGV2aWNlOiAwMDowNS4wICovCgkJewoJCQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJ
Q0UsCgkJCS5pb21tdSA9IDMsCgkJCS5kb21haW4gPSAweDAsCgkJCS5iZGYgPSAweDI4LAoJCQku
YmFyX21hc2sgPSB7CgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQkJ
MHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJfSwKCQkJLmNhcHNfc3RhcnQg
PSA5LAoJCQkubnVtX2NhcHMgPSAyLAoJCQkubnVtX21zaV92ZWN0b3JzID0gMCwKCQkJLm1zaV82
NGJpdHMgPSAwLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXpl
ID0gMHgwLAoJCQkubXNpeF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJLyogUENJRGV2aWNlOiAwMDow
NS4yICovCgkJewoJCQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21t
dSA9IDMsCgkJCS5kb21haW4gPSAweDAsCgkJCS5iZGYgPSAweDJhLAoJCQkuYmFyX21hc2sgPSB7
CgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQkJMHgwMDAwMDAwMCwg
MHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJfSwKCQkJLmNhcHNfc3RhcnQgPSA5LAoJCQkubnVt
X2NhcHMgPSAyLAoJCQkubnVtX21zaV92ZWN0b3JzID0gMCwKCQkJLm1zaV82NGJpdHMgPSAwLAoJ
CQkubnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgwLAoJCQku
bXNpeF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJLyogUENJRGV2aWNlOiAwMDowNS40ICovCgkJewoJ
CQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21tdSA9IDMsCgkJCS5k
b21haW4gPSAweDAsCgkJCS5iZGYgPSAweDJjLAoJCQkuYmFyX21hc2sgPSB7CgkJCQkweGZmZmZm
MDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwg
MHgwMDAwMDAwMCwKCQkJfSwKCQkJLmNhcHNfc3RhcnQgPSAxMSwKCQkJLm51bV9jYXBzID0gMywK
CQkJLm51bV9tc2lfdmVjdG9ycyA9IDAsCgkJCS5tc2lfNjRiaXRzID0gMCwKCQkJLm51bV9tc2l4
X3ZlY3RvcnMgPSAwLAoJCQkubXNpeF9yZWdpb25fc2l6ZSA9IDB4MCwKCQkJLm1zaXhfYWRkcmVz
cyA9IDB4MCwKCQl9LAoJCS8qIFBDSURldmljZTogMDA6MDguMCAqLwoJCXsKCQkJLnR5cGUgPSBK
QUlMSE9VU0VfUENJX1RZUEVfREVWSUNFLAoJCQkuaW9tbXUgPSAzLAoJCQkuZG9tYWluID0gMHgw
LAoJCQkuYmRmID0gMHg0MCwKCQkJLmJhcl9tYXNrID0gewoJCQkJMHgwMDAwMDAwMCwgMHgwMDAw
MDAwMCwgMHgwMDAwMDAwMCwKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAs
CgkJCX0sCgkJCS5jYXBzX3N0YXJ0ID0gOSwKCQkJLm51bV9jYXBzID0gMiwKCQkJLm51bV9tc2lf
dmVjdG9ycyA9IDAsCgkJCS5tc2lfNjRiaXRzID0gMCwKCQkJLm51bV9tc2l4X3ZlY3RvcnMgPSAw
LAoJCQkubXNpeF9yZWdpb25fc2l6ZSA9IDB4MCwKCQkJLm1zaXhfYWRkcmVzcyA9IDB4MCwKCQl9
LAoJCS8qIFBDSURldmljZTogMDA6MDguMSAqLwoJCXsKCQkJLnR5cGUgPSBKQUlMSE9VU0VfUENJ
X1RZUEVfREVWSUNFLAoJCQkuaW9tbXUgPSAzLAoJCQkuZG9tYWluID0gMHgwLAoJCQkuYmRmID0g
MHg0MSwKCQkJLmJhcl9tYXNrID0gewoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAw
MDAwMCwKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCX0sCgkJCS5j
YXBzX3N0YXJ0ID0gMCwKCQkJLm51bV9jYXBzID0gMCwKCQkJLm51bV9tc2lfdmVjdG9ycyA9IDAs
CgkJCS5tc2lfNjRiaXRzID0gMCwKCQkJLm51bV9tc2l4X3ZlY3RvcnMgPSAwLAoJCQkubXNpeF9y
ZWdpb25fc2l6ZSA9IDB4MCwKCQkJLm1zaXhfYWRkcmVzcyA9IDB4MCwKCQl9LAoJCS8qIFBDSURl
dmljZTogMDA6MDguMiAqLwoJCXsKCQkJLnR5cGUgPSBKQUlMSE9VU0VfUENJX1RZUEVfREVWSUNF
LAoJCQkuaW9tbXUgPSAzLAoJCQkuZG9tYWluID0gMHgwLAoJCQkuYmRmID0gMHg0MiwKCQkJLmJh
cl9tYXNrID0gewoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJCTB4
MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCX0sCgkJCS5jYXBzX3N0YXJ0ID0g
OSwKCQkJLm51bV9jYXBzID0gMiwKCQkJLm51bV9tc2lfdmVjdG9ycyA9IDAsCgkJCS5tc2lfNjRi
aXRzID0gMCwKCQkJLm51bV9tc2l4X3ZlY3RvcnMgPSAwLAoJCQkubXNpeF9yZWdpb25fc2l6ZSA9
IDB4MCwKCQkJLm1zaXhfYWRkcmVzcyA9IDB4MCwKCQl9LAoJCS8qIFBDSURldmljZTogMDA6MTEu
MCAqLwoJCXsKCQkJLnR5cGUgPSBKQUlMSE9VU0VfUENJX1RZUEVfREVWSUNFLAoJCQkuaW9tbXUg
PSAzLAoJCQkuZG9tYWluID0gMHgwLAoJCQkuYmRmID0gMHg4OCwKCQkJLmJhcl9tYXNrID0gewoJ
CQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJCTB4MDAwMDAwMDAsIDB4
MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCX0sCgkJCS5jYXBzX3N0YXJ0ID0gMTQsCgkJCS5udW1f
Y2FwcyA9IDEsCgkJCS5udW1fbXNpX3ZlY3RvcnMgPSAwLAoJCQkubXNpXzY0Yml0cyA9IDAsCgkJ
CS5udW1fbXNpeF92ZWN0b3JzID0gMCwKCQkJLm1zaXhfcmVnaW9uX3NpemUgPSAweDAsCgkJCS5t
c2l4X2FkZHJlc3MgPSAweDAsCgkJfSwKCQkvKiBQQ0lEZXZpY2U6IDAwOjExLjUgKi8KCQl7CgkJ
CS50eXBlID0gSkFJTEhPVVNFX1BDSV9UWVBFX0RFVklDRSwKCQkJLmlvbW11ID0gMywKCQkJLmRv
bWFpbiA9IDB4MCwKCQkJLmJkZiA9IDB4OGQsCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4ZmZmZmUw
MDAsIDB4ZmZmZmZmMDAsIDB4ZmZmZmZmZjgsCgkJCQkweGZmZmZmZmZjLCAweGZmZmZmZmUwLCAw
eGZmZjgwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDE1LAoJCQkubnVtX2NhcHMgPSAzLAoJ
CQkubnVtX21zaV92ZWN0b3JzID0gMSwKCQkJLm1zaV82NGJpdHMgPSAwLAoJCQkubnVtX21zaXhf
dmVjdG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgwLAoJCQkubXNpeF9hZGRyZXNz
ID0gMHgwLAoJCX0sCgkJLyogUENJRGV2aWNlOiAwMDoxNC4wICovCgkJewoJCQkudHlwZSA9IEpB
SUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21tdSA9IDMsCgkJCS5kb21haW4gPSAweDAs
CgkJCS5iZGYgPSAweGEwLAoJCQkuYmFyX21hc2sgPSB7CgkJCQkweGZmZmYwMDAwLCAweGZmZmZm
ZmZmLCAweDAwMDAwMDAwLAoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwK
CQkJfSwKCQkJLmNhcHNfc3RhcnQgPSAxOCwKCQkJLm51bV9jYXBzID0gMiwKCQkJLm51bV9tc2lf
dmVjdG9ycyA9IDgsCgkJCS5tc2lfNjRiaXRzID0gMSwKCQkJLm51bV9tc2l4X3ZlY3RvcnMgPSAw
LAoJCQkubXNpeF9yZWdpb25fc2l6ZSA9IDB4MCwKCQkJLm1zaXhfYWRkcmVzcyA9IDB4MCwKCQl9
LAoJCS8qIFBDSURldmljZTogMDA6MTQuMiAqLwoJCXsKCQkJLnR5cGUgPSBKQUlMSE9VU0VfUENJ
X1RZUEVfREVWSUNFLAoJCQkuaW9tbXUgPSAzLAoJCQkuZG9tYWluID0gMHgwLAoJCQkuYmRmID0g
MHhhMiwKCQkJLmJhcl9tYXNrID0gewoJCQkJMHhmZmZmZjAwMCwgMHhmZmZmZmZmZiwgMHgwMDAw
MDAwMCwKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCX0sCgkJCS5j
YXBzX3N0YXJ0ID0gMjAsCgkJCS5udW1fY2FwcyA9IDIsCgkJCS5udW1fbXNpX3ZlY3RvcnMgPSAx
LAoJCQkubXNpXzY0Yml0cyA9IDAsCgkJCS5udW1fbXNpeF92ZWN0b3JzID0gMCwKCQkJLm1zaXhf
cmVnaW9uX3NpemUgPSAweDAsCgkJCS5tc2l4X2FkZHJlc3MgPSAweDAsCgkJfSwKCQkvKiBQQ0lE
ZXZpY2U6IDAwOjE2LjAgKi8KCQl7CgkJCS50eXBlID0gSkFJTEhPVVNFX1BDSV9UWVBFX0RFVklD
RSwKCQkJLmlvbW11ID0gMywKCQkJLmRvbWFpbiA9IDB4MCwKCQkJLmJkZiA9IDB4YjAsCgkJCS5i
YXJfbWFzayA9IHsKCQkJCTB4ZmZmZmYwMDAsIDB4ZmZmZmZmZmYsIDB4MDAwMDAwMDAsCgkJCQkw
eDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9
IDIyLAoJCQkubnVtX2NhcHMgPSAyLAoJCQkubnVtX21zaV92ZWN0b3JzID0gMSwKCQkJLm1zaV82
NGJpdHMgPSAxLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXpl
ID0gMHgwLAoJCQkubXNpeF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJLyogUENJRGV2aWNlOiAwMDox
Ni4xICovCgkJewoJCQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21t
dSA9IDMsCgkJCS5kb21haW4gPSAweDAsCgkJCS5iZGYgPSAweGIxLAoJCQkuYmFyX21hc2sgPSB7
CgkJCQkweGZmZmZmMDAwLCAweGZmZmZmZmZmLCAweDAwMDAwMDAwLAoJCQkJMHgwMDAwMDAwMCwg
MHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJfSwKCQkJLmNhcHNfc3RhcnQgPSAyMiwKCQkJLm51
bV9jYXBzID0gMiwKCQkJLm51bV9tc2lfdmVjdG9ycyA9IDEsCgkJCS5tc2lfNjRiaXRzID0gMSwK
CQkJLm51bV9tc2l4X3ZlY3RvcnMgPSAwLAoJCQkubXNpeF9yZWdpb25fc2l6ZSA9IDB4MCwKCQkJ
Lm1zaXhfYWRkcmVzcyA9IDB4MCwKCQl9LAoJCS8qIFBDSURldmljZTogMDA6MTYuNCAqLwoJCXsK
CQkJLnR5cGUgPSBKQUlMSE9VU0VfUENJX1RZUEVfREVWSUNFLAoJCQkuaW9tbXUgPSAzLAoJCQku
ZG9tYWluID0gMHgwLAoJCQkuYmRmID0gMHhiNCwKCQkJLmJhcl9tYXNrID0gewoJCQkJMHhmZmZm
ZjAwMCwgMHhmZmZmZmZmZiwgMHgwMDAwMDAwMCwKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAs
IDB4MDAwMDAwMDAsCgkJCX0sCgkJCS5jYXBzX3N0YXJ0ID0gMjIsCgkJCS5udW1fY2FwcyA9IDIs
CgkJCS5udW1fbXNpX3ZlY3RvcnMgPSAxLAoJCQkubXNpXzY0Yml0cyA9IDEsCgkJCS5udW1fbXNp
eF92ZWN0b3JzID0gMCwKCQkJLm1zaXhfcmVnaW9uX3NpemUgPSAweDAsCgkJCS5tc2l4X2FkZHJl
c3MgPSAweDAsCgkJfSwKCQkvKiBQQ0lEZXZpY2U6IDAwOjE3LjAgKi8KCQl7CgkJCS50eXBlID0g
SkFJTEhPVVNFX1BDSV9UWVBFX0RFVklDRSwKCQkJLmlvbW11ID0gMywKCQkJLmRvbWFpbiA9IDB4
MCwKCQkJLmJkZiA9IDB4YjgsCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4ZmZmZmUwMDAsIDB4ZmZm
ZmZmMDAsIDB4ZmZmZmZmZjgsCgkJCQkweGZmZmZmZmZjLCAweGZmZmZmZmUwLCAweGZmZjgwMDAw
LAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDE1LAoJCQkubnVtX2NhcHMgPSAzLAoJCQkubnVtX21z
aV92ZWN0b3JzID0gMSwKCQkJLm1zaV82NGJpdHMgPSAwLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9
IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgwLAoJCQkubXNpeF9hZGRyZXNzID0gMHgwLAoJ
CX0sCgkJLyogUENJRGV2aWNlOiAwMDoxYy4wICovCgkJewoJCQkudHlwZSA9IEpBSUxIT1VTRV9Q
Q0lfVFlQRV9CUklER0UsCgkJCS5pb21tdSA9IDMsCgkJCS5kb21haW4gPSAweDAsCgkJCS5iZGYg
PSAweGUwLAoJCQkuYmFyX21hc2sgPSB7CgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAw
MDAwMDAwLAoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJfSwKCQkJ
LmNhcHNfc3RhcnQgPSAyNCwKCQkJLm51bV9jYXBzID0gNSwKCQkJLm51bV9tc2lfdmVjdG9ycyA9
IDEsCgkJCS5tc2lfNjRiaXRzID0gMCwKCQkJLm51bV9tc2l4X3ZlY3RvcnMgPSAwLAoJCQkubXNp
eF9yZWdpb25fc2l6ZSA9IDB4MCwKCQkJLm1zaXhfYWRkcmVzcyA9IDB4MCwKCQl9LAoJCS8qIFBD
SURldmljZTogMDA6MWMuNCAqLwoJCXsKCQkJLnR5cGUgPSBKQUlMSE9VU0VfUENJX1RZUEVfQlJJ
REdFLAoJCQkuaW9tbXUgPSAzLAoJCQkuZG9tYWluID0gMHgwLAoJCQkuYmRmID0gMHhlNCwKCQkJ
LmJhcl9tYXNrID0gewoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJ
CTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCX0sCgkJCS5jYXBzX3N0YXJ0
ID0gMjksCgkJCS5udW1fY2FwcyA9IDYsCgkJCS5udW1fbXNpX3ZlY3RvcnMgPSAxLAoJCQkubXNp
XzY0Yml0cyA9IDAsCgkJCS5udW1fbXNpeF92ZWN0b3JzID0gMCwKCQkJLm1zaXhfcmVnaW9uX3Np
emUgPSAweDAsCgkJCS5tc2l4X2FkZHJlc3MgPSAweDAsCgkJfSwKCQkvKiBQQ0lEZXZpY2U6IDAw
OjFmLjAgKi8KCQl7CgkJCS50eXBlID0gSkFJTEhPVVNFX1BDSV9UWVBFX0RFVklDRSwKCQkJLmlv
bW11ID0gMywKCQkJLmRvbWFpbiA9IDB4MCwKCQkJLmJkZiA9IDB4ZjgsCgkJCS5iYXJfbWFzayA9
IHsKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCQkweDAwMDAwMDAw
LCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDAsCgkJCS5u
dW1fY2FwcyA9IDAsCgkJCS5udW1fbXNpX3ZlY3RvcnMgPSAwLAoJCQkubXNpXzY0Yml0cyA9IDAs
CgkJCS5udW1fbXNpeF92ZWN0b3JzID0gMCwKCQkJLm1zaXhfcmVnaW9uX3NpemUgPSAweDAsCgkJ
CS5tc2l4X2FkZHJlc3MgPSAweDAsCgkJfSwKCQkvKiBQQ0lEZXZpY2U6IDAwOjFmLjIgKi8KCQl7
CgkJCS50eXBlID0gSkFJTEhPVVNFX1BDSV9UWVBFX0RFVklDRSwKCQkJLmlvbW11ID0gMywKCQkJ
LmRvbWFpbiA9IDB4MCwKCQkJLmJkZiA9IDB4ZmEsCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4ZmZm
ZmMwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAw
LCAweDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDAsCgkJCS5udW1fY2FwcyA9IDAs
CgkJCS5udW1fbXNpX3ZlY3RvcnMgPSAwLAoJCQkubXNpXzY0Yml0cyA9IDAsCgkJCS5udW1fbXNp
eF92ZWN0b3JzID0gMCwKCQkJLm1zaXhfcmVnaW9uX3NpemUgPSAweDAsCgkJCS5tc2l4X2FkZHJl
c3MgPSAweDAsCgkJfSwKCQkvKiBQQ0lEZXZpY2U6IDAwOjFmLjQgKi8KCQl7CgkJCS50eXBlID0g
SkFJTEhPVVNFX1BDSV9UWVBFX0RFVklDRSwKCQkJLmlvbW11ID0gMywKCQkJLmRvbWFpbiA9IDB4
MCwKCQkJLmJkZiA9IDB4ZmMsCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4ZmZmZmZmMDAsIDB4ZmZm
ZmZmZmYsIDB4MDAwMDAwMDAsCgkJCQkweDAwMDAwMDAwLCAweGZmZmZmZmUwLCAweDAwMDAwMDAw
LAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDAsCgkJCS5udW1fY2FwcyA9IDAsCgkJCS5udW1fbXNp
X3ZlY3RvcnMgPSAwLAoJCQkubXNpXzY0Yml0cyA9IDAsCgkJCS5udW1fbXNpeF92ZWN0b3JzID0g
MCwKCQkJLm1zaXhfcmVnaW9uX3NpemUgPSAweDAsCgkJCS5tc2l4X2FkZHJlc3MgPSAweDAsCgkJ
fSwKCQkvKiBQQ0lEZXZpY2U6IDAwOjFmLjUgKi8KCQl7CgkJCS50eXBlID0gSkFJTEhPVVNFX1BD
SV9UWVBFX0RFVklDRSwKCQkJLmlvbW11ID0gMywKCQkJLmRvbWFpbiA9IDB4MCwKCQkJLmJkZiA9
IDB4ZmQsCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4ZmZmZmYwMDAsIDB4MDAwMDAwMDAsIDB4MDAw
MDAwMDAsCgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQku
Y2Fwc19zdGFydCA9IDAsCgkJCS5udW1fY2FwcyA9IDAsCgkJCS5udW1fbXNpX3ZlY3RvcnMgPSAw
LAoJCQkubXNpXzY0Yml0cyA9IDAsCgkJCS5udW1fbXNpeF92ZWN0b3JzID0gMCwKCQkJLm1zaXhf
cmVnaW9uX3NpemUgPSAweDAsCgkJCS5tc2l4X2FkZHJlc3MgPSAweDAsCgkJfSwKCQkvKiBQQ0lE
ZXZpY2U6IDAyOjAwLjAgKi8KCQl7CgkJCS50eXBlID0gSkFJTEhPVVNFX1BDSV9UWVBFX0JSSURH
RSwKCQkJLmlvbW11ID0gMywKCQkJLmRvbWFpbiA9IDB4MCwKCQkJLmJkZiA9IDB4MjAwLAoJCQku
YmFyX21hc2sgPSB7CgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQkJ
MHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJfSwKCQkJLmNhcHNfc3RhcnQg
PSAzNSwKCQkJLm51bV9jYXBzID0gNSwKCQkJLm51bV9tc2lfdmVjdG9ycyA9IDEsCgkJCS5tc2lf
NjRiaXRzID0gMSwKCQkJLm51bV9tc2l4X3ZlY3RvcnMgPSAwLAoJCQkubXNpeF9yZWdpb25fc2l6
ZSA9IDB4MCwKCQkJLm1zaXhfYWRkcmVzcyA9IDB4MCwKCQl9LAoJCS8qIFBDSURldmljZTogMDM6
MDAuMCAqLwoJCXsKCQkJLnR5cGUgPSBKQUlMSE9VU0VfUENJX1RZUEVfREVWSUNFLAoJCQkuaW9t
bXUgPSAzLAoJCQkuZG9tYWluID0gMHgwLAoJCQkuYmRmID0gMHgzMDAsCgkJCS5iYXJfbWFzayA9
IHsKCQkJCTB4ZmYwMDAwMDAsIDB4ZmZmZmMwMDAsIDB4ZmY4MDAwMDAsCgkJCQkweDAwMDAwMDAw
LCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDQwLAoJCQku
bnVtX2NhcHMgPSAxLAoJCQkubnVtX21zaV92ZWN0b3JzID0gMCwKCQkJLm1zaV82NGJpdHMgPSAw
LAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgwLAoJ
CQkubXNpeF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJLyogUENJRGV2aWNlOiAxNjowMi4wICovCgkJ
ewoJCQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9CUklER0UsCgkJCS5pb21tdSA9IDMsCgkJ
CS5kb21haW4gPSAweDAsCgkJCS5iZGYgPSAweDE2MTAsCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4
MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCQkweDAwMDAwMDAwLCAweDAwMDAw
MDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDQxLAoJCQkubnVtX2NhcHMg
PSAxMiwKCQkJLm51bV9tc2lfdmVjdG9ycyA9IDIsCgkJCS5tc2lfNjRiaXRzID0gMCwKCQkJLm51
bV9tc2l4X3ZlY3RvcnMgPSAwLAoJCQkubXNpeF9yZWdpb25fc2l6ZSA9IDB4MCwKCQkJLm1zaXhf
YWRkcmVzcyA9IDB4MCwKCQl9LAoJCS8qIFBDSURldmljZTogMTY6MDUuMCAqLwoJCXsKCQkJLnR5
cGUgPSBKQUlMSE9VU0VfUENJX1RZUEVfREVWSUNFLAoJCQkuaW9tbXUgPSAzLAoJCQkuZG9tYWlu
ID0gMHgwLAoJCQkuYmRmID0gMHgxNjI4LAoJCQkuYmFyX21hc2sgPSB7CgkJCQkweDAwMDAwMDAw
LCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgw
MDAwMDAwMCwKCQkJfSwKCQkJLmNhcHNfc3RhcnQgPSA5LAoJCQkubnVtX2NhcHMgPSAyLAoJCQku
bnVtX21zaV92ZWN0b3JzID0gMCwKCQkJLm1zaV82NGJpdHMgPSAwLAoJCQkubnVtX21zaXhfdmVj
dG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgwLAoJCQkubXNpeF9hZGRyZXNzID0g
MHgwLAoJCX0sCgkJLyogUENJRGV2aWNlOiAxNjowNS4yICovCgkJewoJCQkudHlwZSA9IEpBSUxI
T1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21tdSA9IDMsCgkJCS5kb21haW4gPSAweDAsCgkJ
CS5iZGYgPSAweDE2MmEsCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAw
MDAsIDB4MDAwMDAwMDAsCgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJ
CQl9LAoJCQkuY2Fwc19zdGFydCA9IDksCgkJCS5udW1fY2FwcyA9IDIsCgkJCS5udW1fbXNpX3Zl
Y3RvcnMgPSAwLAoJCQkubXNpXzY0Yml0cyA9IDAsCgkJCS5udW1fbXNpeF92ZWN0b3JzID0gMCwK
CQkJLm1zaXhfcmVnaW9uX3NpemUgPSAweDAsCgkJCS5tc2l4X2FkZHJlc3MgPSAweDAsCgkJfSwK
CQkvKiBQQ0lEZXZpY2U6IDE2OjA1LjQgKi8KCQl7CgkJCS50eXBlID0gSkFJTEhPVVNFX1BDSV9U
WVBFX0RFVklDRSwKCQkJLmlvbW11ID0gMywKCQkJLmRvbWFpbiA9IDB4MCwKCQkJLmJkZiA9IDB4
MTYyYywKCQkJLmJhcl9tYXNrID0gewoJCQkJMHhmZmZmZjAwMCwgMHgwMDAwMDAwMCwgMHgwMDAw
MDAwMCwKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCX0sCgkJCS5j
YXBzX3N0YXJ0ID0gMTEsCgkJCS5udW1fY2FwcyA9IDMsCgkJCS5udW1fbXNpX3ZlY3RvcnMgPSAw
LAoJCQkubXNpXzY0Yml0cyA9IDAsCgkJCS5udW1fbXNpeF92ZWN0b3JzID0gMCwKCQkJLm1zaXhf
cmVnaW9uX3NpemUgPSAweDAsCgkJCS5tc2l4X2FkZHJlc3MgPSAweDAsCgkJfSwKCQkvKiBQQ0lE
ZXZpY2U6IDE2OjA4LjAgKi8KCQl7CgkJCS50eXBlID0gSkFJTEhPVVNFX1BDSV9UWVBFX0RFVklD
RSwKCQkJLmlvbW11ID0gMywKCQkJLmRvbWFpbiA9IDB4MCwKCQkJLmJkZiA9IDB4MTY0MCwKCQkJ
LmJhcl9tYXNrID0gewoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJ
CTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCX0sCgkJCS5jYXBzX3N0YXJ0
ID0gMCwKCQkJLm51bV9jYXBzID0gMCwKCQkJLm51bV9tc2lfdmVjdG9ycyA9IDAsCgkJCS5tc2lf
NjRiaXRzID0gMCwKCQkJLm51bV9tc2l4X3ZlY3RvcnMgPSAwLAoJCQkubXNpeF9yZWdpb25fc2l6
ZSA9IDB4MCwKCQkJLm1zaXhfYWRkcmVzcyA9IDB4MCwKCQl9LAoJCS8qIFBDSURldmljZTogMTY6
MDguMSAqLwoJCXsKCQkJLnR5cGUgPSBKQUlMSE9VU0VfUENJX1RZUEVfREVWSUNFLAoJCQkuaW9t
bXUgPSAzLAoJCQkuZG9tYWluID0gMHgwLAoJCQkuYmRmID0gMHgxNjQxLAoJCQkuYmFyX21hc2sg
PSB7CgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQkJMHgwMDAwMDAw
MCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJfSwKCQkJLmNhcHNfc3RhcnQgPSAwLAoJCQku
bnVtX2NhcHMgPSAwLAoJCQkubnVtX21zaV92ZWN0b3JzID0gMCwKCQkJLm1zaV82NGJpdHMgPSAw
LAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgwLAoJ
CQkubXNpeF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJLyogUENJRGV2aWNlOiAxNjowOC4yICovCgkJ
ewoJCQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21tdSA9IDMsCgkJ
CS5kb21haW4gPSAweDAsCgkJCS5iZGYgPSAweDE2NDIsCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4
MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCQkweDAwMDAwMDAwLCAweDAwMDAw
MDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDAsCgkJCS5udW1fY2FwcyA9
IDAsCgkJCS5udW1fbXNpX3ZlY3RvcnMgPSAwLAoJCQkubXNpXzY0Yml0cyA9IDAsCgkJCS5udW1f
bXNpeF92ZWN0b3JzID0gMCwKCQkJLm1zaXhfcmVnaW9uX3NpemUgPSAweDAsCgkJCS5tc2l4X2Fk
ZHJlc3MgPSAweDAsCgkJfSwKCQkvKiBQQ0lEZXZpY2U6IDE2OjA4LjMgKi8KCQl7CgkJCS50eXBl
ID0gSkFJTEhPVVNFX1BDSV9UWVBFX0RFVklDRSwKCQkJLmlvbW11ID0gMywKCQkJLmRvbWFpbiA9
IDB4MCwKCQkJLmJkZiA9IDB4MTY0MywKCQkJLmJhcl9tYXNrID0gewoJCQkJMHgwMDAwMDAwMCwg
MHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAw
MDAwMDAsCgkJCX0sCgkJCS5jYXBzX3N0YXJ0ID0gMCwKCQkJLm51bV9jYXBzID0gMCwKCQkJLm51
bV9tc2lfdmVjdG9ycyA9IDAsCgkJCS5tc2lfNjRiaXRzID0gMCwKCQkJLm51bV9tc2l4X3ZlY3Rv
cnMgPSAwLAoJCQkubXNpeF9yZWdpb25fc2l6ZSA9IDB4MCwKCQkJLm1zaXhfYWRkcmVzcyA9IDB4
MCwKCQl9LAoJCS8qIFBDSURldmljZTogMTY6MDguNCAqLwoJCXsKCQkJLnR5cGUgPSBKQUlMSE9V
U0VfUENJX1RZUEVfREVWSUNFLAoJCQkuaW9tbXUgPSAzLAoJCQkuZG9tYWluID0gMHgwLAoJCQku
YmRmID0gMHgxNjQ0LAoJCQkuYmFyX21hc2sgPSB7CgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAw
LCAweDAwMDAwMDAwLAoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJ
fSwKCQkJLmNhcHNfc3RhcnQgPSAwLAoJCQkubnVtX2NhcHMgPSAwLAoJCQkubnVtX21zaV92ZWN0
b3JzID0gMCwKCQkJLm1zaV82NGJpdHMgPSAwLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJ
CS5tc2l4X3JlZ2lvbl9zaXplID0gMHgwLAoJCQkubXNpeF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJ
LyogUENJRGV2aWNlOiAxNjowOC41ICovCgkJewoJCQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQ
RV9ERVZJQ0UsCgkJCS5pb21tdSA9IDMsCgkJCS5kb21haW4gPSAweDAsCgkJCS5iZGYgPSAweDE2
NDUsCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAw
MDAsCgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fw
c19zdGFydCA9IDAsCgkJCS5udW1fY2FwcyA9IDAsCgkJCS5udW1fbXNpX3ZlY3RvcnMgPSAwLAoJ
CQkubXNpXzY0Yml0cyA9IDAsCgkJCS5udW1fbXNpeF92ZWN0b3JzID0gMCwKCQkJLm1zaXhfcmVn
aW9uX3NpemUgPSAweDAsCgkJCS5tc2l4X2FkZHJlc3MgPSAweDAsCgkJfSwKCQkvKiBQQ0lEZXZp
Y2U6IDE2OjA4LjYgKi8KCQl7CgkJCS50eXBlID0gSkFJTEhPVVNFX1BDSV9UWVBFX0RFVklDRSwK
CQkJLmlvbW11ID0gMywKCQkJLmRvbWFpbiA9IDB4MCwKCQkJLmJkZiA9IDB4MTY0NiwKCQkJLmJh
cl9tYXNrID0gewoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJCTB4
MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCX0sCgkJCS5jYXBzX3N0YXJ0ID0g
MCwKCQkJLm51bV9jYXBzID0gMCwKCQkJLm51bV9tc2lfdmVjdG9ycyA9IDAsCgkJCS5tc2lfNjRi
aXRzID0gMCwKCQkJLm51bV9tc2l4X3ZlY3RvcnMgPSAwLAoJCQkubXNpeF9yZWdpb25fc2l6ZSA9
IDB4MCwKCQkJLm1zaXhfYWRkcmVzcyA9IDB4MCwKCQl9LAoJCS8qIFBDSURldmljZTogMTY6MDgu
NyAqLwoJCXsKCQkJLnR5cGUgPSBKQUlMSE9VU0VfUENJX1RZUEVfREVWSUNFLAoJCQkuaW9tbXUg
PSAzLAoJCQkuZG9tYWluID0gMHgwLAoJCQkuYmRmID0gMHgxNjQ3LAoJCQkuYmFyX21hc2sgPSB7
CgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQkJMHgwMDAwMDAwMCwg
MHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJfSwKCQkJLmNhcHNfc3RhcnQgPSAwLAoJCQkubnVt
X2NhcHMgPSAwLAoJCQkubnVtX21zaV92ZWN0b3JzID0gMCwKCQkJLm1zaV82NGJpdHMgPSAwLAoJ
CQkubnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgwLAoJCQku
bXNpeF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJLyogUENJRGV2aWNlOiAxNjowOS4wICovCgkJewoJ
CQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21tdSA9IDMsCgkJCS5k
b21haW4gPSAweDAsCgkJCS5iZGYgPSAweDE2NDgsCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4MDAw
MDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAw
LCAweDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDAsCgkJCS5udW1fY2FwcyA9IDAs
CgkJCS5udW1fbXNpX3ZlY3RvcnMgPSAwLAoJCQkubXNpXzY0Yml0cyA9IDAsCgkJCS5udW1fbXNp
eF92ZWN0b3JzID0gMCwKCQkJLm1zaXhfcmVnaW9uX3NpemUgPSAweDAsCgkJCS5tc2l4X2FkZHJl
c3MgPSAweDAsCgkJfSwKCQkvKiBQQ0lEZXZpY2U6IDE2OjA5LjEgKi8KCQl7CgkJCS50eXBlID0g
SkFJTEhPVVNFX1BDSV9UWVBFX0RFVklDRSwKCQkJLmlvbW11ID0gMywKCQkJLmRvbWFpbiA9IDB4
MCwKCQkJLmJkZiA9IDB4MTY0OSwKCQkJLmJhcl9tYXNrID0gewoJCQkJMHgwMDAwMDAwMCwgMHgw
MDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAw
MDAsCgkJCX0sCgkJCS5jYXBzX3N0YXJ0ID0gMCwKCQkJLm51bV9jYXBzID0gMCwKCQkJLm51bV9t
c2lfdmVjdG9ycyA9IDAsCgkJCS5tc2lfNjRiaXRzID0gMCwKCQkJLm51bV9tc2l4X3ZlY3RvcnMg
PSAwLAoJCQkubXNpeF9yZWdpb25fc2l6ZSA9IDB4MCwKCQkJLm1zaXhfYWRkcmVzcyA9IDB4MCwK
CQl9LAoJCS8qIFBDSURldmljZTogMTY6MDkuMiAqLwoJCXsKCQkJLnR5cGUgPSBKQUlMSE9VU0Vf
UENJX1RZUEVfREVWSUNFLAoJCQkuaW9tbXUgPSAzLAoJCQkuZG9tYWluID0gMHgwLAoJCQkuYmRm
ID0gMHgxNjRhLAoJCQkuYmFyX21hc2sgPSB7CgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAw
eDAwMDAwMDAwLAoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJfSwK
CQkJLmNhcHNfc3RhcnQgPSAwLAoJCQkubnVtX2NhcHMgPSAwLAoJCQkubnVtX21zaV92ZWN0b3Jz
ID0gMCwKCQkJLm1zaV82NGJpdHMgPSAwLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJCS5t
c2l4X3JlZ2lvbl9zaXplID0gMHgwLAoJCQkubXNpeF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJLyog
UENJRGV2aWNlOiAxNjowOS4zICovCgkJewoJCQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9E
RVZJQ0UsCgkJCS5pb21tdSA9IDMsCgkJCS5kb21haW4gPSAweDAsCgkJCS5iZGYgPSAweDE2NGIs
CgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAs
CgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19z
dGFydCA9IDAsCgkJCS5udW1fY2FwcyA9IDAsCgkJCS5udW1fbXNpX3ZlY3RvcnMgPSAwLAoJCQku
bXNpXzY0Yml0cyA9IDAsCgkJCS5udW1fbXNpeF92ZWN0b3JzID0gMCwKCQkJLm1zaXhfcmVnaW9u
X3NpemUgPSAweDAsCgkJCS5tc2l4X2FkZHJlc3MgPSAweDAsCgkJfSwKCQkvKiBQQ0lEZXZpY2U6
IDE2OjA5LjQgKi8KCQl7CgkJCS50eXBlID0gSkFJTEhPVVNFX1BDSV9UWVBFX0RFVklDRSwKCQkJ
LmlvbW11ID0gMywKCQkJLmRvbWFpbiA9IDB4MCwKCQkJLmJkZiA9IDB4MTY0YywKCQkJLmJhcl9t
YXNrID0gewoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJCTB4MDAw
MDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCX0sCgkJCS5jYXBzX3N0YXJ0ID0gMCwK
CQkJLm51bV9jYXBzID0gMCwKCQkJLm51bV9tc2lfdmVjdG9ycyA9IDAsCgkJCS5tc2lfNjRiaXRz
ID0gMCwKCQkJLm51bV9tc2l4X3ZlY3RvcnMgPSAwLAoJCQkubXNpeF9yZWdpb25fc2l6ZSA9IDB4
MCwKCQkJLm1zaXhfYWRkcmVzcyA9IDB4MCwKCQl9LAoJCS8qIFBDSURldmljZTogMTY6MDkuNSAq
LwoJCXsKCQkJLnR5cGUgPSBKQUlMSE9VU0VfUENJX1RZUEVfREVWSUNFLAoJCQkuaW9tbXUgPSAz
LAoJCQkuZG9tYWluID0gMHgwLAoJCQkuYmRmID0gMHgxNjRkLAoJCQkuYmFyX21hc2sgPSB7CgkJ
CQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQkJMHgwMDAwMDAwMCwgMHgw
MDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJfSwKCQkJLmNhcHNfc3RhcnQgPSAwLAoJCQkubnVtX2Nh
cHMgPSAwLAoJCQkubnVtX21zaV92ZWN0b3JzID0gMCwKCQkJLm1zaV82NGJpdHMgPSAwLAoJCQku
bnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgwLAoJCQkubXNp
eF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJLyogUENJRGV2aWNlOiAxNjowOS42ICovCgkJewoJCQku
dHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21tdSA9IDMsCgkJCS5kb21h
aW4gPSAweDAsCgkJCS5iZGYgPSAweDE2NGUsCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4MDAwMDAw
MDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAw
eDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDAsCgkJCS5udW1fY2FwcyA9IDAsCgkJ
CS5udW1fbXNpX3ZlY3RvcnMgPSAwLAoJCQkubXNpXzY0Yml0cyA9IDAsCgkJCS5udW1fbXNpeF92
ZWN0b3JzID0gMCwKCQkJLm1zaXhfcmVnaW9uX3NpemUgPSAweDAsCgkJCS5tc2l4X2FkZHJlc3Mg
PSAweDAsCgkJfSwKCQkvKiBQQ0lEZXZpY2U6IDE2OjA5LjcgKi8KCQl7CgkJCS50eXBlID0gSkFJ
TEhPVVNFX1BDSV9UWVBFX0RFVklDRSwKCQkJLmlvbW11ID0gMywKCQkJLmRvbWFpbiA9IDB4MCwK
CQkJLmJkZiA9IDB4MTY0ZiwKCQkJLmJhcl9tYXNrID0gewoJCQkJMHgwMDAwMDAwMCwgMHgwMDAw
MDAwMCwgMHgwMDAwMDAwMCwKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAs
CgkJCX0sCgkJCS5jYXBzX3N0YXJ0ID0gMCwKCQkJLm51bV9jYXBzID0gMCwKCQkJLm51bV9tc2lf
dmVjdG9ycyA9IDAsCgkJCS5tc2lfNjRiaXRzID0gMCwKCQkJLm51bV9tc2l4X3ZlY3RvcnMgPSAw
LAoJCQkubXNpeF9yZWdpb25fc2l6ZSA9IDB4MCwKCQkJLm1zaXhfYWRkcmVzcyA9IDB4MCwKCQl9
LAoJCS8qIFBDSURldmljZTogMTY6MGEuMCAqLwoJCXsKCQkJLnR5cGUgPSBKQUlMSE9VU0VfUENJ
X1RZUEVfREVWSUNFLAoJCQkuaW9tbXUgPSAzLAoJCQkuZG9tYWluID0gMHgwLAoJCQkuYmRmID0g
MHgxNjUwLAoJCQkuYmFyX21hc2sgPSB7CgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAw
MDAwMDAwLAoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJfSwKCQkJ
LmNhcHNfc3RhcnQgPSAwLAoJCQkubnVtX2NhcHMgPSAwLAoJCQkubnVtX21zaV92ZWN0b3JzID0g
MCwKCQkJLm1zaV82NGJpdHMgPSAwLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4
X3JlZ2lvbl9zaXplID0gMHgwLAoJCQkubXNpeF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJLyogUENJ
RGV2aWNlOiAxNjowYS4xICovCgkJewoJCQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJ
Q0UsCgkJCS5pb21tdSA9IDMsCgkJCS5kb21haW4gPSAweDAsCgkJCS5iZGYgPSAweDE2NTEsCgkJ
CS5iYXJfbWFzayA9IHsKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJ
CQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFy
dCA9IDAsCgkJCS5udW1fY2FwcyA9IDAsCgkJCS5udW1fbXNpX3ZlY3RvcnMgPSAwLAoJCQkubXNp
XzY0Yml0cyA9IDAsCgkJCS5udW1fbXNpeF92ZWN0b3JzID0gMCwKCQkJLm1zaXhfcmVnaW9uX3Np
emUgPSAweDAsCgkJCS5tc2l4X2FkZHJlc3MgPSAweDAsCgkJfSwKCQkvKiBQQ0lEZXZpY2U6IDE2
OjBhLjIgKi8KCQl7CgkJCS50eXBlID0gSkFJTEhPVVNFX1BDSV9UWVBFX0RFVklDRSwKCQkJLmlv
bW11ID0gMywKCQkJLmRvbWFpbiA9IDB4MCwKCQkJLmJkZiA9IDB4MTY1MiwKCQkJLmJhcl9tYXNr
ID0gewoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJCTB4MDAwMDAw
MDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCX0sCgkJCS5jYXBzX3N0YXJ0ID0gMCwKCQkJ
Lm51bV9jYXBzID0gMCwKCQkJLm51bV9tc2lfdmVjdG9ycyA9IDAsCgkJCS5tc2lfNjRiaXRzID0g
MCwKCQkJLm51bV9tc2l4X3ZlY3RvcnMgPSAwLAoJCQkubXNpeF9yZWdpb25fc2l6ZSA9IDB4MCwK
CQkJLm1zaXhfYWRkcmVzcyA9IDB4MCwKCQl9LAoJCS8qIFBDSURldmljZTogMTY6MGEuMyAqLwoJ
CXsKCQkJLnR5cGUgPSBKQUlMSE9VU0VfUENJX1RZUEVfREVWSUNFLAoJCQkuaW9tbXUgPSAzLAoJ
CQkuZG9tYWluID0gMHgwLAoJCQkuYmRmID0gMHgxNjUzLAoJCQkuYmFyX21hc2sgPSB7CgkJCQkw
eDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQkJMHgwMDAwMDAwMCwgMHgwMDAw
MDAwMCwgMHgwMDAwMDAwMCwKCQkJfSwKCQkJLmNhcHNfc3RhcnQgPSAwLAoJCQkubnVtX2NhcHMg
PSAwLAoJCQkubnVtX21zaV92ZWN0b3JzID0gMCwKCQkJLm1zaV82NGJpdHMgPSAwLAoJCQkubnVt
X21zaXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgwLAoJCQkubXNpeF9h
ZGRyZXNzID0gMHgwLAoJCX0sCgkJLyogUENJRGV2aWNlOiAxNjowYS40ICovCgkJewoJCQkudHlw
ZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21tdSA9IDMsCgkJCS5kb21haW4g
PSAweDAsCgkJCS5iZGYgPSAweDE2NTQsCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4MDAwMDAwMDAs
IDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAw
MDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDAsCgkJCS5udW1fY2FwcyA9IDAsCgkJCS5u
dW1fbXNpX3ZlY3RvcnMgPSAwLAoJCQkubXNpXzY0Yml0cyA9IDAsCgkJCS5udW1fbXNpeF92ZWN0
b3JzID0gMCwKCQkJLm1zaXhfcmVnaW9uX3NpemUgPSAweDAsCgkJCS5tc2l4X2FkZHJlc3MgPSAw
eDAsCgkJfSwKCQkvKiBQQ0lEZXZpY2U6IDE2OjBhLjUgKi8KCQl7CgkJCS50eXBlID0gSkFJTEhP
VVNFX1BDSV9UWVBFX0RFVklDRSwKCQkJLmlvbW11ID0gMywKCQkJLmRvbWFpbiA9IDB4MCwKCQkJ
LmJkZiA9IDB4MTY1NSwKCQkJLmJhcl9tYXNrID0gewoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAw
MCwgMHgwMDAwMDAwMCwKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJ
CX0sCgkJCS5jYXBzX3N0YXJ0ID0gMCwKCQkJLm51bV9jYXBzID0gMCwKCQkJLm51bV9tc2lfdmVj
dG9ycyA9IDAsCgkJCS5tc2lfNjRiaXRzID0gMCwKCQkJLm51bV9tc2l4X3ZlY3RvcnMgPSAwLAoJ
CQkubXNpeF9yZWdpb25fc2l6ZSA9IDB4MCwKCQkJLm1zaXhfYWRkcmVzcyA9IDB4MCwKCQl9LAoJ
CS8qIFBDSURldmljZTogMTY6MGEuNiAqLwoJCXsKCQkJLnR5cGUgPSBKQUlMSE9VU0VfUENJX1RZ
UEVfREVWSUNFLAoJCQkuaW9tbXUgPSAzLAoJCQkuZG9tYWluID0gMHgwLAoJCQkuYmRmID0gMHgx
NjU2LAoJCQkuYmFyX21hc2sgPSB7CgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAw
MDAwLAoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJfSwKCQkJLmNh
cHNfc3RhcnQgPSAwLAoJCQkubnVtX2NhcHMgPSAwLAoJCQkubnVtX21zaV92ZWN0b3JzID0gMCwK
CQkJLm1zaV82NGJpdHMgPSAwLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4X3Jl
Z2lvbl9zaXplID0gMHgwLAoJCQkubXNpeF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJLyogUENJRGV2
aWNlOiAxNjowYS43ICovCgkJewoJCQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0Us
CgkJCS5pb21tdSA9IDMsCgkJCS5kb21haW4gPSAweDAsCgkJCS5iZGYgPSAweDE2NTcsCgkJCS5i
YXJfbWFzayA9IHsKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCQkw
eDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9
IDAsCgkJCS5udW1fY2FwcyA9IDAsCgkJCS5udW1fbXNpX3ZlY3RvcnMgPSAwLAoJCQkubXNpXzY0
Yml0cyA9IDAsCgkJCS5udW1fbXNpeF92ZWN0b3JzID0gMCwKCQkJLm1zaXhfcmVnaW9uX3NpemUg
PSAweDAsCgkJCS5tc2l4X2FkZHJlc3MgPSAweDAsCgkJfSwKCQkvKiBQQ0lEZXZpY2U6IDE2OjBi
LjAgKi8KCQl7CgkJCS50eXBlID0gSkFJTEhPVVNFX1BDSV9UWVBFX0RFVklDRSwKCQkJLmlvbW11
ID0gMywKCQkJLmRvbWFpbiA9IDB4MCwKCQkJLmJkZiA9IDB4MTY1OCwKCQkJLmJhcl9tYXNrID0g
ewoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJCTB4MDAwMDAwMDAs
IDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCX0sCgkJCS5jYXBzX3N0YXJ0ID0gMCwKCQkJLm51
bV9jYXBzID0gMCwKCQkJLm51bV9tc2lfdmVjdG9ycyA9IDAsCgkJCS5tc2lfNjRiaXRzID0gMCwK
CQkJLm51bV9tc2l4X3ZlY3RvcnMgPSAwLAoJCQkubXNpeF9yZWdpb25fc2l6ZSA9IDB4MCwKCQkJ
Lm1zaXhfYWRkcmVzcyA9IDB4MCwKCQl9LAoJCS8qIFBDSURldmljZTogMTY6MGIuMSAqLwoJCXsK
CQkJLnR5cGUgPSBKQUlMSE9VU0VfUENJX1RZUEVfREVWSUNFLAoJCQkuaW9tbXUgPSAzLAoJCQku
ZG9tYWluID0gMHgwLAoJCQkuYmRmID0gMHgxNjU5LAoJCQkuYmFyX21hc2sgPSB7CgkJCQkweDAw
MDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAw
MCwgMHgwMDAwMDAwMCwKCQkJfSwKCQkJLmNhcHNfc3RhcnQgPSAwLAoJCQkubnVtX2NhcHMgPSAw
LAoJCQkubnVtX21zaV92ZWN0b3JzID0gMCwKCQkJLm1zaV82NGJpdHMgPSAwLAoJCQkubnVtX21z
aXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgwLAoJCQkubXNpeF9hZGRy
ZXNzID0gMHgwLAoJCX0sCgkJLyogUENJRGV2aWNlOiAxNjowYi4yICovCgkJewoJCQkudHlwZSA9
IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21tdSA9IDMsCgkJCS5kb21haW4gPSAw
eDAsCgkJCS5iZGYgPSAweDE2NWEsCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4MDAwMDAwMDAsIDB4
MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAw
MDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDAsCgkJCS5udW1fY2FwcyA9IDAsCgkJCS5udW1f
bXNpX3ZlY3RvcnMgPSAwLAoJCQkubXNpXzY0Yml0cyA9IDAsCgkJCS5udW1fbXNpeF92ZWN0b3Jz
ID0gMCwKCQkJLm1zaXhfcmVnaW9uX3NpemUgPSAweDAsCgkJCS5tc2l4X2FkZHJlc3MgPSAweDAs
CgkJfSwKCQkvKiBQQ0lEZXZpY2U6IDE2OjBiLjMgKi8KCQl7CgkJCS50eXBlID0gSkFJTEhPVVNF
X1BDSV9UWVBFX0RFVklDRSwKCQkJLmlvbW11ID0gMywKCQkJLmRvbWFpbiA9IDB4MCwKCQkJLmJk
ZiA9IDB4MTY1YiwKCQkJLmJhcl9tYXNrID0gewoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwg
MHgwMDAwMDAwMCwKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCX0s
CgkJCS5jYXBzX3N0YXJ0ID0gMCwKCQkJLm51bV9jYXBzID0gMCwKCQkJLm51bV9tc2lfdmVjdG9y
cyA9IDAsCgkJCS5tc2lfNjRiaXRzID0gMCwKCQkJLm51bV9tc2l4X3ZlY3RvcnMgPSAwLAoJCQku
bXNpeF9yZWdpb25fc2l6ZSA9IDB4MCwKCQkJLm1zaXhfYWRkcmVzcyA9IDB4MCwKCQl9LAoJCS8q
IFBDSURldmljZTogMTY6MGUuMCAqLwoJCXsKCQkJLnR5cGUgPSBKQUlMSE9VU0VfUENJX1RZUEVf
REVWSUNFLAoJCQkuaW9tbXUgPSAzLAoJCQkuZG9tYWluID0gMHgwLAoJCQkuYmRmID0gMHgxNjcw
LAoJCQkuYmFyX21hc2sgPSB7CgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAw
LAoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJfSwKCQkJLmNhcHNf
c3RhcnQgPSAwLAoJCQkubnVtX2NhcHMgPSAwLAoJCQkubnVtX21zaV92ZWN0b3JzID0gMCwKCQkJ
Lm1zaV82NGJpdHMgPSAwLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lv
bl9zaXplID0gMHgwLAoJCQkubXNpeF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJLyogUENJRGV2aWNl
OiAxNjowZS4xICovCgkJewoJCQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJ
CS5pb21tdSA9IDMsCgkJCS5kb21haW4gPSAweDAsCgkJCS5iZGYgPSAweDE2NzEsCgkJCS5iYXJf
bWFzayA9IHsKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCQkweDAw
MDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDAs
CgkJCS5udW1fY2FwcyA9IDAsCgkJCS5udW1fbXNpX3ZlY3RvcnMgPSAwLAoJCQkubXNpXzY0Yml0
cyA9IDAsCgkJCS5udW1fbXNpeF92ZWN0b3JzID0gMCwKCQkJLm1zaXhfcmVnaW9uX3NpemUgPSAw
eDAsCgkJCS5tc2l4X2FkZHJlc3MgPSAweDAsCgkJfSwKCQkvKiBQQ0lEZXZpY2U6IDE2OjBlLjIg
Ki8KCQl7CgkJCS50eXBlID0gSkFJTEhPVVNFX1BDSV9UWVBFX0RFVklDRSwKCQkJLmlvbW11ID0g
MywKCQkJLmRvbWFpbiA9IDB4MCwKCQkJLmJkZiA9IDB4MTY3MiwKCQkJLmJhcl9tYXNrID0gewoJ
CQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJCTB4MDAwMDAwMDAsIDB4
MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCX0sCgkJCS5jYXBzX3N0YXJ0ID0gMCwKCQkJLm51bV9j
YXBzID0gMCwKCQkJLm51bV9tc2lfdmVjdG9ycyA9IDAsCgkJCS5tc2lfNjRiaXRzID0gMCwKCQkJ
Lm51bV9tc2l4X3ZlY3RvcnMgPSAwLAoJCQkubXNpeF9yZWdpb25fc2l6ZSA9IDB4MCwKCQkJLm1z
aXhfYWRkcmVzcyA9IDB4MCwKCQl9LAoJCS8qIFBDSURldmljZTogMTY6MGUuMyAqLwoJCXsKCQkJ
LnR5cGUgPSBKQUlMSE9VU0VfUENJX1RZUEVfREVWSUNFLAoJCQkuaW9tbXUgPSAzLAoJCQkuZG9t
YWluID0gMHgwLAoJCQkuYmRmID0gMHgxNjczLAoJCQkuYmFyX21hc2sgPSB7CgkJCQkweDAwMDAw
MDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwg
MHgwMDAwMDAwMCwKCQkJfSwKCQkJLmNhcHNfc3RhcnQgPSAwLAoJCQkubnVtX2NhcHMgPSAwLAoJ
CQkubnVtX21zaV92ZWN0b3JzID0gMCwKCQkJLm1zaV82NGJpdHMgPSAwLAoJCQkubnVtX21zaXhf
dmVjdG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgwLAoJCQkubXNpeF9hZGRyZXNz
ID0gMHgwLAoJCX0sCgkJLyogUENJRGV2aWNlOiAxNjowZS40ICovCgkJewoJCQkudHlwZSA9IEpB
SUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21tdSA9IDMsCgkJCS5kb21haW4gPSAweDAs
CgkJCS5iZGYgPSAweDE2NzQsCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4MDAwMDAwMDAsIDB4MDAw
MDAwMDAsIDB4MDAwMDAwMDAsCgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAw
LAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDAsCgkJCS5udW1fY2FwcyA9IDAsCgkJCS5udW1fbXNp
X3ZlY3RvcnMgPSAwLAoJCQkubXNpXzY0Yml0cyA9IDAsCgkJCS5udW1fbXNpeF92ZWN0b3JzID0g
MCwKCQkJLm1zaXhfcmVnaW9uX3NpemUgPSAweDAsCgkJCS5tc2l4X2FkZHJlc3MgPSAweDAsCgkJ
fSwKCQkvKiBQQ0lEZXZpY2U6IDE2OjBlLjUgKi8KCQl7CgkJCS50eXBlID0gSkFJTEhPVVNFX1BD
SV9UWVBFX0RFVklDRSwKCQkJLmlvbW11ID0gMywKCQkJLmRvbWFpbiA9IDB4MCwKCQkJLmJkZiA9
IDB4MTY3NSwKCQkJLmJhcl9tYXNrID0gewoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgw
MDAwMDAwMCwKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCX0sCgkJ
CS5jYXBzX3N0YXJ0ID0gMCwKCQkJLm51bV9jYXBzID0gMCwKCQkJLm51bV9tc2lfdmVjdG9ycyA9
IDAsCgkJCS5tc2lfNjRiaXRzID0gMCwKCQkJLm51bV9tc2l4X3ZlY3RvcnMgPSAwLAoJCQkubXNp
eF9yZWdpb25fc2l6ZSA9IDB4MCwKCQkJLm1zaXhfYWRkcmVzcyA9IDB4MCwKCQl9LAoJCS8qIFBD
SURldmljZTogMTY6MGUuNiAqLwoJCXsKCQkJLnR5cGUgPSBKQUlMSE9VU0VfUENJX1RZUEVfREVW
SUNFLAoJCQkuaW9tbXUgPSAzLAoJCQkuZG9tYWluID0gMHgwLAoJCQkuYmRmID0gMHgxNjc2LAoJ
CQkuYmFyX21hc2sgPSB7CgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJ
CQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJfSwKCQkJLmNhcHNfc3Rh
cnQgPSAwLAoJCQkubnVtX2NhcHMgPSAwLAoJCQkubnVtX21zaV92ZWN0b3JzID0gMCwKCQkJLm1z
aV82NGJpdHMgPSAwLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9z
aXplID0gMHgwLAoJCQkubXNpeF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJLyogUENJRGV2aWNlOiAx
NjowZS43ICovCgkJewoJCQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5p
b21tdSA9IDMsCgkJCS5kb21haW4gPSAweDAsCgkJCS5iZGYgPSAweDE2NzcsCgkJCS5iYXJfbWFz
ayA9IHsKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCQkweDAwMDAw
MDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDAsCgkJ
CS5udW1fY2FwcyA9IDAsCgkJCS5udW1fbXNpX3ZlY3RvcnMgPSAwLAoJCQkubXNpXzY0Yml0cyA9
IDAsCgkJCS5udW1fbXNpeF92ZWN0b3JzID0gMCwKCQkJLm1zaXhfcmVnaW9uX3NpemUgPSAweDAs
CgkJCS5tc2l4X2FkZHJlc3MgPSAweDAsCgkJfSwKCQkvKiBQQ0lEZXZpY2U6IDE2OjBmLjAgKi8K
CQl7CgkJCS50eXBlID0gSkFJTEhPVVNFX1BDSV9UWVBFX0RFVklDRSwKCQkJLmlvbW11ID0gMywK
CQkJLmRvbWFpbiA9IDB4MCwKCQkJLmJkZiA9IDB4MTY3OCwKCQkJLmJhcl9tYXNrID0gewoJCQkJ
MHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJCTB4MDAwMDAwMDAsIDB4MDAw
MDAwMDAsIDB4MDAwMDAwMDAsCgkJCX0sCgkJCS5jYXBzX3N0YXJ0ID0gMCwKCQkJLm51bV9jYXBz
ID0gMCwKCQkJLm51bV9tc2lfdmVjdG9ycyA9IDAsCgkJCS5tc2lfNjRiaXRzID0gMCwKCQkJLm51
bV9tc2l4X3ZlY3RvcnMgPSAwLAoJCQkubXNpeF9yZWdpb25fc2l6ZSA9IDB4MCwKCQkJLm1zaXhf
YWRkcmVzcyA9IDB4MCwKCQl9LAoJCS8qIFBDSURldmljZTogMTY6MGYuMSAqLwoJCXsKCQkJLnR5
cGUgPSBKQUlMSE9VU0VfUENJX1RZUEVfREVWSUNFLAoJCQkuaW9tbXUgPSAzLAoJCQkuZG9tYWlu
ID0gMHgwLAoJCQkuYmRmID0gMHgxNjc5LAoJCQkuYmFyX21hc2sgPSB7CgkJCQkweDAwMDAwMDAw
LCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgw
MDAwMDAwMCwKCQkJfSwKCQkJLmNhcHNfc3RhcnQgPSAwLAoJCQkubnVtX2NhcHMgPSAwLAoJCQku
bnVtX21zaV92ZWN0b3JzID0gMCwKCQkJLm1zaV82NGJpdHMgPSAwLAoJCQkubnVtX21zaXhfdmVj
dG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgwLAoJCQkubXNpeF9hZGRyZXNzID0g
MHgwLAoJCX0sCgkJLyogUENJRGV2aWNlOiAxNjowZi4yICovCgkJewoJCQkudHlwZSA9IEpBSUxI
T1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21tdSA9IDMsCgkJCS5kb21haW4gPSAweDAsCgkJ
CS5iZGYgPSAweDE2N2EsCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAw
MDAsIDB4MDAwMDAwMDAsCgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJ
CQl9LAoJCQkuY2Fwc19zdGFydCA9IDAsCgkJCS5udW1fY2FwcyA9IDAsCgkJCS5udW1fbXNpX3Zl
Y3RvcnMgPSAwLAoJCQkubXNpXzY0Yml0cyA9IDAsCgkJCS5udW1fbXNpeF92ZWN0b3JzID0gMCwK
CQkJLm1zaXhfcmVnaW9uX3NpemUgPSAweDAsCgkJCS5tc2l4X2FkZHJlc3MgPSAweDAsCgkJfSwK
CQkvKiBQQ0lEZXZpY2U6IDE2OjBmLjMgKi8KCQl7CgkJCS50eXBlID0gSkFJTEhPVVNFX1BDSV9U
WVBFX0RFVklDRSwKCQkJLmlvbW11ID0gMywKCQkJLmRvbWFpbiA9IDB4MCwKCQkJLmJkZiA9IDB4
MTY3YiwKCQkJLmJhcl9tYXNrID0gewoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAw
MDAwMCwKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCX0sCgkJCS5j
YXBzX3N0YXJ0ID0gMCwKCQkJLm51bV9jYXBzID0gMCwKCQkJLm51bV9tc2lfdmVjdG9ycyA9IDAs
CgkJCS5tc2lfNjRiaXRzID0gMCwKCQkJLm51bV9tc2l4X3ZlY3RvcnMgPSAwLAoJCQkubXNpeF9y
ZWdpb25fc2l6ZSA9IDB4MCwKCQkJLm1zaXhfYWRkcmVzcyA9IDB4MCwKCQl9LAoJCS8qIFBDSURl
dmljZTogMTY6MGYuNCAqLwoJCXsKCQkJLnR5cGUgPSBKQUlMSE9VU0VfUENJX1RZUEVfREVWSUNF
LAoJCQkuaW9tbXUgPSAzLAoJCQkuZG9tYWluID0gMHgwLAoJCQkuYmRmID0gMHgxNjdjLAoJCQku
YmFyX21hc2sgPSB7CgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQkJ
MHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJfSwKCQkJLmNhcHNfc3RhcnQg
PSAwLAoJCQkubnVtX2NhcHMgPSAwLAoJCQkubnVtX21zaV92ZWN0b3JzID0gMCwKCQkJLm1zaV82
NGJpdHMgPSAwLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXpl
ID0gMHgwLAoJCQkubXNpeF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJLyogUENJRGV2aWNlOiAxNjow
Zi41ICovCgkJewoJCQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21t
dSA9IDMsCgkJCS5kb21haW4gPSAweDAsCgkJCS5iZGYgPSAweDE2N2QsCgkJCS5iYXJfbWFzayA9
IHsKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCQkweDAwMDAwMDAw
LCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDAsCgkJCS5u
dW1fY2FwcyA9IDAsCgkJCS5udW1fbXNpX3ZlY3RvcnMgPSAwLAoJCQkubXNpXzY0Yml0cyA9IDAs
CgkJCS5udW1fbXNpeF92ZWN0b3JzID0gMCwKCQkJLm1zaXhfcmVnaW9uX3NpemUgPSAweDAsCgkJ
CS5tc2l4X2FkZHJlc3MgPSAweDAsCgkJfSwKCQkvKiBQQ0lEZXZpY2U6IDE2OjBmLjYgKi8KCQl7
CgkJCS50eXBlID0gSkFJTEhPVVNFX1BDSV9UWVBFX0RFVklDRSwKCQkJLmlvbW11ID0gMywKCQkJ
LmRvbWFpbiA9IDB4MCwKCQkJLmJkZiA9IDB4MTY3ZSwKCQkJLmJhcl9tYXNrID0gewoJCQkJMHgw
MDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAw
MDAsIDB4MDAwMDAwMDAsCgkJCX0sCgkJCS5jYXBzX3N0YXJ0ID0gMCwKCQkJLm51bV9jYXBzID0g
MCwKCQkJLm51bV9tc2lfdmVjdG9ycyA9IDAsCgkJCS5tc2lfNjRiaXRzID0gMCwKCQkJLm51bV9t
c2l4X3ZlY3RvcnMgPSAwLAoJCQkubXNpeF9yZWdpb25fc2l6ZSA9IDB4MCwKCQkJLm1zaXhfYWRk
cmVzcyA9IDB4MCwKCQl9LAoJCS8qIFBDSURldmljZTogMTY6MGYuNyAqLwoJCXsKCQkJLnR5cGUg
PSBKQUlMSE9VU0VfUENJX1RZUEVfREVWSUNFLAoJCQkuaW9tbXUgPSAzLAoJCQkuZG9tYWluID0g
MHgwLAoJCQkuYmRmID0gMHgxNjdmLAoJCQkuYmFyX21hc2sgPSB7CgkJCQkweDAwMDAwMDAwLCAw
eDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAw
MDAwMCwKCQkJfSwKCQkJLmNhcHNfc3RhcnQgPSAwLAoJCQkubnVtX2NhcHMgPSAwLAoJCQkubnVt
X21zaV92ZWN0b3JzID0gMCwKCQkJLm1zaV82NGJpdHMgPSAwLAoJCQkubnVtX21zaXhfdmVjdG9y
cyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgwLAoJCQkubXNpeF9hZGRyZXNzID0gMHgw
LAoJCX0sCgkJLyogUENJRGV2aWNlOiAxNjoxMC4wICovCgkJewoJCQkudHlwZSA9IEpBSUxIT1VT
RV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21tdSA9IDMsCgkJCS5kb21haW4gPSAweDAsCgkJCS5i
ZGYgPSAweDE2ODAsCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAs
IDB4MDAwMDAwMDAsCgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQl9
LAoJCQkuY2Fwc19zdGFydCA9IDAsCgkJCS5udW1fY2FwcyA9IDAsCgkJCS5udW1fbXNpX3ZlY3Rv
cnMgPSAwLAoJCQkubXNpXzY0Yml0cyA9IDAsCgkJCS5udW1fbXNpeF92ZWN0b3JzID0gMCwKCQkJ
Lm1zaXhfcmVnaW9uX3NpemUgPSAweDAsCgkJCS5tc2l4X2FkZHJlc3MgPSAweDAsCgkJfSwKCQkv
KiBQQ0lEZXZpY2U6IDE2OjEwLjEgKi8KCQl7CgkJCS50eXBlID0gSkFJTEhPVVNFX1BDSV9UWVBF
X0RFVklDRSwKCQkJLmlvbW11ID0gMywKCQkJLmRvbWFpbiA9IDB4MCwKCQkJLmJkZiA9IDB4MTY4
MSwKCQkJLmJhcl9tYXNrID0gewoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAw
MCwKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCX0sCgkJCS5jYXBz
X3N0YXJ0ID0gMCwKCQkJLm51bV9jYXBzID0gMCwKCQkJLm51bV9tc2lfdmVjdG9ycyA9IDAsCgkJ
CS5tc2lfNjRiaXRzID0gMCwKCQkJLm51bV9tc2l4X3ZlY3RvcnMgPSAwLAoJCQkubXNpeF9yZWdp
b25fc2l6ZSA9IDB4MCwKCQkJLm1zaXhfYWRkcmVzcyA9IDB4MCwKCQl9LAoJCS8qIFBDSURldmlj
ZTogMTY6MTAuMiAqLwoJCXsKCQkJLnR5cGUgPSBKQUlMSE9VU0VfUENJX1RZUEVfREVWSUNFLAoJ
CQkuaW9tbXUgPSAzLAoJCQkuZG9tYWluID0gMHgwLAoJCQkuYmRmID0gMHgxNjgyLAoJCQkuYmFy
X21hc2sgPSB7CgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQkJMHgw
MDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJfSwKCQkJLmNhcHNfc3RhcnQgPSAw
LAoJCQkubnVtX2NhcHMgPSAwLAoJCQkubnVtX21zaV92ZWN0b3JzID0gMCwKCQkJLm1zaV82NGJp
dHMgPSAwLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0g
MHgwLAoJCQkubXNpeF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJLyogUENJRGV2aWNlOiAxNjoxMC4z
ICovCgkJewoJCQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21tdSA9
IDMsCgkJCS5kb21haW4gPSAweDAsCgkJCS5iZGYgPSAweDE2ODMsCgkJCS5iYXJfbWFzayA9IHsK
CQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCQkweDAwMDAwMDAwLCAw
eDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDAsCgkJCS5udW1f
Y2FwcyA9IDAsCgkJCS5udW1fbXNpX3ZlY3RvcnMgPSAwLAoJCQkubXNpXzY0Yml0cyA9IDAsCgkJ
CS5udW1fbXNpeF92ZWN0b3JzID0gMCwKCQkJLm1zaXhfcmVnaW9uX3NpemUgPSAweDAsCgkJCS5t
c2l4X2FkZHJlc3MgPSAweDAsCgkJfSwKCQkvKiBQQ0lEZXZpY2U6IDE2OjEwLjQgKi8KCQl7CgkJ
CS50eXBlID0gSkFJTEhPVVNFX1BDSV9UWVBFX0RFVklDRSwKCQkJLmlvbW11ID0gMywKCQkJLmRv
bWFpbiA9IDB4MCwKCQkJLmJkZiA9IDB4MTY4NCwKCQkJLmJhcl9tYXNrID0gewoJCQkJMHgwMDAw
MDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAs
IDB4MDAwMDAwMDAsCgkJCX0sCgkJCS5jYXBzX3N0YXJ0ID0gMCwKCQkJLm51bV9jYXBzID0gMCwK
CQkJLm51bV9tc2lfdmVjdG9ycyA9IDAsCgkJCS5tc2lfNjRiaXRzID0gMCwKCQkJLm51bV9tc2l4
X3ZlY3RvcnMgPSAwLAoJCQkubXNpeF9yZWdpb25fc2l6ZSA9IDB4MCwKCQkJLm1zaXhfYWRkcmVz
cyA9IDB4MCwKCQl9LAoJCS8qIFBDSURldmljZTogMTY6MTAuNSAqLwoJCXsKCQkJLnR5cGUgPSBK
QUlMSE9VU0VfUENJX1RZUEVfREVWSUNFLAoJCQkuaW9tbXUgPSAzLAoJCQkuZG9tYWluID0gMHgw
LAoJCQkuYmRmID0gMHgxNjg1LAoJCQkuYmFyX21hc2sgPSB7CgkJCQkweDAwMDAwMDAwLCAweDAw
MDAwMDAwLCAweDAwMDAwMDAwLAoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAw
MCwKCQkJfSwKCQkJLmNhcHNfc3RhcnQgPSAwLAoJCQkubnVtX2NhcHMgPSAwLAoJCQkubnVtX21z
aV92ZWN0b3JzID0gMCwKCQkJLm1zaV82NGJpdHMgPSAwLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9
IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgwLAoJCQkubXNpeF9hZGRyZXNzID0gMHgwLAoJ
CX0sCgkJLyogUENJRGV2aWNlOiAxNjoxMC42ICovCgkJewoJCQkudHlwZSA9IEpBSUxIT1VTRV9Q
Q0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21tdSA9IDMsCgkJCS5kb21haW4gPSAweDAsCgkJCS5iZGYg
PSAweDE2ODYsCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4
MDAwMDAwMDAsCgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJ
CQkuY2Fwc19zdGFydCA9IDAsCgkJCS5udW1fY2FwcyA9IDAsCgkJCS5udW1fbXNpX3ZlY3RvcnMg
PSAwLAoJCQkubXNpXzY0Yml0cyA9IDAsCgkJCS5udW1fbXNpeF92ZWN0b3JzID0gMCwKCQkJLm1z
aXhfcmVnaW9uX3NpemUgPSAweDAsCgkJCS5tc2l4X2FkZHJlc3MgPSAweDAsCgkJfSwKCQkvKiBQ
Q0lEZXZpY2U6IDE2OjEwLjcgKi8KCQl7CgkJCS50eXBlID0gSkFJTEhPVVNFX1BDSV9UWVBFX0RF
VklDRSwKCQkJLmlvbW11ID0gMywKCQkJLmRvbWFpbiA9IDB4MCwKCQkJLmJkZiA9IDB4MTY4NywK
CQkJLmJhcl9tYXNrID0gewoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwK
CQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCX0sCgkJCS5jYXBzX3N0
YXJ0ID0gMCwKCQkJLm51bV9jYXBzID0gMCwKCQkJLm51bV9tc2lfdmVjdG9ycyA9IDAsCgkJCS5t
c2lfNjRiaXRzID0gMCwKCQkJLm51bV9tc2l4X3ZlY3RvcnMgPSAwLAoJCQkubXNpeF9yZWdpb25f
c2l6ZSA9IDB4MCwKCQkJLm1zaXhfYWRkcmVzcyA9IDB4MCwKCQl9LAoJCS8qIFBDSURldmljZTog
MTY6MTEuMCAqLwoJCXsKCQkJLnR5cGUgPSBKQUlMSE9VU0VfUENJX1RZUEVfREVWSUNFLAoJCQku
aW9tbXUgPSAzLAoJCQkuZG9tYWluID0gMHgwLAoJCQkuYmRmID0gMHgxNjg4LAoJCQkuYmFyX21h
c2sgPSB7CgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQkJMHgwMDAw
MDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJfSwKCQkJLmNhcHNfc3RhcnQgPSAwLAoJ
CQkubnVtX2NhcHMgPSAwLAoJCQkubnVtX21zaV92ZWN0b3JzID0gMCwKCQkJLm1zaV82NGJpdHMg
PSAwLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgw
LAoJCQkubXNpeF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJLyogUENJRGV2aWNlOiAxNjoxMS4xICov
CgkJewoJCQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21tdSA9IDMs
CgkJCS5kb21haW4gPSAweDAsCgkJCS5iZGYgPSAweDE2ODksCgkJCS5iYXJfbWFzayA9IHsKCQkJ
CTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCQkweDAwMDAwMDAwLCAweDAw
MDAwMDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDAsCgkJCS5udW1fY2Fw
cyA9IDAsCgkJCS5udW1fbXNpX3ZlY3RvcnMgPSAwLAoJCQkubXNpXzY0Yml0cyA9IDAsCgkJCS5u
dW1fbXNpeF92ZWN0b3JzID0gMCwKCQkJLm1zaXhfcmVnaW9uX3NpemUgPSAweDAsCgkJCS5tc2l4
X2FkZHJlc3MgPSAweDAsCgkJfSwKCQkvKiBQQ0lEZXZpY2U6IDE2OjExLjIgKi8KCQl7CgkJCS50
eXBlID0gSkFJTEhPVVNFX1BDSV9UWVBFX0RFVklDRSwKCQkJLmlvbW11ID0gMywKCQkJLmRvbWFp
biA9IDB4MCwKCQkJLmJkZiA9IDB4MTY4YSwKCQkJLmJhcl9tYXNrID0gewoJCQkJMHgwMDAwMDAw
MCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4
MDAwMDAwMDAsCgkJCX0sCgkJCS5jYXBzX3N0YXJ0ID0gMCwKCQkJLm51bV9jYXBzID0gMCwKCQkJ
Lm51bV9tc2lfdmVjdG9ycyA9IDAsCgkJCS5tc2lfNjRiaXRzID0gMCwKCQkJLm51bV9tc2l4X3Zl
Y3RvcnMgPSAwLAoJCQkubXNpeF9yZWdpb25fc2l6ZSA9IDB4MCwKCQkJLm1zaXhfYWRkcmVzcyA9
IDB4MCwKCQl9LAoJCS8qIFBDSURldmljZTogMTY6MTEuMyAqLwoJCXsKCQkJLnR5cGUgPSBKQUlM
SE9VU0VfUENJX1RZUEVfREVWSUNFLAoJCQkuaW9tbXUgPSAzLAoJCQkuZG9tYWluID0gMHgwLAoJ
CQkuYmRmID0gMHgxNjhiLAoJCQkuYmFyX21hc2sgPSB7CgkJCQkweDAwMDAwMDAwLCAweDAwMDAw
MDAwLCAweDAwMDAwMDAwLAoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwK
CQkJfSwKCQkJLmNhcHNfc3RhcnQgPSAwLAoJCQkubnVtX2NhcHMgPSAwLAoJCQkubnVtX21zaV92
ZWN0b3JzID0gMCwKCQkJLm1zaV82NGJpdHMgPSAwLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDAs
CgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgwLAoJCQkubXNpeF9hZGRyZXNzID0gMHgwLAoJCX0s
CgkJLyogUENJRGV2aWNlOiAxNjoxZC4wICovCgkJewoJCQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lf
VFlQRV9ERVZJQ0UsCgkJCS5pb21tdSA9IDMsCgkJCS5kb21haW4gPSAweDAsCgkJCS5iZGYgPSAw
eDE2ZTgsCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAw
MDAwMDAsCgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQku
Y2Fwc19zdGFydCA9IDAsCgkJCS5udW1fY2FwcyA9IDAsCgkJCS5udW1fbXNpX3ZlY3RvcnMgPSAw
LAoJCQkubXNpXzY0Yml0cyA9IDAsCgkJCS5udW1fbXNpeF92ZWN0b3JzID0gMCwKCQkJLm1zaXhf
cmVnaW9uX3NpemUgPSAweDAsCgkJCS5tc2l4X2FkZHJlc3MgPSAweDAsCgkJfSwKCQkvKiBQQ0lE
ZXZpY2U6IDE2OjFkLjEgKi8KCQl7CgkJCS50eXBlID0gSkFJTEhPVVNFX1BDSV9UWVBFX0RFVklD
RSwKCQkJLmlvbW11ID0gMywKCQkJLmRvbWFpbiA9IDB4MCwKCQkJLmJkZiA9IDB4MTZlOSwKCQkJ
LmJhcl9tYXNrID0gewoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJ
CTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCX0sCgkJCS5jYXBzX3N0YXJ0
ID0gMCwKCQkJLm51bV9jYXBzID0gMCwKCQkJLm51bV9tc2lfdmVjdG9ycyA9IDAsCgkJCS5tc2lf
NjRiaXRzID0gMCwKCQkJLm51bV9tc2l4X3ZlY3RvcnMgPSAwLAoJCQkubXNpeF9yZWdpb25fc2l6
ZSA9IDB4MCwKCQkJLm1zaXhfYWRkcmVzcyA9IDB4MCwKCQl9LAoJCS8qIFBDSURldmljZTogMTY6
MWQuMiAqLwoJCXsKCQkJLnR5cGUgPSBKQUlMSE9VU0VfUENJX1RZUEVfREVWSUNFLAoJCQkuaW9t
bXUgPSAzLAoJCQkuZG9tYWluID0gMHgwLAoJCQkuYmRmID0gMHgxNmVhLAoJCQkuYmFyX21hc2sg
PSB7CgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQkJMHgwMDAwMDAw
MCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJfSwKCQkJLmNhcHNfc3RhcnQgPSAwLAoJCQku
bnVtX2NhcHMgPSAwLAoJCQkubnVtX21zaV92ZWN0b3JzID0gMCwKCQkJLm1zaV82NGJpdHMgPSAw
LAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgwLAoJ
CQkubXNpeF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJLyogUENJRGV2aWNlOiAxNjoxZC4zICovCgkJ
ewoJCQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21tdSA9IDMsCgkJ
CS5kb21haW4gPSAweDAsCgkJCS5iZGYgPSAweDE2ZWIsCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4
MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCQkweDAwMDAwMDAwLCAweDAwMDAw
MDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDAsCgkJCS5udW1fY2FwcyA9
IDAsCgkJCS5udW1fbXNpX3ZlY3RvcnMgPSAwLAoJCQkubXNpXzY0Yml0cyA9IDAsCgkJCS5udW1f
bXNpeF92ZWN0b3JzID0gMCwKCQkJLm1zaXhfcmVnaW9uX3NpemUgPSAweDAsCgkJCS5tc2l4X2Fk
ZHJlc3MgPSAweDAsCgkJfSwKCQkvKiBQQ0lEZXZpY2U6IDE2OjFlLjAgKi8KCQl7CgkJCS50eXBl
ID0gSkFJTEhPVVNFX1BDSV9UWVBFX0RFVklDRSwKCQkJLmlvbW11ID0gMywKCQkJLmRvbWFpbiA9
IDB4MCwKCQkJLmJkZiA9IDB4MTZmMCwKCQkJLmJhcl9tYXNrID0gewoJCQkJMHgwMDAwMDAwMCwg
MHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAw
MDAwMDAsCgkJCX0sCgkJCS5jYXBzX3N0YXJ0ID0gMCwKCQkJLm51bV9jYXBzID0gMCwKCQkJLm51
bV9tc2lfdmVjdG9ycyA9IDAsCgkJCS5tc2lfNjRiaXRzID0gMCwKCQkJLm51bV9tc2l4X3ZlY3Rv
cnMgPSAwLAoJCQkubXNpeF9yZWdpb25fc2l6ZSA9IDB4MCwKCQkJLm1zaXhfYWRkcmVzcyA9IDB4
MCwKCQl9LAoJCS8qIFBDSURldmljZTogMTY6MWUuMSAqLwoJCXsKCQkJLnR5cGUgPSBKQUlMSE9V
U0VfUENJX1RZUEVfREVWSUNFLAoJCQkuaW9tbXUgPSAzLAoJCQkuZG9tYWluID0gMHgwLAoJCQku
YmRmID0gMHgxNmYxLAoJCQkuYmFyX21hc2sgPSB7CgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAw
LCAweDAwMDAwMDAwLAoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJ
fSwKCQkJLmNhcHNfc3RhcnQgPSAwLAoJCQkubnVtX2NhcHMgPSAwLAoJCQkubnVtX21zaV92ZWN0
b3JzID0gMCwKCQkJLm1zaV82NGJpdHMgPSAwLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJ
CS5tc2l4X3JlZ2lvbl9zaXplID0gMHgwLAoJCQkubXNpeF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJ
LyogUENJRGV2aWNlOiAxNjoxZS4yICovCgkJewoJCQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQ
RV9ERVZJQ0UsCgkJCS5pb21tdSA9IDMsCgkJCS5kb21haW4gPSAweDAsCgkJCS5iZGYgPSAweDE2
ZjIsCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAw
MDAsCgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fw
c19zdGFydCA9IDAsCgkJCS5udW1fY2FwcyA9IDAsCgkJCS5udW1fbXNpX3ZlY3RvcnMgPSAwLAoJ
CQkubXNpXzY0Yml0cyA9IDAsCgkJCS5udW1fbXNpeF92ZWN0b3JzID0gMCwKCQkJLm1zaXhfcmVn
aW9uX3NpemUgPSAweDAsCgkJCS5tc2l4X2FkZHJlc3MgPSAweDAsCgkJfSwKCQkvKiBQQ0lEZXZp
Y2U6IDE2OjFlLjMgKi8KCQl7CgkJCS50eXBlID0gSkFJTEhPVVNFX1BDSV9UWVBFX0RFVklDRSwK
CQkJLmlvbW11ID0gMywKCQkJLmRvbWFpbiA9IDB4MCwKCQkJLmJkZiA9IDB4MTZmMywKCQkJLmJh
cl9tYXNrID0gewoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJCTB4
MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCX0sCgkJCS5jYXBzX3N0YXJ0ID0g
MCwKCQkJLm51bV9jYXBzID0gMCwKCQkJLm51bV9tc2lfdmVjdG9ycyA9IDAsCgkJCS5tc2lfNjRi
aXRzID0gMCwKCQkJLm51bV9tc2l4X3ZlY3RvcnMgPSAwLAoJCQkubXNpeF9yZWdpb25fc2l6ZSA9
IDB4MCwKCQkJLm1zaXhfYWRkcmVzcyA9IDB4MCwKCQl9LAoJCS8qIFBDSURldmljZTogMTY6MWUu
NCAqLwoJCXsKCQkJLnR5cGUgPSBKQUlMSE9VU0VfUENJX1RZUEVfREVWSUNFLAoJCQkuaW9tbXUg
PSAzLAoJCQkuZG9tYWluID0gMHgwLAoJCQkuYmRmID0gMHgxNmY0LAoJCQkuYmFyX21hc2sgPSB7
CgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQkJMHgwMDAwMDAwMCwg
MHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJfSwKCQkJLmNhcHNfc3RhcnQgPSAwLAoJCQkubnVt
X2NhcHMgPSAwLAoJCQkubnVtX21zaV92ZWN0b3JzID0gMCwKCQkJLm1zaV82NGJpdHMgPSAwLAoJ
CQkubnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgwLAoJCQku
bXNpeF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJLyogUENJRGV2aWNlOiAxNjoxZS41ICovCgkJewoJ
CQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21tdSA9IDMsCgkJCS5k
b21haW4gPSAweDAsCgkJCS5iZGYgPSAweDE2ZjUsCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4MDAw
MDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAw
LCAweDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDAsCgkJCS5udW1fY2FwcyA9IDAs
CgkJCS5udW1fbXNpX3ZlY3RvcnMgPSAwLAoJCQkubXNpXzY0Yml0cyA9IDAsCgkJCS5udW1fbXNp
eF92ZWN0b3JzID0gMCwKCQkJLm1zaXhfcmVnaW9uX3NpemUgPSAweDAsCgkJCS5tc2l4X2FkZHJl
c3MgPSAweDAsCgkJfSwKCQkvKiBQQ0lEZXZpY2U6IDE2OjFlLjYgKi8KCQl7CgkJCS50eXBlID0g
SkFJTEhPVVNFX1BDSV9UWVBFX0RFVklDRSwKCQkJLmlvbW11ID0gMywKCQkJLmRvbWFpbiA9IDB4
MCwKCQkJLmJkZiA9IDB4MTZmNiwKCQkJLmJhcl9tYXNrID0gewoJCQkJMHgwMDAwMDAwMCwgMHgw
MDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAw
MDAsCgkJCX0sCgkJCS5jYXBzX3N0YXJ0ID0gMCwKCQkJLm51bV9jYXBzID0gMCwKCQkJLm51bV9t
c2lfdmVjdG9ycyA9IDAsCgkJCS5tc2lfNjRiaXRzID0gMCwKCQkJLm51bV9tc2l4X3ZlY3RvcnMg
PSAwLAoJCQkubXNpeF9yZWdpb25fc2l6ZSA9IDB4MCwKCQkJLm1zaXhfYWRkcmVzcyA9IDB4MCwK
CQl9LAoJCS8qIFBDSURldmljZTogMTc6MDAuMCAqLwoJCXsKCQkJLnR5cGUgPSBKQUlMSE9VU0Vf
UENJX1RZUEVfREVWSUNFLAoJCQkuaW9tbXUgPSAwLAoJCQkuZG9tYWluID0gMHgwLAoJCQkuYmRm
ID0gMHgxNzAwLAoJCQkuYmFyX21hc2sgPSB7CgkJCQkweGZmZmUwMDAwLCAweGZmZmZmZmZmLCAw
eGZmODAwMDAwLAoJCQkJMHhmZmZmZmZmZiwgMHhmZmZmMDAwMCwgMHhmZmZmZmZmZiwKCQkJfSwK
CQkJLmNhcHNfc3RhcnQgPSA1MywKCQkJLm51bV9jYXBzID0gMTgsCgkJCS5udW1fbXNpX3ZlY3Rv
cnMgPSA4LAoJCQkubXNpXzY0Yml0cyA9IDEsCgkJCS5udW1fbXNpeF92ZWN0b3JzID0gNjUsCgkJ
CS5tc2l4X3JlZ2lvbl9zaXplID0gMHgxMDAwLAoJCQkubXNpeF9hZGRyZXNzID0gMHhhZDBiMDAw
MCwKCQl9LAoJCS8qIFBDSURldmljZTogMTc6MDAuMSAqLwoJCXsKCQkJLnR5cGUgPSBKQUlMSE9V
U0VfUENJX1RZUEVfREVWSUNFLAoJCQkuaW9tbXUgPSAwLAoJCQkuZG9tYWluID0gMHgwLAoJCQku
YmRmID0gMHgxNzAxLAoJCQkuYmFyX21hc2sgPSB7CgkJCQkweGZmZmUwMDAwLCAweGZmZmZmZmZm
LCAweGZmODAwMDAwLAoJCQkJMHhmZmZmZmZmZiwgMHhmZmZmMDAwMCwgMHhmZmZmZmZmZiwKCQkJ
fSwKCQkJLmNhcHNfc3RhcnQgPSA3MSwKCQkJLm51bV9jYXBzID0gMTQsCgkJCS5udW1fbXNpX3Zl
Y3RvcnMgPSA4LAoJCQkubXNpXzY0Yml0cyA9IDEsCgkJCS5udW1fbXNpeF92ZWN0b3JzID0gNjUs
CgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgxMDAwLAoJCQkubXNpeF9hZGRyZXNzID0gMHhhZDBh
MDAwMCwKCQl9LAoJCS8qIFBDSURldmljZTogMTc6MDAuMiAqLwoJCXsKCQkJLnR5cGUgPSBKQUlM
SE9VU0VfUENJX1RZUEVfREVWSUNFLAoJCQkuaW9tbXUgPSAwLAoJCQkuZG9tYWluID0gMHgwLAoJ
CQkuYmRmID0gMHgxNzAyLAoJCQkuYmFyX21hc2sgPSB7CgkJCQkweGZmZmUwMDAwLCAweGZmZmZm
ZmZmLCAweGZmODAwMDAwLAoJCQkJMHhmZmZmZmZmZiwgMHhmZmZmMDAwMCwgMHhmZmZmZmZmZiwK
CQkJfSwKCQkJLmNhcHNfc3RhcnQgPSA3MSwKCQkJLm51bV9jYXBzID0gMTQsCgkJCS5udW1fbXNp
X3ZlY3RvcnMgPSA4LAoJCQkubXNpXzY0Yml0cyA9IDEsCgkJCS5udW1fbXNpeF92ZWN0b3JzID0g
NjUsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgxMDAwLAoJCQkubXNpeF9hZGRyZXNzID0gMHhh
ZDA5MDAwMCwKCQl9LAoJCS8qIFBDSURldmljZTogMTc6MDAuMyAqLwoJCXsKCQkJLnR5cGUgPSBK
QUlMSE9VU0VfUENJX1RZUEVfREVWSUNFLAoJCQkuaW9tbXUgPSAwLAoJCQkuZG9tYWluID0gMHgw
LAoJCQkuYmRmID0gMHgxNzAzLAoJCQkuYmFyX21hc2sgPSB7CgkJCQkweGZmZmUwMDAwLCAweGZm
ZmZmZmZmLCAweGZmODAwMDAwLAoJCQkJMHhmZmZmZmZmZiwgMHhmZmZmMDAwMCwgMHhmZmZmZmZm
ZiwKCQkJfSwKCQkJLmNhcHNfc3RhcnQgPSA3MSwKCQkJLm51bV9jYXBzID0gMTQsCgkJCS5udW1f
bXNpX3ZlY3RvcnMgPSA4LAoJCQkubXNpXzY0Yml0cyA9IDEsCgkJCS5udW1fbXNpeF92ZWN0b3Jz
ID0gNjUsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgxMDAwLAoJCQkubXNpeF9hZGRyZXNzID0g
MHhhZDA4MDAwMCwKCQl9LAoJCS8qIFBDSURldmljZTogNjQ6MDIuMCAqLwoJCXsKCQkJLnR5cGUg
PSBKQUlMSE9VU0VfUENJX1RZUEVfQlJJREdFLAoJCQkuaW9tbXUgPSAzLAoJCQkuZG9tYWluID0g
MHgwLAoJCQkuYmRmID0gMHg2NDEwLAoJCQkuYmFyX21hc2sgPSB7CgkJCQkweDAwMDAwMDAwLCAw
eDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAw
MDAwMCwKCQkJfSwKCQkJLmNhcHNfc3RhcnQgPSA0MSwKCQkJLm51bV9jYXBzID0gMTIsCgkJCS5u
dW1fbXNpX3ZlY3RvcnMgPSAyLAoJCQkubXNpXzY0Yml0cyA9IDAsCgkJCS5udW1fbXNpeF92ZWN0
b3JzID0gMCwKCQkJLm1zaXhfcmVnaW9uX3NpemUgPSAweDAsCgkJCS5tc2l4X2FkZHJlc3MgPSAw
eDAsCgkJfSwKCQkvKiBQQ0lEZXZpY2U6IDY0OjA1LjAgKi8KCQl7CgkJCS50eXBlID0gSkFJTEhP
VVNFX1BDSV9UWVBFX0RFVklDRSwKCQkJLmlvbW11ID0gMywKCQkJLmRvbWFpbiA9IDB4MCwKCQkJ
LmJkZiA9IDB4NjQyOCwKCQkJLmJhcl9tYXNrID0gewoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAw
MCwgMHgwMDAwMDAwMCwKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJ
CX0sCgkJCS5jYXBzX3N0YXJ0ID0gOSwKCQkJLm51bV9jYXBzID0gMiwKCQkJLm51bV9tc2lfdmVj
dG9ycyA9IDAsCgkJCS5tc2lfNjRiaXRzID0gMCwKCQkJLm51bV9tc2l4X3ZlY3RvcnMgPSAwLAoJ
CQkubXNpeF9yZWdpb25fc2l6ZSA9IDB4MCwKCQkJLm1zaXhfYWRkcmVzcyA9IDB4MCwKCQl9LAoJ
CS8qIFBDSURldmljZTogNjQ6MDUuMiAqLwoJCXsKCQkJLnR5cGUgPSBKQUlMSE9VU0VfUENJX1RZ
UEVfREVWSUNFLAoJCQkuaW9tbXUgPSAzLAoJCQkuZG9tYWluID0gMHgwLAoJCQkuYmRmID0gMHg2
NDJhLAoJCQkuYmFyX21hc2sgPSB7CgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAw
MDAwLAoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJfSwKCQkJLmNh
cHNfc3RhcnQgPSA5LAoJCQkubnVtX2NhcHMgPSAyLAoJCQkubnVtX21zaV92ZWN0b3JzID0gMCwK
CQkJLm1zaV82NGJpdHMgPSAwLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4X3Jl
Z2lvbl9zaXplID0gMHgwLAoJCQkubXNpeF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJLyogUENJRGV2
aWNlOiA2NDowNS40ICovCgkJewoJCQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0Us
CgkJCS5pb21tdSA9IDMsCgkJCS5kb21haW4gPSAweDAsCgkJCS5iZGYgPSAweDY0MmMsCgkJCS5i
YXJfbWFzayA9IHsKCQkJCTB4ZmZmZmYwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCQkw
eDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9
IDExLAoJCQkubnVtX2NhcHMgPSAzLAoJCQkubnVtX21zaV92ZWN0b3JzID0gMCwKCQkJLm1zaV82
NGJpdHMgPSAwLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXpl
ID0gMHgwLAoJCQkubXNpeF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJLyogUENJRGV2aWNlOiA2NDow
OC4wICovCgkJewoJCQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21t
dSA9IDMsCgkJCS5kb21haW4gPSAweDAsCgkJCS5iZGYgPSAweDY0NDAsCgkJCS5iYXJfbWFzayA9
IHsKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCQkweDAwMDAwMDAw
LCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDg1LAoJCQku
bnVtX2NhcHMgPSAyLAoJCQkubnVtX21zaV92ZWN0b3JzID0gMCwKCQkJLm1zaV82NGJpdHMgPSAw
LAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgwLAoJ
CQkubXNpeF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJLyogUENJRGV2aWNlOiA2NDowOS4wICovCgkJ
ewoJCQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21tdSA9IDMsCgkJ
CS5kb21haW4gPSAweDAsCgkJCS5iZGYgPSAweDY0NDgsCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4
MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCQkweDAwMDAwMDAwLCAweDAwMDAw
MDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDg1LAoJCQkubnVtX2NhcHMg
PSAyLAoJCQkubnVtX21zaV92ZWN0b3JzID0gMCwKCQkJLm1zaV82NGJpdHMgPSAwLAoJCQkubnVt
X21zaXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgwLAoJCQkubXNpeF9h
ZGRyZXNzID0gMHgwLAoJCX0sCgkJLyogUENJRGV2aWNlOiA2NDowYS4wICovCgkJewoJCQkudHlw
ZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21tdSA9IDMsCgkJCS5kb21haW4g
PSAweDAsCgkJCS5iZGYgPSAweDY0NTAsCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4MDAwMDAwMDAs
IDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAw
MDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDg1LAoJCQkubnVtX2NhcHMgPSAyLAoJCQku
bnVtX21zaV92ZWN0b3JzID0gMCwKCQkJLm1zaV82NGJpdHMgPSAwLAoJCQkubnVtX21zaXhfdmVj
dG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgwLAoJCQkubXNpeF9hZGRyZXNzID0g
MHgwLAoJCX0sCgkJLyogUENJRGV2aWNlOiA2NDowYS4xICovCgkJewoJCQkudHlwZSA9IEpBSUxI
T1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21tdSA9IDMsCgkJCS5kb21haW4gPSAweDAsCgkJ
CS5iZGYgPSAweDY0NTEsCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAw
MDAsIDB4MDAwMDAwMDAsCgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJ
CQl9LAoJCQkuY2Fwc19zdGFydCA9IDg1LAoJCQkubnVtX2NhcHMgPSAyLAoJCQkubnVtX21zaV92
ZWN0b3JzID0gMCwKCQkJLm1zaV82NGJpdHMgPSAwLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDAs
CgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgwLAoJCQkubXNpeF9hZGRyZXNzID0gMHgwLAoJCX0s
CgkJLyogUENJRGV2aWNlOiA2NDowYS4yICovCgkJewoJCQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lf
VFlQRV9ERVZJQ0UsCgkJCS5pb21tdSA9IDMsCgkJCS5kb21haW4gPSAweDAsCgkJCS5iZGYgPSAw
eDY0NTIsCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAw
MDAwMDAsCgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQku
Y2Fwc19zdGFydCA9IDg1LAoJCQkubnVtX2NhcHMgPSAyLAoJCQkubnVtX21zaV92ZWN0b3JzID0g
MCwKCQkJLm1zaV82NGJpdHMgPSAwLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4
X3JlZ2lvbl9zaXplID0gMHgwLAoJCQkubXNpeF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJLyogUENJ
RGV2aWNlOiA2NDowYS4zICovCgkJewoJCQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJ
Q0UsCgkJCS5pb21tdSA9IDMsCgkJCS5kb21haW4gPSAweDAsCgkJCS5iZGYgPSAweDY0NTMsCgkJ
CS5iYXJfbWFzayA9IHsKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJ
CQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFy
dCA9IDg1LAoJCQkubnVtX2NhcHMgPSAyLAoJCQkubnVtX21zaV92ZWN0b3JzID0gMCwKCQkJLm1z
aV82NGJpdHMgPSAwLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9z
aXplID0gMHgwLAoJCQkubXNpeF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJLyogUENJRGV2aWNlOiA2
NDowYS40ICovCgkJewoJCQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5p
b21tdSA9IDMsCgkJCS5kb21haW4gPSAweDAsCgkJCS5iZGYgPSAweDY0NTQsCgkJCS5iYXJfbWFz
ayA9IHsKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCQkweDAwMDAw
MDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDg1LAoJ
CQkubnVtX2NhcHMgPSAyLAoJCQkubnVtX21zaV92ZWN0b3JzID0gMCwKCQkJLm1zaV82NGJpdHMg
PSAwLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgw
LAoJCQkubXNpeF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJLyogUENJRGV2aWNlOiA2NDowYS41ICov
CgkJewoJCQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21tdSA9IDMs
CgkJCS5kb21haW4gPSAweDAsCgkJCS5iZGYgPSAweDY0NTUsCgkJCS5iYXJfbWFzayA9IHsKCQkJ
CTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCQkweDAwMDAwMDAwLCAweDAw
MDAwMDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDg1LAoJCQkubnVtX2Nh
cHMgPSAyLAoJCQkubnVtX21zaV92ZWN0b3JzID0gMCwKCQkJLm1zaV82NGJpdHMgPSAwLAoJCQku
bnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgwLAoJCQkubXNp
eF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJLyogUENJRGV2aWNlOiA2NDowYS42ICovCgkJewoJCQku
dHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21tdSA9IDMsCgkJCS5kb21h
aW4gPSAweDAsCgkJCS5iZGYgPSAweDY0NTYsCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4MDAwMDAw
MDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAw
eDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDg1LAoJCQkubnVtX2NhcHMgPSAyLAoJ
CQkubnVtX21zaV92ZWN0b3JzID0gMCwKCQkJLm1zaV82NGJpdHMgPSAwLAoJCQkubnVtX21zaXhf
dmVjdG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgwLAoJCQkubXNpeF9hZGRyZXNz
ID0gMHgwLAoJCX0sCgkJLyogUENJRGV2aWNlOiA2NDowYS43ICovCgkJewoJCQkudHlwZSA9IEpB
SUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21tdSA9IDMsCgkJCS5kb21haW4gPSAweDAs
CgkJCS5iZGYgPSAweDY0NTcsCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4MDAwMDAwMDAsIDB4MDAw
MDAwMDAsIDB4MDAwMDAwMDAsCgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAw
LAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDg1LAoJCQkubnVtX2NhcHMgPSAyLAoJCQkubnVtX21z
aV92ZWN0b3JzID0gMCwKCQkJLm1zaV82NGJpdHMgPSAwLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9
IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgwLAoJCQkubXNpeF9hZGRyZXNzID0gMHgwLAoJ
CX0sCgkJLyogUENJRGV2aWNlOiA2NDowYi4wICovCgkJewoJCQkudHlwZSA9IEpBSUxIT1VTRV9Q
Q0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21tdSA9IDMsCgkJCS5kb21haW4gPSAweDAsCgkJCS5iZGYg
PSAweDY0NTgsCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4
MDAwMDAwMDAsCgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJ
CQkuY2Fwc19zdGFydCA9IDg1LAoJCQkubnVtX2NhcHMgPSAyLAoJCQkubnVtX21zaV92ZWN0b3Jz
ID0gMCwKCQkJLm1zaV82NGJpdHMgPSAwLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJCS5t
c2l4X3JlZ2lvbl9zaXplID0gMHgwLAoJCQkubXNpeF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJLyog
UENJRGV2aWNlOiA2NDowYi4xICovCgkJewoJCQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9E
RVZJQ0UsCgkJCS5pb21tdSA9IDMsCgkJCS5kb21haW4gPSAweDAsCgkJCS5iZGYgPSAweDY0NTks
CgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAs
CgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19z
dGFydCA9IDg1LAoJCQkubnVtX2NhcHMgPSAyLAoJCQkubnVtX21zaV92ZWN0b3JzID0gMCwKCQkJ
Lm1zaV82NGJpdHMgPSAwLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lv
bl9zaXplID0gMHgwLAoJCQkubXNpeF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJLyogUENJRGV2aWNl
OiA2NDowYi4yICovCgkJewoJCQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJ
CS5pb21tdSA9IDMsCgkJCS5kb21haW4gPSAweDAsCgkJCS5iZGYgPSAweDY0NWEsCgkJCS5iYXJf
bWFzayA9IHsKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCQkweDAw
MDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDg1
LAoJCQkubnVtX2NhcHMgPSAyLAoJCQkubnVtX21zaV92ZWN0b3JzID0gMCwKCQkJLm1zaV82NGJp
dHMgPSAwLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0g
MHgwLAoJCQkubXNpeF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJLyogUENJRGV2aWNlOiA2NDowYi4z
ICovCgkJewoJCQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21tdSA9
IDMsCgkJCS5kb21haW4gPSAweDAsCgkJCS5iZGYgPSAweDY0NWIsCgkJCS5iYXJfbWFzayA9IHsK
CQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCQkweDAwMDAwMDAwLCAw
eDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDg1LAoJCQkubnVt
X2NhcHMgPSAyLAoJCQkubnVtX21zaV92ZWN0b3JzID0gMCwKCQkJLm1zaV82NGJpdHMgPSAwLAoJ
CQkubnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgwLAoJCQku
bXNpeF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJLyogUENJRGV2aWNlOiA2NDowYy4wICovCgkJewoJ
CQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21tdSA9IDMsCgkJCS5k
b21haW4gPSAweDAsCgkJCS5iZGYgPSAweDY0NjAsCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4MDAw
MDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAw
LCAweDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDg1LAoJCQkubnVtX2NhcHMgPSAy
LAoJCQkubnVtX21zaV92ZWN0b3JzID0gMCwKCQkJLm1zaV82NGJpdHMgPSAwLAoJCQkubnVtX21z
aXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgwLAoJCQkubXNpeF9hZGRy
ZXNzID0gMHgwLAoJCX0sCgkJLyogUENJRGV2aWNlOiA2NDowYy4xICovCgkJewoJCQkudHlwZSA9
IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21tdSA9IDMsCgkJCS5kb21haW4gPSAw
eDAsCgkJCS5iZGYgPSAweDY0NjEsCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4MDAwMDAwMDAsIDB4
MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAw
MDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDg1LAoJCQkubnVtX2NhcHMgPSAyLAoJCQkubnVt
X21zaV92ZWN0b3JzID0gMCwKCQkJLm1zaV82NGJpdHMgPSAwLAoJCQkubnVtX21zaXhfdmVjdG9y
cyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgwLAoJCQkubXNpeF9hZGRyZXNzID0gMHgw
LAoJCX0sCgkJLyogUENJRGV2aWNlOiA2NDowYy4yICovCgkJewoJCQkudHlwZSA9IEpBSUxIT1VT
RV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21tdSA9IDMsCgkJCS5kb21haW4gPSAweDAsCgkJCS5i
ZGYgPSAweDY0NjIsCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAs
IDB4MDAwMDAwMDAsCgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQl9
LAoJCQkuY2Fwc19zdGFydCA9IDg1LAoJCQkubnVtX2NhcHMgPSAyLAoJCQkubnVtX21zaV92ZWN0
b3JzID0gMCwKCQkJLm1zaV82NGJpdHMgPSAwLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJ
CS5tc2l4X3JlZ2lvbl9zaXplID0gMHgwLAoJCQkubXNpeF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJ
LyogUENJRGV2aWNlOiA2NDowYy4zICovCgkJewoJCQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQ
RV9ERVZJQ0UsCgkJCS5pb21tdSA9IDMsCgkJCS5kb21haW4gPSAweDAsCgkJCS5iZGYgPSAweDY0
NjMsCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAw
MDAsCgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fw
c19zdGFydCA9IDg1LAoJCQkubnVtX2NhcHMgPSAyLAoJCQkubnVtX21zaV92ZWN0b3JzID0gMCwK
CQkJLm1zaV82NGJpdHMgPSAwLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4X3Jl
Z2lvbl9zaXplID0gMHgwLAoJCQkubXNpeF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJLyogUENJRGV2
aWNlOiA2NDowYy40ICovCgkJewoJCQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0Us
CgkJCS5pb21tdSA9IDMsCgkJCS5kb21haW4gPSAweDAsCgkJCS5iZGYgPSAweDY0NjQsCgkJCS5i
YXJfbWFzayA9IHsKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCQkw
eDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9
IDg1LAoJCQkubnVtX2NhcHMgPSAyLAoJCQkubnVtX21zaV92ZWN0b3JzID0gMCwKCQkJLm1zaV82
NGJpdHMgPSAwLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXpl
ID0gMHgwLAoJCQkubXNpeF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJLyogUENJRGV2aWNlOiA2NDow
Yy41ICovCgkJewoJCQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21t
dSA9IDMsCgkJCS5kb21haW4gPSAweDAsCgkJCS5iZGYgPSAweDY0NjUsCgkJCS5iYXJfbWFzayA9
IHsKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCQkweDAwMDAwMDAw
LCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDg1LAoJCQku
bnVtX2NhcHMgPSAyLAoJCQkubnVtX21zaV92ZWN0b3JzID0gMCwKCQkJLm1zaV82NGJpdHMgPSAw
LAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgwLAoJ
CQkubXNpeF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJLyogUENJRGV2aWNlOiA2NDowYy42ICovCgkJ
ewoJCQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21tdSA9IDMsCgkJ
CS5kb21haW4gPSAweDAsCgkJCS5iZGYgPSAweDY0NjYsCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4
MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCQkweDAwMDAwMDAwLCAweDAwMDAw
MDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDg1LAoJCQkubnVtX2NhcHMg
PSAyLAoJCQkubnVtX21zaV92ZWN0b3JzID0gMCwKCQkJLm1zaV82NGJpdHMgPSAwLAoJCQkubnVt
X21zaXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgwLAoJCQkubXNpeF9h
ZGRyZXNzID0gMHgwLAoJCX0sCgkJLyogUENJRGV2aWNlOiA2NDowYy43ICovCgkJewoJCQkudHlw
ZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21tdSA9IDMsCgkJCS5kb21haW4g
PSAweDAsCgkJCS5iZGYgPSAweDY0NjcsCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4MDAwMDAwMDAs
IDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAw
MDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDg1LAoJCQkubnVtX2NhcHMgPSAyLAoJCQku
bnVtX21zaV92ZWN0b3JzID0gMCwKCQkJLm1zaV82NGJpdHMgPSAwLAoJCQkubnVtX21zaXhfdmVj
dG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgwLAoJCQkubXNpeF9hZGRyZXNzID0g
MHgwLAoJCX0sCgkJLyogUENJRGV2aWNlOiA2NDowZC4wICovCgkJewoJCQkudHlwZSA9IEpBSUxI
T1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21tdSA9IDMsCgkJCS5kb21haW4gPSAweDAsCgkJ
CS5iZGYgPSAweDY0NjgsCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAw
MDAsIDB4MDAwMDAwMDAsCgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJ
CQl9LAoJCQkuY2Fwc19zdGFydCA9IDg1LAoJCQkubnVtX2NhcHMgPSAyLAoJCQkubnVtX21zaV92
ZWN0b3JzID0gMCwKCQkJLm1zaV82NGJpdHMgPSAwLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDAs
CgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgwLAoJCQkubXNpeF9hZGRyZXNzID0gMHgwLAoJCX0s
CgkJLyogUENJRGV2aWNlOiA2NDowZC4xICovCgkJewoJCQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lf
VFlQRV9ERVZJQ0UsCgkJCS5pb21tdSA9IDMsCgkJCS5kb21haW4gPSAweDAsCgkJCS5iZGYgPSAw
eDY0NjksCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAw
MDAwMDAsCgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQku
Y2Fwc19zdGFydCA9IDg1LAoJCQkubnVtX2NhcHMgPSAyLAoJCQkubnVtX21zaV92ZWN0b3JzID0g
MCwKCQkJLm1zaV82NGJpdHMgPSAwLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4
X3JlZ2lvbl9zaXplID0gMHgwLAoJCQkubXNpeF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJLyogUENJ
RGV2aWNlOiA2NDowZC4yICovCgkJewoJCQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJ
Q0UsCgkJCS5pb21tdSA9IDMsCgkJCS5kb21haW4gPSAweDAsCgkJCS5iZGYgPSAweDY0NmEsCgkJ
CS5iYXJfbWFzayA9IHsKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJ
CQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFy
dCA9IDg1LAoJCQkubnVtX2NhcHMgPSAyLAoJCQkubnVtX21zaV92ZWN0b3JzID0gMCwKCQkJLm1z
aV82NGJpdHMgPSAwLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9z
aXplID0gMHgwLAoJCQkubXNpeF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJLyogUENJRGV2aWNlOiA2
NDowZC4zICovCgkJewoJCQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5p
b21tdSA9IDMsCgkJCS5kb21haW4gPSAweDAsCgkJCS5iZGYgPSAweDY0NmIsCgkJCS5iYXJfbWFz
ayA9IHsKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCQkweDAwMDAw
MDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDg1LAoJ
CQkubnVtX2NhcHMgPSAyLAoJCQkubnVtX21zaV92ZWN0b3JzID0gMCwKCQkJLm1zaV82NGJpdHMg
PSAwLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgw
LAoJCQkubXNpeF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJLyogUENJRGV2aWNlOiA2NTowMC4wICov
CgkJewoJCQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21tdSA9IDEs
CgkJCS5kb21haW4gPSAweDAsCgkJCS5iZGYgPSAweDY1MDAsCgkJCS5iYXJfbWFzayA9IHsKCQkJ
CTB4ZmZmZmZmMDAsIDB4ZmZmZjAwMDAsIDB4ZmZmZmZmZmYsCgkJCQkweGZmZjAwMDAwLCAweGZm
ZmZmZmZmLCAweDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDg3LAoJCQkubnVtX2Nh
cHMgPSA4LAoJCQkubnVtX21zaV92ZWN0b3JzID0gMSwKCQkJLm1zaV82NGJpdHMgPSAxLAoJCQku
bnVtX21zaXhfdmVjdG9ycyA9IDk3LAoJCQkubXNpeF9yZWdpb25fc2l6ZSA9IDB4MTAwMCwKCQkJ
Lm1zaXhfYWRkcmVzcyA9IDB4YzYxMGUwMDAsCgkJfSwKCQkvKiBQQ0lEZXZpY2U6IGIyOjAwLjAg
Ki8KCQl7CgkJCS50eXBlID0gSkFJTEhPVVNFX1BDSV9UWVBFX0JSSURHRSwKCQkJLmlvbW11ID0g
MywKCQkJLmRvbWFpbiA9IDB4MCwKCQkJLmJkZiA9IDB4YjIwMCwKCQkJLmJhcl9tYXNrID0gewoJ
CQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJCTB4MDAwMDAwMDAsIDB4
MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCX0sCgkJCS5jYXBzX3N0YXJ0ID0gNDEsCgkJCS5udW1f
Y2FwcyA9IDEyLAoJCQkubnVtX21zaV92ZWN0b3JzID0gMiwKCQkJLm1zaV82NGJpdHMgPSAwLAoJ
CQkubnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgwLAoJCQku
bXNpeF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJLyogUENJRGV2aWNlOiBiMjowNS4wICovCgkJewoJ
CQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21tdSA9IDMsCgkJCS5k
b21haW4gPSAweDAsCgkJCS5iZGYgPSAweGIyMjgsCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4MDAw
MDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAw
LCAweDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDksCgkJCS5udW1fY2FwcyA9IDIs
CgkJCS5udW1fbXNpX3ZlY3RvcnMgPSAwLAoJCQkubXNpXzY0Yml0cyA9IDAsCgkJCS5udW1fbXNp
eF92ZWN0b3JzID0gMCwKCQkJLm1zaXhfcmVnaW9uX3NpemUgPSAweDAsCgkJCS5tc2l4X2FkZHJl
c3MgPSAweDAsCgkJfSwKCQkvKiBQQ0lEZXZpY2U6IGIyOjA1LjIgKi8KCQl7CgkJCS50eXBlID0g
SkFJTEhPVVNFX1BDSV9UWVBFX0RFVklDRSwKCQkJLmlvbW11ID0gMywKCQkJLmRvbWFpbiA9IDB4
MCwKCQkJLmJkZiA9IDB4YjIyYSwKCQkJLmJhcl9tYXNrID0gewoJCQkJMHgwMDAwMDAwMCwgMHgw
MDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAw
MDAsCgkJCX0sCgkJCS5jYXBzX3N0YXJ0ID0gOSwKCQkJLm51bV9jYXBzID0gMiwKCQkJLm51bV9t
c2lfdmVjdG9ycyA9IDAsCgkJCS5tc2lfNjRiaXRzID0gMCwKCQkJLm51bV9tc2l4X3ZlY3RvcnMg
PSAwLAoJCQkubXNpeF9yZWdpb25fc2l6ZSA9IDB4MCwKCQkJLm1zaXhfYWRkcmVzcyA9IDB4MCwK
CQl9LAoJCS8qIFBDSURldmljZTogYjI6MDUuNCAqLwoJCXsKCQkJLnR5cGUgPSBKQUlMSE9VU0Vf
UENJX1RZUEVfREVWSUNFLAoJCQkuaW9tbXUgPSAzLAoJCQkuZG9tYWluID0gMHgwLAoJCQkuYmRm
ID0gMHhiMjJjLAoJCQkuYmFyX21hc2sgPSB7CgkJCQkweGZmZmZmMDAwLCAweDAwMDAwMDAwLCAw
eDAwMDAwMDAwLAoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJfSwK
CQkJLmNhcHNfc3RhcnQgPSAxMSwKCQkJLm51bV9jYXBzID0gMywKCQkJLm51bV9tc2lfdmVjdG9y
cyA9IDAsCgkJCS5tc2lfNjRiaXRzID0gMCwKCQkJLm51bV9tc2l4X3ZlY3RvcnMgPSAwLAoJCQku
bXNpeF9yZWdpb25fc2l6ZSA9IDB4MCwKCQkJLm1zaXhfYWRkcmVzcyA9IDB4MCwKCQl9LAoJCS8q
IFBDSURldmljZTogYjI6MGUuMCAqLwoJCXsKCQkJLnR5cGUgPSBKQUlMSE9VU0VfUENJX1RZUEVf
REVWSUNFLAoJCQkuaW9tbXUgPSAzLAoJCQkuZG9tYWluID0gMHgwLAoJCQkuYmRmID0gMHhiMjcw
LAoJCQkuYmFyX21hc2sgPSB7CgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAw
LAoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJfSwKCQkJLmNhcHNf
c3RhcnQgPSA5LAoJCQkubnVtX2NhcHMgPSAyLAoJCQkubnVtX21zaV92ZWN0b3JzID0gMCwKCQkJ
Lm1zaV82NGJpdHMgPSAwLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lv
bl9zaXplID0gMHgwLAoJCQkubXNpeF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJLyogUENJRGV2aWNl
OiBiMjowZS4xICovCgkJewoJCQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJ
CS5pb21tdSA9IDMsCgkJCS5kb21haW4gPSAweDAsCgkJCS5iZGYgPSAweGIyNzEsCgkJCS5iYXJf
bWFzayA9IHsKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCQkweDAw
MDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDk1
LAoJCQkubnVtX2NhcHMgPSAyLAoJCQkubnVtX21zaV92ZWN0b3JzID0gMCwKCQkJLm1zaV82NGJp
dHMgPSAwLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0g
MHgwLAoJCQkubXNpeF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJLyogUENJRGV2aWNlOiBiMjowZi4w
ICovCgkJewoJCQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21tdSA9
IDMsCgkJCS5kb21haW4gPSAweDAsCgkJCS5iZGYgPSAweGIyNzgsCgkJCS5iYXJfbWFzayA9IHsK
CQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCQkweDAwMDAwMDAwLCAw
eDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDksCgkJCS5udW1f
Y2FwcyA9IDIsCgkJCS5udW1fbXNpX3ZlY3RvcnMgPSAwLAoJCQkubXNpXzY0Yml0cyA9IDAsCgkJ
CS5udW1fbXNpeF92ZWN0b3JzID0gMCwKCQkJLm1zaXhfcmVnaW9uX3NpemUgPSAweDAsCgkJCS5t
c2l4X2FkZHJlc3MgPSAweDAsCgkJfSwKCQkvKiBQQ0lEZXZpY2U6IGIyOjBmLjEgKi8KCQl7CgkJ
CS50eXBlID0gSkFJTEhPVVNFX1BDSV9UWVBFX0RFVklDRSwKCQkJLmlvbW11ID0gMywKCQkJLmRv
bWFpbiA9IDB4MCwKCQkJLmJkZiA9IDB4YjI3OSwKCQkJLmJhcl9tYXNrID0gewoJCQkJMHgwMDAw
MDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAs
IDB4MDAwMDAwMDAsCgkJCX0sCgkJCS5jYXBzX3N0YXJ0ID0gOTUsCgkJCS5udW1fY2FwcyA9IDIs
CgkJCS5udW1fbXNpX3ZlY3RvcnMgPSAwLAoJCQkubXNpXzY0Yml0cyA9IDAsCgkJCS5udW1fbXNp
eF92ZWN0b3JzID0gMCwKCQkJLm1zaXhfcmVnaW9uX3NpemUgPSAweDAsCgkJCS5tc2l4X2FkZHJl
c3MgPSAweDAsCgkJfSwKCQkvKiBQQ0lEZXZpY2U6IGIyOjEwLjAgKi8KCQl7CgkJCS50eXBlID0g
SkFJTEhPVVNFX1BDSV9UWVBFX0RFVklDRSwKCQkJLmlvbW11ID0gMywKCQkJLmRvbWFpbiA9IDB4
MCwKCQkJLmJkZiA9IDB4YjI4MCwKCQkJLmJhcl9tYXNrID0gewoJCQkJMHgwMDAwMDAwMCwgMHgw
MDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAw
MDAsCgkJCX0sCgkJCS5jYXBzX3N0YXJ0ID0gOSwKCQkJLm51bV9jYXBzID0gMiwKCQkJLm51bV9t
c2lfdmVjdG9ycyA9IDAsCgkJCS5tc2lfNjRiaXRzID0gMCwKCQkJLm51bV9tc2l4X3ZlY3RvcnMg
PSAwLAoJCQkubXNpeF9yZWdpb25fc2l6ZSA9IDB4MCwKCQkJLm1zaXhfYWRkcmVzcyA9IDB4MCwK
CQl9LAoJCS8qIFBDSURldmljZTogYjI6MTAuMSAqLwoJCXsKCQkJLnR5cGUgPSBKQUlMSE9VU0Vf
UENJX1RZUEVfREVWSUNFLAoJCQkuaW9tbXUgPSAzLAoJCQkuZG9tYWluID0gMHgwLAoJCQkuYmRm
ID0gMHhiMjgxLAoJCQkuYmFyX21hc2sgPSB7CgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAw
eDAwMDAwMDAwLAoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJfSwK
CQkJLmNhcHNfc3RhcnQgPSA5NSwKCQkJLm51bV9jYXBzID0gMiwKCQkJLm51bV9tc2lfdmVjdG9y
cyA9IDAsCgkJCS5tc2lfNjRiaXRzID0gMCwKCQkJLm51bV9tc2l4X3ZlY3RvcnMgPSAwLAoJCQku
bXNpeF9yZWdpb25fc2l6ZSA9IDB4MCwKCQkJLm1zaXhfYWRkcmVzcyA9IDB4MCwKCQl9LAoJCS8q
IFBDSURldmljZTogYjI6MTIuMCAqLwoJCXsKCQkJLnR5cGUgPSBKQUlMSE9VU0VfUENJX1RZUEVf
REVWSUNFLAoJCQkuaW9tbXUgPSAzLAoJCQkuZG9tYWluID0gMHgwLAoJCQkuYmRmID0gMHhiMjkw
LAoJCQkuYmFyX21hc2sgPSB7CgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAw
LAoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJfSwKCQkJLmNhcHNf
c3RhcnQgPSA5LAoJCQkubnVtX2NhcHMgPSAyLAoJCQkubnVtX21zaV92ZWN0b3JzID0gMCwKCQkJ
Lm1zaV82NGJpdHMgPSAwLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lv
bl9zaXplID0gMHgwLAoJCQkubXNpeF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJLyogUENJRGV2aWNl
OiBiMjoxMi4xICovCgkJewoJCQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJ
CS5pb21tdSA9IDMsCgkJCS5kb21haW4gPSAweDAsCgkJCS5iZGYgPSAweGIyOTEsCgkJCS5iYXJf
bWFzayA9IHsKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCQkweDAw
MDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDAs
CgkJCS5udW1fY2FwcyA9IDAsCgkJCS5udW1fbXNpX3ZlY3RvcnMgPSAwLAoJCQkubXNpXzY0Yml0
cyA9IDAsCgkJCS5udW1fbXNpeF92ZWN0b3JzID0gMCwKCQkJLm1zaXhfcmVnaW9uX3NpemUgPSAw
eDAsCgkJCS5tc2l4X2FkZHJlc3MgPSAweDAsCgkJfSwKCQkvKiBQQ0lEZXZpY2U6IGIyOjEyLjIg
Ki8KCQl7CgkJCS50eXBlID0gSkFJTEhPVVNFX1BDSV9UWVBFX0RFVklDRSwKCQkJLmlvbW11ID0g
MywKCQkJLmRvbWFpbiA9IDB4MCwKCQkJLmJkZiA9IDB4YjI5MiwKCQkJLmJhcl9tYXNrID0gewoJ
CQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJCTB4MDAwMDAwMDAsIDB4
MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCX0sCgkJCS5jYXBzX3N0YXJ0ID0gMCwKCQkJLm51bV9j
YXBzID0gMCwKCQkJLm51bV9tc2lfdmVjdG9ycyA9IDAsCgkJCS5tc2lfNjRiaXRzID0gMCwKCQkJ
Lm51bV9tc2l4X3ZlY3RvcnMgPSAwLAoJCQkubXNpeF9yZWdpb25fc2l6ZSA9IDB4MCwKCQkJLm1z
aXhfYWRkcmVzcyA9IDB4MCwKCQl9LAoJCS8qIFBDSURldmljZTogYjI6MTIuNCAqLwoJCXsKCQkJ
LnR5cGUgPSBKQUlMSE9VU0VfUENJX1RZUEVfREVWSUNFLAoJCQkuaW9tbXUgPSAzLAoJCQkuZG9t
YWluID0gMHgwLAoJCQkuYmRmID0gMHhiMjk0LAoJCQkuYmFyX21hc2sgPSB7CgkJCQkweDAwMDAw
MDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwg
MHgwMDAwMDAwMCwKCQkJfSwKCQkJLmNhcHNfc3RhcnQgPSA5LAoJCQkubnVtX2NhcHMgPSAyLAoJ
CQkubnVtX21zaV92ZWN0b3JzID0gMCwKCQkJLm1zaV82NGJpdHMgPSAwLAoJCQkubnVtX21zaXhf
dmVjdG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9zaXplID0gMHgwLAoJCQkubXNpeF9hZGRyZXNz
ID0gMHgwLAoJCX0sCgkJLyogUENJRGV2aWNlOiBiMjoxMi41ICovCgkJewoJCQkudHlwZSA9IEpB
SUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21tdSA9IDMsCgkJCS5kb21haW4gPSAweDAs
CgkJCS5iZGYgPSAweGIyOTUsCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4MDAwMDAwMDAsIDB4MDAw
MDAwMDAsIDB4MDAwMDAwMDAsCgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAw
LAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDAsCgkJCS5udW1fY2FwcyA9IDAsCgkJCS5udW1fbXNp
X3ZlY3RvcnMgPSAwLAoJCQkubXNpXzY0Yml0cyA9IDAsCgkJCS5udW1fbXNpeF92ZWN0b3JzID0g
MCwKCQkJLm1zaXhfcmVnaW9uX3NpemUgPSAweDAsCgkJCS5tc2l4X2FkZHJlc3MgPSAweDAsCgkJ
fSwKCQkvKiBQQ0lEZXZpY2U6IGIyOjE1LjAgKi8KCQl7CgkJCS50eXBlID0gSkFJTEhPVVNFX1BD
SV9UWVBFX0RFVklDRSwKCQkJLmlvbW11ID0gMywKCQkJLmRvbWFpbiA9IDB4MCwKCQkJLmJkZiA9
IDB4YjJhOCwKCQkJLmJhcl9tYXNrID0gewoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgw
MDAwMDAwMCwKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCX0sCgkJ
CS5jYXBzX3N0YXJ0ID0gMCwKCQkJLm51bV9jYXBzID0gMCwKCQkJLm51bV9tc2lfdmVjdG9ycyA9
IDAsCgkJCS5tc2lfNjRiaXRzID0gMCwKCQkJLm51bV9tc2l4X3ZlY3RvcnMgPSAwLAoJCQkubXNp
eF9yZWdpb25fc2l6ZSA9IDB4MCwKCQkJLm1zaXhfYWRkcmVzcyA9IDB4MCwKCQl9LAoJCS8qIFBD
SURldmljZTogYjI6MTYuMCAqLwoJCXsKCQkJLnR5cGUgPSBKQUlMSE9VU0VfUENJX1RZUEVfREVW
SUNFLAoJCQkuaW9tbXUgPSAzLAoJCQkuZG9tYWluID0gMHgwLAoJCQkuYmRmID0gMHhiMmIwLAoJ
CQkuYmFyX21hc2sgPSB7CgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJ
CQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJfSwKCQkJLmNhcHNfc3Rh
cnQgPSAwLAoJCQkubnVtX2NhcHMgPSAwLAoJCQkubnVtX21zaV92ZWN0b3JzID0gMCwKCQkJLm1z
aV82NGJpdHMgPSAwLAoJCQkubnVtX21zaXhfdmVjdG9ycyA9IDAsCgkJCS5tc2l4X3JlZ2lvbl9z
aXplID0gMHgwLAoJCQkubXNpeF9hZGRyZXNzID0gMHgwLAoJCX0sCgkJLyogUENJRGV2aWNlOiBi
MjoxNi40ICovCgkJewoJCQkudHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5p
b21tdSA9IDMsCgkJCS5kb21haW4gPSAweDAsCgkJCS5iZGYgPSAweGIyYjQsCgkJCS5iYXJfbWFz
ayA9IHsKCQkJCTB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsIDB4MDAwMDAwMDAsCgkJCQkweDAwMDAw
MDAwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDAsCgkJ
CS5udW1fY2FwcyA9IDAsCgkJCS5udW1fbXNpX3ZlY3RvcnMgPSAwLAoJCQkubXNpXzY0Yml0cyA9
IDAsCgkJCS5udW1fbXNpeF92ZWN0b3JzID0gMCwKCQkJLm1zaXhfcmVnaW9uX3NpemUgPSAweDAs
CgkJCS5tc2l4X2FkZHJlc3MgPSAweDAsCgkJfSwKCQkvKiBQQ0lEZXZpY2U6IGIyOjE3LjAgKi8K
CQl7CgkJCS50eXBlID0gSkFJTEhPVVNFX1BDSV9UWVBFX0RFVklDRSwKCQkJLmlvbW11ID0gMywK
CQkJLmRvbWFpbiA9IDB4MCwKCQkJLmJkZiA9IDB4YjJiOCwKCQkJLmJhcl9tYXNrID0gewoJCQkJ
MHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwKCQkJCTB4MDAwMDAwMDAsIDB4MDAw
MDAwMDAsIDB4MDAwMDAwMDAsCgkJCX0sCgkJCS5jYXBzX3N0YXJ0ID0gMCwKCQkJLm51bV9jYXBz
ID0gMCwKCQkJLm51bV9tc2lfdmVjdG9ycyA9IDAsCgkJCS5tc2lfNjRiaXRzID0gMCwKCQkJLm51
bV9tc2l4X3ZlY3RvcnMgPSAwLAoJCQkubXNpeF9yZWdpb25fc2l6ZSA9IDB4MCwKCQkJLm1zaXhf
YWRkcmVzcyA9IDB4MCwKCQl9LAoJCS8qIFBDSURldmljZTogYjM6MDAuMCAqLwoJCXsKCQkJLnR5
cGUgPSBKQUlMSE9VU0VfUENJX1RZUEVfREVWSUNFLAoJCQkuaW9tbXUgPSAyLAoJCQkuZG9tYWlu
ID0gMHgwLAoJCQkuYmRmID0gMHhiMzAwLAoJCQkuYmFyX21hc2sgPSB7CgkJCQkweGZlMDAwMDAw
LCAweGZmZmZmZmZmLCAweDAwMDAwMDAwLAoJCQkJMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCwgMHgw
MDAwMDAwMCwKCQkJfSwKCQkJLmNhcHNfc3RhcnQgPSA5NywKCQkJLm51bV9jYXBzID0gOSwKCQkJ
Lm51bV9tc2lfdmVjdG9ycyA9IDAsCgkJCS5tc2lfNjRiaXRzID0gMCwKCQkJLm51bV9tc2l4X3Zl
Y3RvcnMgPSA2NCwKCQkJLm1zaXhfcmVnaW9uX3NpemUgPSAweDEwMDAsCgkJCS5tc2l4X2FkZHJl
c3MgPSAweGU0MDAyMDAwLAoJCX0sCgkJLyogUENJRGV2aWNlOiBiMzowMC4xICovCgkJewoJCQku
dHlwZSA9IEpBSUxIT1VTRV9QQ0lfVFlQRV9ERVZJQ0UsCgkJCS5pb21tdSA9IDIsCgkJCS5kb21h
aW4gPSAweDAsCgkJCS5iZGYgPSAweGIzMDEsCgkJCS5iYXJfbWFzayA9IHsKCQkJCTB4ZmUwMDAw
MDAsIDB4ZmZmZmZmZmYsIDB4MDAwMDAwMDAsCgkJCQkweDAwMDAwMDAwLCAweDAwMDAwMDAwLCAw
eDAwMDAwMDAwLAoJCQl9LAoJCQkuY2Fwc19zdGFydCA9IDEwNiwKCQkJLm51bV9jYXBzID0gOCwK
CQkJLm51bV9tc2lfdmVjdG9ycyA9IDAsCgkJCS5tc2lfNjRiaXRzID0gMCwKCQkJLm51bV9tc2l4
X3ZlY3RvcnMgPSA2NCwKCQkJLm1zaXhfcmVnaW9uX3NpemUgPSAweDEwMDAsCgkJCS5tc2l4X2Fk
ZHJlc3MgPSAweGUyMDAyMDAwLAoJCX0sCgl9LAoKCS5wY2lfY2FwcyA9IHsKCQkvKiBQQ0lEZXZp
Y2U6IDAwOjAwLjAgKi8KCQl7CgkJCS5pZCA9IDB4MTAsCgkJCS5zdGFydCA9IDB4OTAsCgkJCS5s
ZW4gPSA2MCwKCQkJLmZsYWdzID0gMCwKCQl9LAoJCXsKCQkJLmlkID0gMHgxLAoJCQkuc3RhcnQg
PSAweGUwLAoJCQkubGVuID0gOCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX1BDSUNBUFNfV1JJVEUs
CgkJfSwKCQl7CgkJCS5pZCA9IDB4YiB8IEpBSUxIT1VTRV9QQ0lfRVhUX0NBUCwKCQkJLnN0YXJ0
ID0gMHgxMDAsCgkJCS5sZW4gPSA0LAoJCQkuZmxhZ3MgPSAwLAoJCX0sCgkJewoJCQkuaWQgPSAw
eGIgfCBKQUlMSE9VU0VfUENJX0VYVF9DQVAsCgkJCS5zdGFydCA9IDB4MTQ0LAoJCQkubGVuID0g
NCwKCQkJLmZsYWdzID0gMCwKCQl9LAoJCXsKCQkJLmlkID0gMHhiIHwgSkFJTEhPVVNFX1BDSV9F
WFRfQ0FQLAoJCQkuc3RhcnQgPSAweDFkMCwKCQkJLmxlbiA9IDQsCgkJCS5mbGFncyA9IDAsCgkJ
fSwKCQl7CgkJCS5pZCA9IDB4MTkgfCBKQUlMSE9VU0VfUENJX0VYVF9DQVAsCgkJCS5zdGFydCA9
IDB4MjUwLAoJCQkubGVuID0gNCwKCQkJLmZsYWdzID0gMCwKCQl9LAoJCXsKCQkJLmlkID0gMHhi
IHwgSkFJTEhPVVNFX1BDSV9FWFRfQ0FQLAoJCQkuc3RhcnQgPSAweDI4MCwKCQkJLmxlbiA9IDQs
CgkJCS5mbGFncyA9IDAsCgkJfSwKCQl7CgkJCS5pZCA9IDB4YiB8IEpBSUxIT1VTRV9QQ0lfRVhU
X0NBUCwKCQkJLnN0YXJ0ID0gMHgyOTgsCgkJCS5sZW4gPSA0LAoJCQkuZmxhZ3MgPSAwLAoJCX0s
CgkJewoJCQkuaWQgPSAweGIgfCBKQUlMSE9VU0VfUENJX0VYVF9DQVAsCgkJCS5zdGFydCA9IDB4
MzAwLAoJCQkubGVuID0gNCwKCQkJLmZsYWdzID0gMCwKCQl9LAoJCS8qIFBDSURldmljZTogMDA6
MDUuMCAqLwoJCS8qIFBDSURldmljZTogMDA6MDUuMiAqLwoJCS8qIFBDSURldmljZTogMDA6MDgu
MCAqLwoJCS8qIFBDSURldmljZTogMDA6MDguMiAqLwoJCS8qIFBDSURldmljZTogMTY6MDUuMCAq
LwoJCS8qIFBDSURldmljZTogMTY6MDUuMiAqLwoJCS8qIFBDSURldmljZTogNjQ6MDUuMCAqLwoJ
CS8qIFBDSURldmljZTogNjQ6MDUuMiAqLwoJCS8qIFBDSURldmljZTogYjI6MDUuMCAqLwoJCS8q
IFBDSURldmljZTogYjI6MDUuMiAqLwoJCS8qIFBDSURldmljZTogYjI6MGUuMCAqLwoJCS8qIFBD
SURldmljZTogYjI6MGYuMCAqLwoJCS8qIFBDSURldmljZTogYjI6MTAuMCAqLwoJCS8qIFBDSURl
dmljZTogYjI6MTIuMCAqLwoJCS8qIFBDSURldmljZTogYjI6MTIuNCAqLwoJCXsKCQkJLmlkID0g
MHgxMCwKCQkJLnN0YXJ0ID0gMHg0MCwKCQkJLmxlbiA9IDYwLAoJCQkuZmxhZ3MgPSAwLAoJCX0s
CgkJewoJCQkuaWQgPSAweDAgfCBKQUlMSE9VU0VfUENJX0VYVF9DQVAsCgkJCS5zdGFydCA9IDB4
MTAwLAoJCQkubGVuID0gNCwKCQkJLmZsYWdzID0gMCwKCQl9LAoJCS8qIFBDSURldmljZTogMDA6
MDUuNCAqLwoJCS8qIFBDSURldmljZTogMTY6MDUuNCAqLwoJCS8qIFBDSURldmljZTogNjQ6MDUu
NCAqLwoJCS8qIFBDSURldmljZTogYjI6MDUuNCAqLwoJCXsKCQkJLmlkID0gMHgxMCwKCQkJLnN0
YXJ0ID0gMHg0NCwKCQkJLmxlbiA9IDIwLAoJCQkuZmxhZ3MgPSAwLAoJCX0sCgkJewoJCQkuaWQg
PSAweDEsCgkJCS5zdGFydCA9IDB4ZTAsCgkJCS5sZW4gPSA4LAoJCQkuZmxhZ3MgPSBKQUlMSE9V
U0VfUENJQ0FQU19XUklURSwKCQl9LAoJCXsKCQkJLmlkID0gMHgwIHwgSkFJTEhPVVNFX1BDSV9F
WFRfQ0FQLAoJCQkuc3RhcnQgPSAweDEwMCwKCQkJLmxlbiA9IDQsCgkJCS5mbGFncyA9IDAsCgkJ
fSwKCQkvKiBQQ0lEZXZpY2U6IDAwOjExLjAgKi8KCQl7CgkJCS5pZCA9IDB4MSwKCQkJLnN0YXJ0
ID0gMHg4MCwKCQkJLmxlbiA9IDgsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9QQ0lDQVBTX1dSSVRF
LAoJCX0sCgkJLyogUENJRGV2aWNlOiAwMDoxMS41ICovCgkJLyogUENJRGV2aWNlOiAwMDoxNy4w
ICovCgkJewoJCQkuaWQgPSAweDUsCgkJCS5zdGFydCA9IDB4ODAsCgkJCS5sZW4gPSAxMCwKCQkJ
LmZsYWdzID0gSkFJTEhPVVNFX1BDSUNBUFNfV1JJVEUsCgkJfSwKCQl7CgkJCS5pZCA9IDB4MSwK
CQkJLnN0YXJ0ID0gMHg3MCwKCQkJLmxlbiA9IDgsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9QQ0lD
QVBTX1dSSVRFLAoJCX0sCgkJewoJCQkuaWQgPSAweDEyLAoJCQkuc3RhcnQgPSAweGE4LAoJCQku
bGVuID0gMiwKCQkJLmZsYWdzID0gMCwKCQl9LAoJCS8qIFBDSURldmljZTogMDA6MTQuMCAqLwoJ
CXsKCQkJLmlkID0gMHgxLAoJCQkuc3RhcnQgPSAweDcwLAoJCQkubGVuID0gOCwKCQkJLmZsYWdz
ID0gSkFJTEhPVVNFX1BDSUNBUFNfV1JJVEUsCgkJfSwKCQl7CgkJCS5pZCA9IDB4NSwKCQkJLnN0
YXJ0ID0gMHg4MCwKCQkJLmxlbiA9IDE0LAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfUENJQ0FQU19X
UklURSwKCQl9LAoJCS8qIFBDSURldmljZTogMDA6MTQuMiAqLwoJCXsKCQkJLmlkID0gMHgxLAoJ
CQkuc3RhcnQgPSAweDUwLAoJCQkubGVuID0gOCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX1BDSUNB
UFNfV1JJVEUsCgkJfSwKCQl7CgkJCS5pZCA9IDB4NSwKCQkJLnN0YXJ0ID0gMHg4MCwKCQkJLmxl
biA9IDEwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfUENJQ0FQU19XUklURSwKCQl9LAoJCS8qIFBD
SURldmljZTogMDA6MTYuMCAqLwoJCS8qIFBDSURldmljZTogMDA6MTYuMSAqLwoJCS8qIFBDSURl
dmljZTogMDA6MTYuNCAqLwoJCXsKCQkJLmlkID0gMHgxLAoJCQkuc3RhcnQgPSAweDUwLAoJCQku
bGVuID0gOCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX1BDSUNBUFNfV1JJVEUsCgkJfSwKCQl7CgkJ
CS5pZCA9IDB4NSwKCQkJLnN0YXJ0ID0gMHg4YywKCQkJLmxlbiA9IDE0LAoJCQkuZmxhZ3MgPSBK
QUlMSE9VU0VfUENJQ0FQU19XUklURSwKCQl9LAoJCS8qIFBDSURldmljZTogMDA6MWMuMCAqLwoJ
CXsKCQkJLmlkID0gMHgxMCwKCQkJLnN0YXJ0ID0gMHg0MCwKCQkJLmxlbiA9IDYwLAoJCQkuZmxh
Z3MgPSAwLAoJCX0sCgkJewoJCQkuaWQgPSAweDUsCgkJCS5zdGFydCA9IDB4ODAsCgkJCS5sZW4g
PSAxMCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX1BDSUNBUFNfV1JJVEUsCgkJfSwKCQl7CgkJCS5p
ZCA9IDB4ZCwKCQkJLnN0YXJ0ID0gMHg5MCwKCQkJLmxlbiA9IDIsCgkJCS5mbGFncyA9IDAsCgkJ
fSwKCQl7CgkJCS5pZCA9IDB4MSwKCQkJLnN0YXJ0ID0gMHhhMCwKCQkJLmxlbiA9IDgsCgkJCS5m
bGFncyA9IEpBSUxIT1VTRV9QQ0lDQVBTX1dSSVRFLAoJCX0sCgkJewoJCQkuaWQgPSAweDAgfCBK
QUlMSE9VU0VfUENJX0VYVF9DQVAsCgkJCS5zdGFydCA9IDB4MTAwLAoJCQkubGVuID0gNCwKCQkJ
LmZsYWdzID0gMCwKCQl9LAoJCS8qIFBDSURldmljZTogMDA6MWMuNCAqLwoJCXsKCQkJLmlkID0g
MHgxMCwKCQkJLnN0YXJ0ID0gMHg0MCwKCQkJLmxlbiA9IDYwLAoJCQkuZmxhZ3MgPSAwLAoJCX0s
CgkJewoJCQkuaWQgPSAweDUsCgkJCS5zdGFydCA9IDB4ODAsCgkJCS5sZW4gPSAxMCwKCQkJLmZs
YWdzID0gSkFJTEhPVVNFX1BDSUNBUFNfV1JJVEUsCgkJfSwKCQl7CgkJCS5pZCA9IDB4ZCwKCQkJ
LnN0YXJ0ID0gMHg5MCwKCQkJLmxlbiA9IDIsCgkJCS5mbGFncyA9IDAsCgkJfSwKCQl7CgkJCS5p
ZCA9IDB4MSwKCQkJLnN0YXJ0ID0gMHhhMCwKCQkJLmxlbiA9IDgsCgkJCS5mbGFncyA9IEpBSUxI
T1VTRV9QQ0lDQVBTX1dSSVRFLAoJCX0sCgkJewoJCQkuaWQgPSAweDEgfCBKQUlMSE9VU0VfUENJ
X0VYVF9DQVAsCgkJCS5zdGFydCA9IDB4MTAwLAoJCQkubGVuID0gNCwKCQkJLmZsYWdzID0gMCwK
CQl9LAoJCXsKCQkJLmlkID0gMHhkIHwgSkFJTEhPVVNFX1BDSV9FWFRfQ0FQLAoJCQkuc3RhcnQg
PSAweDE0MCwKCQkJLmxlbiA9IDQsCgkJCS5mbGFncyA9IDAsCgkJfSwKCQkvKiBQQ0lEZXZpY2U6
IDAyOjAwLjAgKi8KCQl7CgkJCS5pZCA9IDB4NSwKCQkJLnN0YXJ0ID0gMHg1MCwKCQkJLmxlbiA9
IDE0LAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfUENJQ0FQU19XUklURSwKCQl9LAoJCXsKCQkJLmlk
ID0gMHgxLAoJCQkuc3RhcnQgPSAweDc4LAoJCQkubGVuID0gOCwKCQkJLmZsYWdzID0gSkFJTEhP
VVNFX1BDSUNBUFNfV1JJVEUsCgkJfSwKCQl7CgkJCS5pZCA9IDB4MTAsCgkJCS5zdGFydCA9IDB4
ODAsCgkJCS5sZW4gPSA2MCwKCQkJLmZsYWdzID0gMCwKCQl9LAoJCXsKCQkJLmlkID0gMHgyIHwg
SkFJTEhPVVNFX1BDSV9FWFRfQ0FQLAoJCQkuc3RhcnQgPSAweDEwMCwKCQkJLmxlbiA9IDQsCgkJ
CS5mbGFncyA9IDAsCgkJfSwKCQl7CgkJCS5pZCA9IDB4MSB8IEpBSUxIT1VTRV9QQ0lfRVhUX0NB
UCwKCQkJLnN0YXJ0ID0gMHg4MDAsCgkJCS5sZW4gPSA0LAoJCQkuZmxhZ3MgPSAwLAoJCX0sCgkJ
LyogUENJRGV2aWNlOiAwMzowMC4wICovCgkJewoJCQkuaWQgPSAweDEsCgkJCS5zdGFydCA9IDB4
ZGMsCgkJCS5sZW4gPSA4LAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfUENJQ0FQU19XUklURSwKCQl9
LAoJCS8qIFBDSURldmljZTogMTY6MDIuMCAqLwoJCS8qIFBDSURldmljZTogNjQ6MDIuMCAqLwoJ
CS8qIFBDSURldmljZTogYjI6MDAuMCAqLwoJCXsKCQkJLmlkID0gMHhkLAoJCQkuc3RhcnQgPSAw
eDQwLAoJCQkubGVuID0gMiwKCQkJLmZsYWdzID0gMCwKCQl9LAoJCXsKCQkJLmlkID0gMHg1LAoJ
CQkuc3RhcnQgPSAweDYwLAoJCQkubGVuID0gMjAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9QQ0lD
QVBTX1dSSVRFLAoJCX0sCgkJewoJCQkuaWQgPSAweDEwLAoJCQkuc3RhcnQgPSAweDkwLAoJCQku
bGVuID0gNjAsCgkJCS5mbGFncyA9IDAsCgkJfSwKCQl7CgkJCS5pZCA9IDB4MSwKCQkJLnN0YXJ0
ID0gMHhlMCwKCQkJLmxlbiA9IDgsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9QQ0lDQVBTX1dSSVRF
LAoJCX0sCgkJewoJCQkuaWQgPSAweGIgfCBKQUlMSE9VU0VfUENJX0VYVF9DQVAsCgkJCS5zdGFy
dCA9IDB4MTAwLAoJCQkubGVuID0gNCwKCQkJLmZsYWdzID0gMCwKCQl9LAoJCXsKCQkJLmlkID0g
MHhkIHwgSkFJTEhPVVNFX1BDSV9FWFRfQ0FQLAoJCQkuc3RhcnQgPSAweDExMCwKCQkJLmxlbiA9
IDQsCgkJCS5mbGFncyA9IDAsCgkJfSwKCQl7CgkJCS5pZCA9IDB4MSB8IEpBSUxIT1VTRV9QQ0lf
RVhUX0NBUCwKCQkJLnN0YXJ0ID0gMHgxNDgsCgkJCS5sZW4gPSA0LAoJCQkuZmxhZ3MgPSAwLAoJ
CX0sCgkJewoJCQkuaWQgPSAweGIgfCBKQUlMSE9VU0VfUENJX0VYVF9DQVAsCgkJCS5zdGFydCA9
IDB4MWQwLAoJCQkubGVuID0gNCwKCQkJLmZsYWdzID0gMCwKCQl9LAoJCXsKCQkJLmlkID0gMHgx
OSB8IEpBSUxIT1VTRV9QQ0lfRVhUX0NBUCwKCQkJLnN0YXJ0ID0gMHgyNTAsCgkJCS5sZW4gPSA0
LAoJCQkuZmxhZ3MgPSAwLAoJCX0sCgkJewoJCQkuaWQgPSAweGIgfCBKQUlMSE9VU0VfUENJX0VY
VF9DQVAsCgkJCS5zdGFydCA9IDB4MjgwLAoJCQkubGVuID0gNCwKCQkJLmZsYWdzID0gMCwKCQl9
LAoJCXsKCQkJLmlkID0gMHhiIHwgSkFJTEhPVVNFX1BDSV9FWFRfQ0FQLAoJCQkuc3RhcnQgPSAw
eDI5OCwKCQkJLmxlbiA9IDQsCgkJCS5mbGFncyA9IDAsCgkJfSwKCQl7CgkJCS5pZCA9IDB4YiB8
IEpBSUxIT1VTRV9QQ0lfRVhUX0NBUCwKCQkJLnN0YXJ0ID0gMHgzMDAsCgkJCS5sZW4gPSA0LAoJ
CQkuZmxhZ3MgPSAwLAoJCX0sCgkJLyogUENJRGV2aWNlOiAxNzowMC4wICovCgkJewoJCQkuaWQg
PSAweDEsCgkJCS5zdGFydCA9IDB4NDAsCgkJCS5sZW4gPSA4LAoJCQkuZmxhZ3MgPSBKQUlMSE9V
U0VfUENJQ0FQU19XUklURSwKCQl9LAoJCXsKCQkJLmlkID0gMHg1LAoJCQkuc3RhcnQgPSAweDUw
LAoJCQkubGVuID0gMjQsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9QQ0lDQVBTX1dSSVRFLAoJCX0s
CgkJewoJCQkuaWQgPSAweDEwLAoJCQkuc3RhcnQgPSAweDcwLAoJCQkubGVuID0gNjAsCgkJCS5m
bGFncyA9IDAsCgkJfSwKCQl7CgkJCS5pZCA9IDB4MTEsCgkJCS5zdGFydCA9IDB4YjAsCgkJCS5s
ZW4gPSAxMiwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX1BDSUNBUFNfV1JJVEUsCgkJfSwKCQl7CgkJ
CS5pZCA9IDB4MywKCQkJLnN0YXJ0ID0gMHhkMCwKCQkJLmxlbiA9IDIsCgkJCS5mbGFncyA9IDAs
CgkJfSwKCQl7CgkJCS5pZCA9IDB4MSB8IEpBSUxIT1VTRV9QQ0lfRVhUX0NBUCwKCQkJLnN0YXJ0
ID0gMHgxMDAsCgkJCS5sZW4gPSA0LAoJCQkuZmxhZ3MgPSAwLAoJCX0sCgkJewoJCQkuaWQgPSAw
eDIgfCBKQUlMSE9VU0VfUENJX0VYVF9DQVAsCgkJCS5zdGFydCA9IDB4MTQ4LAoJCQkubGVuID0g
NCwKCQkJLmZsYWdzID0gMCwKCQl9LAoJCXsKCQkJLmlkID0gMHgzIHwgSkFJTEhPVVNFX1BDSV9F
WFRfQ0FQLAoJCQkuc3RhcnQgPSAweDE2OCwKCQkJLmxlbiA9IDQsCgkJCS5mbGFncyA9IDAsCgkJ
fSwKCQl7CgkJCS5pZCA9IDB4NCB8IEpBSUxIT1VTRV9QQ0lfRVhUX0NBUCwKCQkJLnN0YXJ0ID0g
MHgxNzgsCgkJCS5sZW4gPSA0LAoJCQkuZmxhZ3MgPSAwLAoJCX0sCgkJewoJCQkuaWQgPSAweGUg
fCBKQUlMSE9VU0VfUENJX0VYVF9DQVAsCgkJCS5zdGFydCA9IDB4MTg4LAoJCQkubGVuID0gNCwK
CQkJLmZsYWdzID0gMCwKCQl9LAoJCXsKCQkJLmlkID0gMHgxOSB8IEpBSUxIT1VTRV9QQ0lfRVhU
X0NBUCwKCQkJLnN0YXJ0ID0gMHgxOTgsCgkJCS5sZW4gPSA0LAoJCQkuZmxhZ3MgPSAwLAoJCX0s
CgkJewoJCQkuaWQgPSAweDE3IHwgSkFJTEhPVVNFX1BDSV9FWFRfQ0FQLAoJCQkuc3RhcnQgPSAw
eDFmOCwKCQkJLmxlbiA9IDQsCgkJCS5mbGFncyA9IDAsCgkJfSwKCQl7CgkJCS5pZCA9IDB4MTgg
fCBKQUlMSE9VU0VfUENJX0VYVF9DQVAsCgkJCS5zdGFydCA9IDB4Mjg0LAoJCQkubGVuID0gNCwK
CQkJLmZsYWdzID0gMCwKCQl9LAoJCXsKCQkJLmlkID0gMHhiIHwgSkFJTEhPVVNFX1BDSV9FWFRf
Q0FQLAoJCQkuc3RhcnQgPSAweDI4YywKCQkJLmxlbiA9IDQsCgkJCS5mbGFncyA9IDAsCgkJfSwK
CQl7CgkJCS5pZCA9IDB4YiB8IEpBSUxIT1VTRV9QQ0lfRVhUX0NBUCwKCQkJLnN0YXJ0ID0gMHgz
OGMsCgkJCS5sZW4gPSA0LAoJCQkuZmxhZ3MgPSAwLAoJCX0sCgkJewoJCQkuaWQgPSAweDFmIHwg
SkFJTEhPVVNFX1BDSV9FWFRfQ0FQLAoJCQkuc3RhcnQgPSAweDNjNCwKCQkJLmxlbiA9IDQsCgkJ
CS5mbGFncyA9IDAsCgkJfSwKCQl7CgkJCS5pZCA9IDB4YiB8IEpBSUxIT1VTRV9QQ0lfRVhUX0NB
UCwKCQkJLnN0YXJ0ID0gMHgzZDAsCgkJCS5sZW4gPSA0LAoJCQkuZmxhZ3MgPSAwLAoJCX0sCgkJ
ewoJCQkuaWQgPSAweDE1IHwgSkFJTEhPVVNFX1BDSV9FWFRfQ0FQLAoJCQkuc3RhcnQgPSAweDQy
NCwKCQkJLmxlbiA9IDQsCgkJCS5mbGFncyA9IDAsCgkJfSwKCQkvKiBQQ0lEZXZpY2U6IDE3OjAw
LjEgKi8KCQkvKiBQQ0lEZXZpY2U6IDE3OjAwLjIgKi8KCQkvKiBQQ0lEZXZpY2U6IDE3OjAwLjMg
Ki8KCQl7CgkJCS5pZCA9IDB4MSwKCQkJLnN0YXJ0ID0gMHg0MCwKCQkJLmxlbiA9IDgsCgkJCS5m
bGFncyA9IEpBSUxIT1VTRV9QQ0lDQVBTX1dSSVRFLAoJCX0sCgkJewoJCQkuaWQgPSAweDUsCgkJ
CS5zdGFydCA9IDB4NTAsCgkJCS5sZW4gPSAyNCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX1BDSUNB
UFNfV1JJVEUsCgkJfSwKCQl7CgkJCS5pZCA9IDB4MTAsCgkJCS5zdGFydCA9IDB4NzAsCgkJCS5s
ZW4gPSA2MCwKCQkJLmZsYWdzID0gMCwKCQl9LAoJCXsKCQkJLmlkID0gMHgxMSwKCQkJLnN0YXJ0
ID0gMHhiMCwKCQkJLmxlbiA9IDEyLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfUENJQ0FQU19XUklU
RSwKCQl9LAoJCXsKCQkJLmlkID0gMHgzLAoJCQkuc3RhcnQgPSAweGQwLAoJCQkubGVuID0gMiwK
CQkJLmZsYWdzID0gMCwKCQl9LAoJCXsKCQkJLmlkID0gMHgxIHwgSkFJTEhPVVNFX1BDSV9FWFRf
Q0FQLAoJCQkuc3RhcnQgPSAweDEwMCwKCQkJLmxlbiA9IDQsCgkJCS5mbGFncyA9IDAsCgkJfSwK
CQl7CgkJCS5pZCA9IDB4MyB8IEpBSUxIT1VTRV9QQ0lfRVhUX0NBUCwKCQkJLnN0YXJ0ID0gMHgx
NjgsCgkJCS5sZW4gPSA0LAoJCQkuZmxhZ3MgPSAwLAoJCX0sCgkJewoJCQkuaWQgPSAweDQgfCBK
QUlMSE9VU0VfUENJX0VYVF9DQVAsCgkJCS5zdGFydCA9IDB4MTc4LAoJCQkubGVuID0gNCwKCQkJ
LmZsYWdzID0gMCwKCQl9LAoJCXsKCQkJLmlkID0gMHhlIHwgSkFJTEhPVVNFX1BDSV9FWFRfQ0FQ
LAoJCQkuc3RhcnQgPSAweDE4OCwKCQkJLmxlbiA9IDQsCgkJCS5mbGFncyA9IDAsCgkJfSwKCQl7
CgkJCS5pZCA9IDB4MTcgfCBKQUlMSE9VU0VfUENJX0VYVF9DQVAsCgkJCS5zdGFydCA9IDB4MWY4
LAoJCQkubGVuID0gNCwKCQkJLmZsYWdzID0gMCwKCQl9LAoJCXsKCQkJLmlkID0gMHhiIHwgSkFJ
TEhPVVNFX1BDSV9FWFRfQ0FQLAoJCQkuc3RhcnQgPSAweDI4YywKCQkJLmxlbiA9IDQsCgkJCS5m
bGFncyA9IDAsCgkJfSwKCQl7CgkJCS5pZCA9IDB4YiB8IEpBSUxIT1VTRV9QQ0lfRVhUX0NBUCwK
CQkJLnN0YXJ0ID0gMHgzOGMsCgkJCS5sZW4gPSA0LAoJCQkuZmxhZ3MgPSAwLAoJCX0sCgkJewoJ
CQkuaWQgPSAweGIgfCBKQUlMSE9VU0VfUENJX0VYVF9DQVAsCgkJCS5zdGFydCA9IDB4M2QwLAoJ
CQkubGVuID0gNCwKCQkJLmZsYWdzID0gMCwKCQl9LAoJCXsKCQkJLmlkID0gMHgxNSB8IEpBSUxI
T1VTRV9QQ0lfRVhUX0NBUCwKCQkJLnN0YXJ0ID0gMHg0MjQsCgkJCS5sZW4gPSA0LAoJCQkuZmxh
Z3MgPSAwLAoJCX0sCgkJLyogUENJRGV2aWNlOiA2NDowOC4wICovCgkJLyogUENJRGV2aWNlOiA2
NDowOS4wICovCgkJLyogUENJRGV2aWNlOiA2NDowYS4wICovCgkJLyogUENJRGV2aWNlOiA2NDow
YS4xICovCgkJLyogUENJRGV2aWNlOiA2NDowYS4yICovCgkJLyogUENJRGV2aWNlOiA2NDowYS4z
ICovCgkJLyogUENJRGV2aWNlOiA2NDowYS40ICovCgkJLyogUENJRGV2aWNlOiA2NDowYS41ICov
CgkJLyogUENJRGV2aWNlOiA2NDowYS42ICovCgkJLyogUENJRGV2aWNlOiA2NDowYS43ICovCgkJ
LyogUENJRGV2aWNlOiA2NDowYi4wICovCgkJLyogUENJRGV2aWNlOiA2NDowYi4xICovCgkJLyog
UENJRGV2aWNlOiA2NDowYi4yICovCgkJLyogUENJRGV2aWNlOiA2NDowYi4zICovCgkJLyogUENJ
RGV2aWNlOiA2NDowYy4wICovCgkJLyogUENJRGV2aWNlOiA2NDowYy4xICovCgkJLyogUENJRGV2
aWNlOiA2NDowYy4yICovCgkJLyogUENJRGV2aWNlOiA2NDowYy4zICovCgkJLyogUENJRGV2aWNl
OiA2NDowYy40ICovCgkJLyogUENJRGV2aWNlOiA2NDowYy41ICovCgkJLyogUENJRGV2aWNlOiA2
NDowYy42ICovCgkJLyogUENJRGV2aWNlOiA2NDowYy43ICovCgkJLyogUENJRGV2aWNlOiA2NDow
ZC4wICovCgkJLyogUENJRGV2aWNlOiA2NDowZC4xICovCgkJLyogUENJRGV2aWNlOiA2NDowZC4y
ICovCgkJLyogUENJRGV2aWNlOiA2NDowZC4zICovCgkJewoJCQkuaWQgPSAweDEwLAoJCQkuc3Rh
cnQgPSAweDQwLAoJCQkubGVuID0gMjAsCgkJCS5mbGFncyA9IDAsCgkJfSwKCQl7CgkJCS5pZCA9
IDB4MCB8IEpBSUxIT1VTRV9QQ0lfRVhUX0NBUCwKCQkJLnN0YXJ0ID0gMHgxMDAsCgkJCS5sZW4g
PSA0LAoJCQkuZmxhZ3MgPSAwLAoJCX0sCgkJLyogUENJRGV2aWNlOiA2NTowMC4wICovCgkJewoJ
CQkuaWQgPSAweDEsCgkJCS5zdGFydCA9IDB4NTAsCgkJCS5sZW4gPSA4LAoJCQkuZmxhZ3MgPSBK
QUlMSE9VU0VfUENJQ0FQU19XUklURSwKCQl9LAoJCXsKCQkJLmlkID0gMHgxMCwKCQkJLnN0YXJ0
ID0gMHg2OCwKCQkJLmxlbiA9IDYwLAoJCQkuZmxhZ3MgPSAwLAoJCX0sCgkJewoJCQkuaWQgPSAw
eDUsCgkJCS5zdGFydCA9IDB4YTgsCgkJCS5sZW4gPSAyNCwKCQkJLmZsYWdzID0gSkFJTEhPVVNF
X1BDSUNBUFNfV1JJVEUsCgkJfSwKCQl7CgkJCS5pZCA9IDB4MTEsCgkJCS5zdGFydCA9IDB4YzAs
CgkJCS5sZW4gPSAxMiwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX1BDSUNBUFNfV1JJVEUsCgkJfSwK
CQl7CgkJCS5pZCA9IDB4MSB8IEpBSUxIT1VTRV9QQ0lfRVhUX0NBUCwKCQkJLnN0YXJ0ID0gMHgx
MDAsCgkJCS5sZW4gPSA0LAoJCQkuZmxhZ3MgPSAwLAoJCX0sCgkJewoJCQkuaWQgPSAweDE5IHwg
SkFJTEhPVVNFX1BDSV9FWFRfQ0FQLAoJCQkuc3RhcnQgPSAweDFlMCwKCQkJLmxlbiA9IDQsCgkJ
CS5mbGFncyA9IDAsCgkJfSwKCQl7CgkJCS5pZCA9IDB4NCB8IEpBSUxIT1VTRV9QQ0lfRVhUX0NB
UCwKCQkJLnN0YXJ0ID0gMHgxYzAsCgkJCS5sZW4gPSA0LAoJCQkuZmxhZ3MgPSAwLAoJCX0sCgkJ
ewoJCQkuaWQgPSAweGUgfCBKQUlMSE9VU0VfUENJX0VYVF9DQVAsCgkJCS5zdGFydCA9IDB4MTQ4
LAoJCQkubGVuID0gNCwKCQkJLmZsYWdzID0gMCwKCQl9LAoJCS8qIFBDSURldmljZTogYjI6MGUu
MSAqLwoJCS8qIFBDSURldmljZTogYjI6MGYuMSAqLwoJCS8qIFBDSURldmljZTogYjI6MTAuMSAq
LwoJCXsKCQkJLmlkID0gMHgxMCwKCQkJLnN0YXJ0ID0gMHg0MCwKCQkJLmxlbiA9IDYwLAoJCQku
ZmxhZ3MgPSAwLAoJCX0sCgkJewoJCQkuaWQgPSAweGIgfCBKQUlMSE9VU0VfUENJX0VYVF9DQVAs
CgkJCS5zdGFydCA9IDB4MTAwLAoJCQkubGVuID0gNCwKCQkJLmZsYWdzID0gMCwKCQl9LAoJCS8q
IFBDSURldmljZTogYjM6MDAuMCAqLwoJCXsKCQkJLmlkID0gMHgxMCwKCQkJLnN0YXJ0ID0gMHg2
MCwKCQkJLmxlbiA9IDYwLAoJCQkuZmxhZ3MgPSAwLAoJCX0sCgkJewoJCQkuaWQgPSAweDMsCgkJ
CS5zdGFydCA9IDB4NDgsCgkJCS5sZW4gPSAyLAoJCQkuZmxhZ3MgPSAwLAoJCX0sCgkJewoJCQku
aWQgPSAweDExLAoJCQkuc3RhcnQgPSAweDljLAoJCQkubGVuID0gMTIsCgkJCS5mbGFncyA9IEpB
SUxIT1VTRV9QQ0lDQVBTX1dSSVRFLAoJCX0sCgkJewoJCQkuaWQgPSAweDksCgkJCS5zdGFydCA9
IDB4YzAsCgkJCS5sZW4gPSAyLAoJCQkuZmxhZ3MgPSAwLAoJCX0sCgkJewoJCQkuaWQgPSAweDEs
CgkJCS5zdGFydCA9IDB4NDAsCgkJCS5sZW4gPSA4LAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfUENJ
Q0FQU19XUklURSwKCQl9LAoJCXsKCQkJLmlkID0gMHgxIHwgSkFJTEhPVVNFX1BDSV9FWFRfQ0FQ
LAoJCQkuc3RhcnQgPSAweDEwMCwKCQkJLmxlbiA9IDQsCgkJCS5mbGFncyA9IDAsCgkJfSwKCQl7
CgkJCS5pZCA9IDB4ZSB8IEpBSUxIT1VTRV9QQ0lfRVhUX0NBUCwKCQkJLnN0YXJ0ID0gMHgxNTAs
CgkJCS5sZW4gPSA0LAoJCQkuZmxhZ3MgPSAwLAoJCX0sCgkJewoJCQkuaWQgPSAweDE5IHwgSkFJ
TEhPVVNFX1BDSV9FWFRfQ0FQLAoJCQkuc3RhcnQgPSAweDFjMCwKCQkJLmxlbiA9IDQsCgkJCS5m
bGFncyA9IDAsCgkJfSwKCQl7CgkJCS5pZCA9IDB4ZCB8IEpBSUxIT1VTRV9QQ0lfRVhUX0NBUCwK
CQkJLnN0YXJ0ID0gMHgyMzAsCgkJCS5sZW4gPSA0LAoJCQkuZmxhZ3MgPSAwLAoJCX0sCgkJLyog
UENJRGV2aWNlOiBiMzowMC4xICovCgkJewoJCQkuaWQgPSAweDEwLAoJCQkuc3RhcnQgPSAweDYw
LAoJCQkubGVuID0gNjAsCgkJCS5mbGFncyA9IDAsCgkJfSwKCQl7CgkJCS5pZCA9IDB4MywKCQkJ
LnN0YXJ0ID0gMHg0OCwKCQkJLmxlbiA9IDIsCgkJCS5mbGFncyA9IDAsCgkJfSwKCQl7CgkJCS5p
ZCA9IDB4MTEsCgkJCS5zdGFydCA9IDB4OWMsCgkJCS5sZW4gPSAxMiwKCQkJLmZsYWdzID0gSkFJ
TEhPVVNFX1BDSUNBUFNfV1JJVEUsCgkJfSwKCQl7CgkJCS5pZCA9IDB4OSwKCQkJLnN0YXJ0ID0g
MHhjMCwKCQkJLmxlbiA9IDIsCgkJCS5mbGFncyA9IDAsCgkJfSwKCQl7CgkJCS5pZCA9IDB4MSwK
CQkJLnN0YXJ0ID0gMHg0MCwKCQkJLmxlbiA9IDgsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9QQ0lD
QVBTX1dSSVRFLAoJCX0sCgkJewoJCQkuaWQgPSAweDEgfCBKQUlMSE9VU0VfUENJX0VYVF9DQVAs
CgkJCS5zdGFydCA9IDB4MTAwLAoJCQkubGVuID0gNCwKCQkJLmZsYWdzID0gMCwKCQl9LAoJCXsK
CQkJLmlkID0gMHhlIHwgSkFJTEhPVVNFX1BDSV9FWFRfQ0FQLAoJCQkuc3RhcnQgPSAweDE1MCwK
CQkJLmxlbiA9IDQsCgkJCS5mbGFncyA9IDAsCgkJfSwKCQl7CgkJCS5pZCA9IDB4ZCB8IEpBSUxI
T1VTRV9QQ0lfRVhUX0NBUCwKCQkJLnN0YXJ0ID0gMHgyMzAsCgkJCS5sZW4gPSA0LAoJCQkuZmxh
Z3MgPSAwLAoJCX0sCgl9LAp9Owo=
--0000000000004eaf5b058afbbf10
Content-Type: application/octet-stream; name="tiny-demo.c"
Content-Disposition: attachment; filename="tiny-demo.c"
Content-Transfer-Encoding: base64
Content-ID: <f_jwqnze2y1>
X-Attachment-Id: f_jwqnze2y1

LyoKICogSmFpbGhvdXNlLCBhIExpbnV4LWJhc2VkIHBhcnRpdGlvbmluZyBoeXBlcnZpc29yCiAq
CiAqIE1pbmltYWwgY29uZmlndXJhdGlvbiBmb3IgZGVtbyBpbm1hdGVzLCAxIENQVSwgMSBNQiBS
QU0sIHNlcmlhbCBwb3J0cwogKgogKiBDb3B5cmlnaHQgKGMpIFNpZW1lbnMgQUcsIDIwMTMsIDIw
MTQKICoKICogQXV0aG9yczoKICogIEphbiBLaXN6a2EgPGphbi5raXN6a2FAc2llbWVucy5jb20+
CiAqCiAqIFRoaXMgd29yayBpcyBsaWNlbnNlZCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBH
UEwsIHZlcnNpb24gMi4gIFNlZQogKiB0aGUgQ09QWUlORyBmaWxlIGluIHRoZSB0b3AtbGV2ZWwg
ZGlyZWN0b3J5LgogKi8KCiNpbmNsdWRlIDxqYWlsaG91c2UvdHlwZXMuaD4KI2luY2x1ZGUgPGph
aWxob3VzZS9jZWxsLWNvbmZpZy5oPgoKI2RlZmluZSBBUlJBWV9TSVpFKGEpIHNpemVvZihhKSAv
IHNpemVvZihhWzBdKQoKc3RydWN0IHsKCXN0cnVjdCBqYWlsaG91c2VfY2VsbF9kZXNjIGNlbGw7
CglfX3U2NCBjcHVzWzFdOwoJc3RydWN0IGphaWxob3VzZV9tZW1vcnkgbWVtX3JlZ2lvbnNbMl07
CglzdHJ1Y3QgamFpbGhvdXNlX2NhY2hlIGNhY2hlX3JlZ2lvbnNbMV07CglfX3U4IHBpb19iaXRt
YXBbMHgyMDAwXTsKfSBfX2F0dHJpYnV0ZV9fKChwYWNrZWQpKSBjb25maWcgPSB7CgkuY2VsbCA9
IHsKCQkuc2lnbmF0dXJlID0gSkFJTEhPVVNFX0NFTExfREVTQ19TSUdOQVRVUkUsCgkJLnJldmlz
aW9uID0gSkFJTEhPVVNFX0NPTkZJR19SRVZJU0lPTiwKCQkubmFtZSA9ICJ0aW55LWRlbW8iLAoJ
CS5mbGFncyA9IEpBSUxIT1VTRV9DRUxMX1BBU1NJVkVfQ09NTVJFRyB8CgkJCUpBSUxIT1VTRV9D
RUxMX1RFU1RfREVWSUNFIHwKCQkJSkFJTEhPVVNFX0NFTExfVklSVFVBTF9DT05TT0xFX0FDVElW
RSwKCgkJLmNwdV9zZXRfc2l6ZSA9IHNpemVvZihjb25maWcuY3B1cyksCgkJLm51bV9tZW1vcnlf
cmVnaW9ucyA9IEFSUkFZX1NJWkUoY29uZmlnLm1lbV9yZWdpb25zKSwKCQkubnVtX2NhY2hlX3Jl
Z2lvbnMgPSBBUlJBWV9TSVpFKGNvbmZpZy5jYWNoZV9yZWdpb25zKSwKCQkubnVtX2lycWNoaXBz
ID0gMCwKCQkucGlvX2JpdG1hcF9zaXplID0gQVJSQVlfU0laRShjb25maWcucGlvX2JpdG1hcCks
CgkJLm51bV9wY2lfZGV2aWNlcyA9IDAsCgoJCS5jb25zb2xlID0gewoJCQkuYWRkcmVzcyA9IDB4
M2Y4LAoJCQkudHlwZSA9IEpBSUxIT1VTRV9DT05fVFlQRV84MjUwLAoJCQkuZmxhZ3MgPSBKQUlM
SE9VU0VfQ09OX0FDQ0VTU19QSU8sCgkJfSwKCX0sCgoJLmNwdXMgPSB7CgkJMHg0NCwKCX0sCgoJ
Lm1lbV9yZWdpb25zID0gewoJCS8qIFJBTSAqLyB7CgkJCS5waHlzX3N0YXJ0ID0gMHgzZWYwMDAw
MCwKCQkJLnZpcnRfc3RhcnQgPSAwLAoJCQkuc2l6ZSA9IDB4MDAxMDAwMDAsCgkJCS5mbGFncyA9
IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9NRU1fV1JJVEUgfAoJCQkJSkFJTEhPVVNF
X01FTV9FWEVDVVRFIHwgSkFJTEhPVVNFX01FTV9MT0FEQUJMRSwKCQl9LAoJCS8qIGNvbW11bmlj
YXRpb24gcmVnaW9uICovIHsKCQkJLnZpcnRfc3RhcnQgPSAweDAwMTAwMDAwLAoJCQkuc2l6ZSA9
IDB4MDAwMDEwMDAsCgkJCS5mbGFncyA9IEpBSUxIT1VTRV9NRU1fUkVBRCB8IEpBSUxIT1VTRV9N
RU1fQ09NTV9SRUdJT04sCgkJfSwKCX0sCgoJLmNhY2hlX3JlZ2lvbnMgPSB7CgkJewoJCQkuc3Rh
cnQgPSAyLAoJCQkuc2l6ZSA9IDEsCgkJCS50eXBlID0gSkFJTEhPVVNFX0NBQ0hFX0wzLAoJCX0s
Cgl9LAoKCS5waW9fYml0bWFwID0gewoJCVsgICAgIDAvOCAuLi4gIDB4MmY3LzhdID0gLTEsCgkJ
WyAweDJmOC84IC4uLiAgMHgyZmYvOF0gPSAwLCAvKiBzZXJpYWwyICovCgkJWyAweDMwMC84IC4u
LiAgMHgzZjcvOF0gPSAtMSwKCQlbIDB4M2Y4LzggLi4uICAweDNmZi84XSA9IDAsIC8qIHNlcmlh
bDEgKi8KCQlbIDB4NDAwLzggLi4uIDB4ZGZmZi84XSA9IC0xLAoJCVsweGUwMDAvOCAuLi4gMHhm
ZmZmLzhdID0gLTEsCgl9LAp9Owo=
--0000000000004eaf5b058afbbf10--
