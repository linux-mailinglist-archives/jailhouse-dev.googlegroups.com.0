Return-Path: <jailhouse-dev+bncBCC7DQPESQPRBT4IQTUAKGQE53GVA3A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ua1-x940.google.com (mail-ua1-x940.google.com [IPv6:2607:f8b0:4864:20::940])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5FF42811
	for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jun 2019 15:55:28 +0200 (CEST)
Received: by mail-ua1-x940.google.com with SMTP id s14sf1379701uap.15
        for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jun 2019 06:55:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560347727; cv=pass;
        d=google.com; s=arc-20160816;
        b=cn0XgAFO6ALppV18KtWz03WGWfxFXNYRdYLCjjfiHeLo9W13SOLwsF1ISq7VBrLTsj
         +EBd1PPyR4C0UzEbYnRBBhc0Dfn0JNGKsuHCbaknFVPhWkCGWqbkZuBadxL9VQX3Ycpj
         qEA6Edo+X4Sb05FCjoa/SHe5NPw90JRRWhVgs/4fxvEyT472RrCaIzepuxpQyax21n2H
         YX+61ktUwU4pt44VzhXC+cfS07PBn5W3niq68ayjkW2YIQEIIpUl73PQR+ZenF5YgIWL
         y2xvk6LnSOwcIksmo31uGzHt0gPCJ6z2lpJ38XoV4BpxotSqM29y08xrnrXrfyAMmTDR
         ihXg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=SLov1tdJGwNHw7ReDZU/TAu/HVBqkEWenGBxNouGfAI=;
        b=ukA4YhXQGT0JQGTVwRCqPpwU3r2hF4NobXr4YBPIZ4C0vmXTYnMtAK9q1433aB81ar
         q0gZvgnwZnOtGyubTQsRKKdpTWEYapG1pdsOpL2cnsPapJoNEZbSZjaLGa6XnnXSq2wp
         EkO00UB3JBeBZTKgq/oTRrqgkoVz0ddKwIsSA+mnEkLptyJlxapx+A+bODy7AVX77GoV
         3OrnhdGfsb3ztlEpr/YhBPEmvniFti4ie1vs8cez620Ia5lQo5Mp6oe8bhQq171wDDrN
         Ap9Gi0DCxbohpEjqYYewEGwmP+7tS53IBVmCo3PwHWuYZWL6i9pre2o5RtAdChEyuPPg
         kuGQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=GhteAJS+;
       spf=pass (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::733 as permitted sender) smtp.mailfrom=racedrive1503@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SLov1tdJGwNHw7ReDZU/TAu/HVBqkEWenGBxNouGfAI=;
        b=sJYBryPb0SiBBw7F9h5xdibbzDtLWC81ViP9fqNcGh9Fk3kOqM5zM0GfMoP5cmkSL4
         9DvyV1QhGOXoZXctQR0noKN2yCE+gp87p9gCBxmjVEkfSVo5FA6IOGFxBIEu/ykREfU8
         1lVvgPRymd6rnlGCHUFHwztfSELAoG61SY+AGRaACcfkXHvZMopLQ2pJzOxtCR3Oj4ca
         j95mshSJdU+BAKXLV2f83MbHPcT8z35iGervv+ovYM9Wdr9bfAcdIlhpFMFpH8oWa6hQ
         eNgseE0H42xa27qBBhdUpvXJoeOzggPkKYrOHkLGGoEeBtlUN1Hu6x2YuXhYVo2hJVIa
         Lrjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SLov1tdJGwNHw7ReDZU/TAu/HVBqkEWenGBxNouGfAI=;
        b=Y5BinAFfsqL51psBsxUvJURe3LmEE8a+uzM8ZjC3yiiEFETyHqRaROr7mE03zQ4rMG
         CkmHyYRbKU+Txe3dO/UtU40ierW/XOfaXOoPAcHm5H6Y6hLdN1Ot/QlhrUeV4sRCbJUT
         7/1Ue6DanFEGRCx0pli0MTLcyUC3+Mv667hLTEHp5OzEuK+tCu7KxC90Ek8hh8XlSQxZ
         ZhL7diGXL6zQhxJ03PXGJ5cs0KhzrJYlscSIwsk1lXn1gfl7dYuAj9Ab+D9Ronpjespb
         grWUdSftR4djxsvv6lGsUDGnAdd8H+aAqrnKScJLlMsLnv3qWAnmA1kp1GKd1xK5XsTp
         audw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SLov1tdJGwNHw7ReDZU/TAu/HVBqkEWenGBxNouGfAI=;
        b=EpB7ihD7RJLJW+frYIkihDtraqAt3bz8kHw+z1NqaAsDWm5cXhShK4LlOSxr5yn+rG
         MAwtBTmtGNflPVjOVl6z0u3JRrThoURdhOZf05e/3zkvjtNWpMvmMXBOj480w5P6+YcY
         Bs0ReLXw3ysq6q+OpfKP/rvyxTmktH9RQUM5GFgF3BTsKQ1LTn33+v5eO66G7CuxzfVo
         XN57uv5Zhu9eSVO1B2fqSxfiW6Y+f2QGBFoZSoENG0LxhuvyHTO59KyrwuoiBq8nRYSz
         TO3sznZj5ythit2VnFvo1JauBLFAmLzC+8MiTtsPK15bjwfIWwGzv99iu5JC2EYu80i2
         YJtQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUHDVXcLuRAyUmV6+0RpXXaCMFovhdN07kwdJzOkny3GRj1Xre9
	fP1Jl3nWDMxAZzKJCcMX5Rc=
X-Google-Smtp-Source: APXvYqwZ1wmcQTNYerEkbWCTkYWxaAk/dwhkYen+RqcglH5hjCnaJ7wEUmqEps0alRWclouAIvKMdg==
X-Received: by 2002:a67:f5d0:: with SMTP id t16mr28860037vso.175.1560347727463;
        Wed, 12 Jun 2019 06:55:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ab0:16c3:: with SMTP id g3ls135815uaf.0.gmail; Wed, 12 Jun
 2019 06:55:26 -0700 (PDT)
X-Received: by 2002:ab0:4744:: with SMTP id i4mr6657147uac.63.1560347726876;
        Wed, 12 Jun 2019 06:55:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560347726; cv=none;
        d=google.com; s=arc-20160816;
        b=o7B+JGG264FhfQVU+Lqi7ipXucK5OMW+A8wsH5czfWRpd5fRnA+2W8cuuXtwK5ZLko
         0BMYxOcLygqTq47JbrPd7EyLJ6cdFBZcdKvhWuOENXblZwyoQYLxmkzgJxkAZHzN0/Jh
         OVlRF8oFqgjj95PPeY0wqwCnhLLbtfYctzWksRtYU6O0TLfgqzkbCqaZn1Cer4M2VhL/
         c9Xole7hBPWoqn02URhbzC4+6SGhiGdNV2M0Suyet5gCEXlsqU3V+mP0MGrRGwfdGZBu
         tysyhNoBHfSto0o+w/03FdD3UymKNbUEsa4tiHwt0rRj9zGLjlUKYx1T8DE8c/s4D+c9
         ceHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nQ5L0Lw9tgB0fRbF1NgU9+8tdKTl2Tv/R/wXMnU4+Qg=;
        b=R+tSoHyarGk1g8/MJOHEVIIaH/2etrh1HnNhOtegQ5YXgx6pZr3XGv25VUMDHeSY+G
         PS7ki1nFw9pMtb2bFzBn5eqo/rrP4y6ctT2RZtmuWsiaZqCq+cr7wQ3KaPi5PaxJzano
         Q2L7fdd5VACy8+BXwMRzwkABn/ifm7BS3j+R6/DkZ/fr7601fA5ln5ae5d62VUUOFJoT
         GAyb22gXvIYU++7ladOwvo9bgCnp983g30BxkuaLwQaR0rErwtYuLxmlv5ZgZ4969gf6
         5Q9oH/n6Rsv2gJP5kliYb7wG/nqJc9B1xEFce1L2IqBiODYsfbLVj0Lo3iRyBUtpPASG
         kPtg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=GhteAJS+;
       spf=pass (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::733 as permitted sender) smtp.mailfrom=racedrive1503@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com. [2607:f8b0:4864:20::733])
        by gmr-mx.google.com with ESMTPS id v21si603353vso.2.2019.06.12.06.55.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 06:55:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::733 as permitted sender) client-ip=2607:f8b0:4864:20::733;
Received: by mail-qk1-x733.google.com with SMTP id b18so10239700qkc.9
        for <jailhouse-dev@googlegroups.com>; Wed, 12 Jun 2019 06:55:26 -0700 (PDT)
X-Received: by 2002:a05:620a:13ec:: with SMTP id h12mr15618334qkl.266.1560347726295;
 Wed, 12 Jun 2019 06:55:26 -0700 (PDT)
MIME-Version: 1.0
References: <CA++Khc2iKk1J6+0huh5__dS4HyujXzV9r+LbKLzuVZ4K3Bt5eA@mail.gmail.com>
 <57edbc3b-cadc-c850-8310-4640fc623085@oth-regensburg.de> <CA++Khc3HLaSEo9z2jd6hVLuDK-zd4P6au0KP3+6db8KBR47izQ@mail.gmail.com>
 <166c6ad9-379c-bad6-f30f-8af4f97b8bb1@oth-regensburg.de> <CA++Khc0yQbb3BjzCuR+6JLVqvx7EA3F5JHCFtf5FpN41CiGGVA@mail.gmail.com>
 <f0936088-a32d-3da7-a9ba-d552ede5052e@oth-regensburg.de> <CA++Khc0FZSWvVZZyV+4_F0TO7dHPN70Mn3LUCmq_3M2fnGN4ig@mail.gmail.com>
 <CA++Khc0O2zSeuLLY3MaeRW7cQrWbq-6Y2BHJg+x_j6nk=ECa_A@mail.gmail.com> <ad13aaa6-41ac-14fd-33fe-fa4f6dfc789e@oth-regensburg.de>
In-Reply-To: <ad13aaa6-41ac-14fd-33fe-fa4f6dfc789e@oth-regensburg.de>
From: Wayne <racedrive1503@gmail.com>
Date: Wed, 12 Jun 2019 09:55:13 -0400
Message-ID: <CA++Khc36sP7ABEsR5Bp+gpts0DUBENqV6eFDPazfs5kR_QRGaw@mail.gmail.com>
Subject: Re: Linux non-root node question
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: jailhouse-dev@googlegroups.com, jan.kiszka@siemens.com
Content-Type: multipart/alternative; boundary="000000000000f3b8a5058b20c3aa"
X-Original-Sender: racedrive1503@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=GhteAJS+;       spf=pass
 (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::733
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

--000000000000f3b8a5058b20c3aa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ralf/Jan,

 Are you sure you remove the device from the kernel cmdline? *Yes, there is
no ttyS* device in my root linux cmdline*
- Are you sure that there doesn't spawn a tty? Check with systemctl. *No
tty as far as I can tell, verified with "lsof | grep ttyS".  The lsof
command stops working after the crash though*
- lsof | grep ttyS
- The root-cell might receive the serial device's interrupt, while its
  ports are assigned to the non-root cell. Does the crash happen when
  you type in a character to the serial line? *This is possible, do you
have an example of how I would accomplish assigning the interrupt (IRQ 4
for ttyS0) to the non-root?  To rule out the interrupt concern.*

  In this case, assign the interrupt to the non-root cell. You will need
  it in any case there once you have a initrd and want to type in stuff.

So there must be some reason why the crash happens. The hard way is to
add 8250.nr_uarts=3D0 in your kernel cmdline of the root cell. *I can use
this method for now to continue booting the non-root linux.*

>
>        if I leave out the pio mapping in the non-root linux, and
> alolothat block in the root cell instead then the non-root linux gets a
> PIO read fault on "0x3F9" while booting.
>        Ralf mentioned that Linux would not try enumerate the device if
> its set to -1 ( [0x3f8/8 ... 0x3ff/8] =3D -1)  , but the non-root seems t=
o
> attempt to do something with it anyway:
>
> "[    0.956146]Serial: 8250/16550 driver, 1 ports, IRQ sharing enabled"
> "FATAL: Invalid PIO read, port: 3f9: size 1"

Hmm. At least that's what I thought. I don't know how enumeration of
platform devices works exactly, but reconsidering this, the behaviour
above makes sense: How would it know that a platform device is not
present, depending of the configuration of the pio_bitmap.   * Since I do
technically have two serial ports, is there a way (via command line or
kernel config for ex) to hardcode what the non-root would enumerate for the
UART when its booting up?  Meaning, force it to "see" the 0x2f8 serial port
as ttyS0 instead of 0x3f8 when booting up  and**
CONFIG_SERIAL_8250_RUNTIME_UARTS
=3D 1**.  That way if you had say three serial ports and three cells (1 roo=
t,
2 non-root linux) then each could have their own separate dedicated ttyS0.*

As far as just booting the non-root besides the serial concern, I haven't
provided an initramfs to my non-root linux yet.  I would like to probably
boot it with a simple ramdisk if possible to get a point where I can log
in.

Thanks,
Wayne

On Wed, Jun 12, 2019 at 6:43 AM Ralf Ramsauer <
ralf.ramsauer@oth-regensburg.de> wrote:

> Hi,
>
> On 6/11/19 11:05 PM, Wayne wrote:
> > Jan/Ralf,
> >
> > I was able to get past issues 1 and 3 above by using Jan's kernel confi=
g
> > from this thread:
> >
> >
> https://groups.google.com/forum/#!searchin/jailhouse-dev/Re$3A$20Failed$2=
0to$20boot$20jailhouse%7Csort:relevance/jailhouse-dev/M7UO89XFIk0/Qi40DDuMB=
AAJ
> ".
> >
> > The DMA issue was resolved by disabling kernel option CONFIG_ISA_DMA_AP=
I
> > as stated in another thread, and reflected in the config file above.
> >
> > So now I think i've almost got the non-root linux booting.  I'm stuck a=
t
> > the point where its trying to mount a filesystem and since i'm not
> > providing an initramfs it panics.
>
> Perfect!
>
> >
> > Similar to the output below:
> >
> > [ 1.080178] VFS: Cannot open root device "(null)" or unknown-block(0,0)=
:
> > error -6
> > [ 1.087662] Please append a correct "root=3D" boot option; here are the
> > available partitions:
> > [ 1.096013] Kernel panic - not syncing: VFS: Unable to mount root fs on
> > unknown-block(0,0)
> >
> > I have just a couple more questions:
> > 1. In general, is it true that an inmate will takeover control from the
> > root of any resource in the following arrays, or are there some cases
> > where they get "shared" between the root and inmate?
>
> Depends.
>
> >      A. ".mem_regions" -> Shared?
>
> May be shared with the root cell (i.e., if the region has the flag
> JAILHOUSE_MEM_ROOTSHARED set).
>
> >      B. ".irqchips" -> Shared?
>
> Shared with whom? Only one guest runs on a CPU. This guest will have
> full access to the irqchip. Some accesses must be intercepted.
>
> >      C. ".pio_bitmap" -> Inmate takes control of these if matching
> > between inmate and root
>
> Exclusive control.
>
> >      D. ".pci_devices" -> Inmate takes control?
>
> Exclusive control.
>
> >      E. ".pci_caps" -> Inmate takes control?
>
> Exclusive control.
>
> >
> > 2. Along the same lines, going back to my ttyS0 issue mentioned above
> > while trying to share it:
> >
> >        If I allocate the following to the linux non root cell (and set
> > to -1 in the root)
>
> BTW, there's generally no need to set -1 in the root cell -- it will be
> taken away when the non-root cell is created.
>
> >      .pio_bitmap =3D {
> >           [0x3f8/8 ... 0x3ff/8] =3D 0x00   /* serial 2*/
> >        }
> >
> >        Then on the root cell I randomly get a PIO read fault on "0x3FE"
> > when the non-root is booting, i'm not sure what process is causing this=
.
>
> - Are you sure you remove the device from the kernel cmdline?
> - Are you sure that there doesn't spawn a tty? Check with systemctl.
> - lsof | grep ttyS
> - The root-cell might receive the serial device's interrupt, while its
>   ports are assigned to the non-root cell. Does the crash happen when
>   you type in a character to the serial line?
>
>   In this case, assign the interrupt to the non-root cell. You will need
>   it in any case there once you have a initrd and want to type in stuff.
>
> So there must be some reason why the crash happens. The hard way is to
> add 8250.nr_uarts=3D0 in your kernel cmdline of the root cell.
>
> >
> >        if I leave out the pio mapping in the non-root linux, and
> > alolothat block in the root cell instead then the non-root linux gets a
> > PIO read fault on "0x3F9" while booting.
> >        Ralf mentioned that Linux would not try enumerate the device if
> > its set to -1 ( [0x3f8/8 ... 0x3ff/8] =3D -1)  , but the non-root seems=
 to
> > attempt to do something with it anyway:
> >
> > "[    0.956146]Serial: 8250/16550 driver, 1 ports, IRQ sharing enabled"
> > "FATAL: Invalid PIO read, port: 3f9: size 1"
>
> Hmm. At least that's what I thought. I don't know how enumeration of
> platform devices works exactly, but reconsidering this, the behaviour
> above makes sense: How would it know that a platform device is not
> present, depending of the configuration of the pio_bitmap.
>
> Anyway, 8250 drivers have some cmdline parameters that can be used to
> control initialisation (e.g., see the nr_uarts parameters above).
>
> >
> >        Is it possible to map the same pio block in both the root and
> > non-root with a different mask?  Or does the non-root just override it?
> > It seems like the latter is true.
>
> Exactly. That's not a) possible, and b) does not really make sense.
>
>   Ralf
>
> >
> > Thanks again Jan and Ralf for your help getting to this point.
> >
> >
> > On Tue, Jun 11, 2019 at 2:13 PM Wayne <racedrive1503@gmail.com
> > <mailto:racedrive1503@gmail.com>> wrote:
> >
> >     Jan & Ralf:
> >
> >     I have a little good news, I have successfully gotten the non-root
> >     linux to display some startup output based on your suggestions.
> >     Also, there must have been some small difference between the stock
> >     linux-x86-demo cell config and the one I tweaked.  I went back to
> >     the original and made some minor changes and it started displaying
> >     the serial output now for the non-root node.
> >
> >     I ended up making the root cell the primary user of the ttyS0
> >     device, and just having the non-root linux output to the hypervisor
> >     virtual console (console=3Djailhouse).  In my setup, there appears =
to
> >     be some process still attempting to use the ttyS0 randomly on the
> >     root linux, and that causes the hypervisor to halt it if I don't
> >     leave it in the PIO array.  Not sure who is doing it.
> >
> >
> >     This is where i'm at now.  The non-root linux keeps running into
> >     points where it tries to access PIO and gets parked:
> >
> >     1. First crash:
> >
> >     [    0.424925]kworker/u6:0 (27) used greated stack depth: 14656
> >     bytes left
> >     [    0.425807]futex has table entries: 1024 (order: 4, 65536 bytes)
> >     "FATAL: Invalid PIO write, port: 70: size 1"
> >     ...
> >     Parking CPU 3 (Cell: "linux-x86-demo")
> >
> >     According to /proc/ioports, 70 has to do with the Realtime clock
> >     (rtc0).  I was able to temporarily add the 70 mapping to the
> >     non-root linux, but should it be there at all?  I tried to disable
> >     RTC support in the guest kernel config.
> >
> >
> >     2. On the next attempt, I then got further with a crash trying to
> >     initialize Ser device ttyS0:
> >
> >     "[    0.956146]Serial: 8250/16550 driver, 1 ports, IRQ sharing
> enabled"
> >     "FATAL: Invalid PIO read, port: 3f9: size 1"
> >     ...
> >     Parking CPU 3 (Cell: "linux-x86-demo")
> >
> >     I can get around that if I allow the non-root access in its pio
> >     table, but then I have a problem above with the root linux randomly
> >     trying to use it.
> >
> >
> >     3. Now with the temporary adjustments to the non-root pio table
> >     above I get here:
> >
> >     "[    0.972399]clocksource:Switched to clocksource tsc"
> >     "FATAL: Invalid PIO read, port: 87: size 1"
> >     ...
> >     Parking CPU 3 (Cell: "linux-x86-demo")
> >
> >     According to proc/ioports this one has to do with "dma page
> >     request". It isn't mapped in my root linux PIO or non-root linux
> array.
> >
> >
> >     Aside from the serial conflict, it seems like these should remain
> >     controlled by the root linux or hypervisor.   Do you use a
> >     particular bare minimum x86 kernel config on your machine for the
> >     guest to get around these?  I know Jan mentioned the
> >     jailhouse-images project might have something, but I couldn't find
> >     it digging around quick.
> >
> >     Thanks to you both for your responses and patience.  I got the root
> >     linux up and going on my own, but the non-root guest is proving to
> >     be more difficult.
> >
> >     Wayne
> >
> >
> >
> >     On Tue, Jun 11, 2019 at 11:31 AM Ralf Ramsauer
> >     <ralf.ramsauer@oth-regensburg.de
> >     <mailto:ralf.ramsauer@oth-regensburg.de>> wrote:
> >
> >         Hi,
> >
> >         On 6/10/19 7:45 PM, Wayne wrote:
> >         > Thank you for your responses Ralf and Jan.
> >         >
> >         > Yes, I have successfully gotten both the apic-demo and
> >         tiny-demo cells
> >         > to work on my system before attempting to load the non-root
> >         linux.  I
> >         > can see serial output from them.
> >         >
> >         > However, if I try to share the UART between root and inmate
> >         for them I
> >         > run into a crash on the hypervisor if the root linux attempts
> >         to write
> >         > to the UART (after creating/starting a demo).  Does the root
> >         linux lose
> >         > access once an inmate is created/started?  Or am I missing
> >         something
> >         > from my System config or tiny-demo config that allows them to
> >         share?  I
> >         > attached the crash in hypervisor_output.txt.
> >         >
> >         > Also, I noticed the tiny-demo output on the UART gets mirrore=
d
> >         on the
> >
> >         Yes, according to your config,
> >         JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE is
> >         set. This means that the guest will use the virtual console. Th=
e
> >         virtual
> >         console uses the hypervisor output which depends whatever is se=
t
> >         in your
> >         system configuration. In your case the hypervisor uses 3f8.
> >
> >         And additionally, the inmate also a valid .console set. Again,
> >         3f8. This
> >         means, it will use the console *and* the hypervisor debug
> >         hypercall. In
> >         your case, both outputs are routed to the same device which
> >         explains the
> >         mirroring.
> >
> >         > Jailhouse virtual console.  Does that mean that its writing t=
o
> the
> >         > serial through the hypervisor and not directly accessing ttyS=
0
> >         itself?
> >
> >         Exactly.
> >
> >         > If so, is there a way to create the cell to write ttyS0
> >         directly as a
> >         > test?  To see if it exhibits same behavior as the non-root
> linux.
> >
> >         Sure, simply align the .address field of .console, and allow
> >         access to
> >         that port via .pio_bitmap.
> >
> >         >
> >         > FYI, I create the tiny-demo like this:
> >         >
> >         > jailhouse cell create configs/x86/tiny-demo.cell
> >         > jailhouse cell load tiny-demo inmates/demos/x86/tiny-demo.cel=
l
>
> >         > jailhouse cell start tiny-demo
> >         >
> >         > Going back to my original non-root linux question, I don't se=
e
> any
> >         > output when connected over ttyS0.  Its address is 0x3f8
> >         ("serial 1") in
> >         > the PIO, and that seems to work fine for the other simple
> >         demos, minus
> >         > the hypervisor crash issue above when sharing.  I know there
> >         is the
> >         > other "serial 2" port but I haven't tried to use that one.
> >
> >         I see that port on our Dell server as well. It's present, but I
> >         don't
> >         know where it's connected to.
> >
> >         Let me just summarise your issue:
> >
> >         You only have one serial line available, right? From the
> root-cell's
> >         POV, it's ttyS0 on 3f8.
> >
> >         I would propose to share ttyS0 between the hypervisor and
> non-root
> >         Linux. This means:
> >
> >           - Don't let the root-cell use ttyS0. Remove any console=3Dtty=
S0
> >             parameters from you commandline. Ensure that noone else
> accesses
> >             ttyS0 (e.g., getty@ttyS0 or other friends)
> >
> >           - Set 3f8 as debug_console in your master.c (seems you alread=
y
> >         have)
> >
> >           - Allow 3f8 access in the linux-demo.c (already set in the
> default
> >             linux-demo
> >
> >           - Disallow 2f8 access in linux-demo.c:
> >         -               [ 0x2f8/8 ...  0x2ff/8] =3D 0, /* serial2 */
> >         +               [ 0x2f8/8 ...  0x2ff/8] =3D -1, /* serial2 */
> >
> >             I don't know how Linux enumerates serial devices, but this
> >         ensures
> >             that Linux won't see the unconnected serial line and map
> >         ttyS0 to
> >             3f8
> >
> >         >
> >         > non root linux launched with:
> >         > /tools/jailhouse cell linux configs/x86/linux-x86.cell
> >         > /boot/vmlinux-4.1.16-Guest -c "console=3DttyS0,115200"
> >
> >         Then, this should actually work...
> >
> >         And if not, then console=3Djailhouse0 should work.
> >
> >         >
> >         > I can try the 4.19 siemens kernel and "next" branch for
> >         jailhouse you
> >         > suggested.  Do you think that combination will resolve the
> missing
> >         > serial for the non-root linux?  Otherwise, did my kernel
> >         config, system
> >         > config, and non-root linux cell configs look OK?
> >
> >         I didn't look at it, but we should at least - even if some flag=
s
> are
> >         still incorrect - see the "Uncompressing kernel..." thing.
> >
> >         Wait -- one thing you could try: Deactivate CONFIG_EFI and
> >         especially
> >         CONFIG_EFI_STUBS. I'm not sure, but it could be that EFI_STUBS
> >         change
> >         the header format that our bootloader patches.
> >
> >         >
> >         > Thanks again for your help.
> >
> >         No problem. But it's not yet working. ;-)
> >
> >           Ralf
> >
> >         >
> >         >
> >         > On Fri, Jun 7, 2019 at 5:30 PM Ralf Ramsauer
> >         > <ralf.ramsauer@oth-regensburg.de
> >         <mailto:ralf.ramsauer@oth-regensburg.de>
> >         > <mailto:ralf.ramsauer@oth-regensburg.de
> >         <mailto:ralf.ramsauer@oth-regensburg.de>>> wrote:
> >         >
> >         >     Hi Wayne,
> >         >
> >         >     On 6/7/19 10:04 PM, Wayne wrote:
> >         >     > Hi Ralf,
> >         >     >
> >         >     > Thank you for your responses.  I have attached the
> >         requested config
> >         >     > files.  I am now just trying to use the same bzImage fo=
r
> >         the root and
> >         >     > the non-root linux node.
> >         >
> >         >     One question that you didn't answer: do apic-demo or
> >         tiny-demo work?
> >         >     They need to to have correct .console parameter set, so
> >         ensure that
> >         >     parameters are set if you run those demos in your
> >         linux-demo cell. Just
> >         >     compare it to tiny-demo.c or apic-demo.c
> >         >
> >         >     >
> >         >     > Yes, I am using vanilla 4.16 because the documentation
> >         indicated
> >         >     that it
> >         >     > is the first mainline release to officially support
> >         Jailhouse Guest
> >         >     > images.  Do you suggest that I use something else?
> >         >
> >         >     As Jan already wrote: Try to use Siemens' 4.19 branch.
> >         >
> >         >     >
> >         >     > Right now i'm just trying to get some serial output fro=
m
> >         the non-root
> >         >     > Linux.  Hopefully, I have that configured correctly.
> >         Ideally, I would
> >         >     > like to share the same serial console for the Root node
> >         and non-root
> >         >     > node eventually if possible.  I have been OK with using
> >         the virtual
> >         >     > console (jailhouse console -f) for the Hypervisor outpu=
t.
> >         >
> >         >     In addition to Jan's comment:
> >         >
> >         >     Currently you only have access to the jailhouse console
> >         via 'jailhouse
> >         >     console' from your root cell. Imagine your root cell
> >         crashes for some
> >         >     reason. You will never see the fault reason, which makes
> >         things hard to
> >         >     debug.
> >         >
> >         >     I would suggest to configure the hypervisor to use the
> >         serial console.
> >         >     You can share the device with the non-root Linux, that's
> >         no problem.
> >         >
> >         >     In this case, the non-root kernel's output will always be
> >         printed to the
> >         >     serial console. Directly, if you choose console=3DttySx, =
and
> >         indirectly
> >         >     via the hypervisor if you choose console=3Djailhouse.
> >         >
> >         >     BTW: According to your config, your system is a PowerEdge=
,
> >         and the
> >         >     non-root cell gets both, 0x2f8 and 0x3f8. Are you sure
> >         that ttyS1 is the
> >         >     correct console that you are connected to?
> >         >
> >         >     Just mentioning this as we have a similar machine here,
> >         and, afair, both
> >         >     platform serial device are 'usable', but one ends in the
> >         nirvana while
> >         >     it is accessible.
> >         >
> >         >     Ah, and one last thing: try to switch to the current next
> >         branch for
> >         >     jailhouse. Jan just integrated a few patches from me that
> >         might also be
> >         >     relevant for your machine.
> >         >
> >         >     HTH
> >         >       Ralf
> >         >
> >         >     >
> >         >     > Wayne
> >         >     >
> >         >     > On Fri, Jun 7, 2019 at 9:10 AM Ralf Ramsauer
> >         >     > <ralf.ramsauer@oth-regensburg.de
> >         <mailto:ralf.ramsauer@oth-regensburg.de>
> >         >     <mailto:ralf.ramsauer@oth-regensburg.de
> >         <mailto:ralf.ramsauer@oth-regensburg.de>>
> >         >     > <mailto:ralf.ramsauer@oth-regensburg.de
> >         <mailto:ralf.ramsauer@oth-regensburg.de>
> >         >     <mailto:ralf.ramsauer@oth-regensburg.de
> >         <mailto:ralf.ramsauer@oth-regensburg.de>>>> wrote:
> >         >     >
> >         >     >     Hi,
> >         >     >
> >         >     >     On 6/7/19 2:28 PM, Wayne wrote:
> >         >     >     > Hello,
> >         >     >     >
> >         >     >     > I am new to Linux development and Jailhouse.  I
> have
> >         >     successfully
> >         >     >     booted
> >         >     >     > the Jailhouse Hypervisor and root cell on a bare
> >         metal X86 Linux
> >         >     >     system
> >         >     >     > (No QEMU).  I am now trying to load a non-root
> >         Linux cell
> >         >     and I have a
> >         >     >     > few questions.  Jailhouse accepts and starts my
> >         non-root
> >         >     linux cell
> >         >     >     > configuration and I see it as "running" through t=
he
> >         >     "jailhouse cell
> >         >     >     > list" command.  However, I don't see any serial
> >         output from the
> >         >     >     > "non-root linux" cell booting up.  I=E2=80=99m no=
t sure
> >         what the
> >         >     non-root node
> >         >     >     > is doing at this point.
> >         >     >
> >         >     >     Ok, first of all, can you see any output from
> >         Jailhouse's demo
> >         >     inmates
> >         >     >     (e.g., tiny-demo or apic-demo)?
> >         >     >
> >         >     >     >
> >         >     >     >                My root node is a 4.16 kernel
> >         configured this
> >         >     way:
> >         >     >     >                               1.
> >         CONFIG_JAILHOUSE_GUEST is
> >         >     not set
> >         >     >     >                               2. CONFIG_SERIO=3Dy
> >         >     >     >                               3.
> >         >     CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> >         >     >     >
> >         >     >     >                My non-root node is a 4.16 kernel
> >         configured
> >         >     this way:
> >         >     >     >                               1.
> >         CONFIG_JAILHOUSE_GUEST=3Dy
> >         >     >     >                               2. CONFIG_SERIO=3Dm
> >         (can't seem
> >         >     to disable
> >         >     >     > completely in my config for 4.16)
> >         >     >     >                               3.
> >         >     CONFIG_SERIAL_8250_RUNTIME_UARTS=3D1
> >         >     >
> >         >     >     Could you please provide a full .config? What branc=
h
> >         are you
> >         >     exactly
> >         >     >     using? Vanilla 4.16?
> >         >     >
> >         >     >     Please attach your system config and your non-root
> linux
> >         >     config as well.
> >         >     >
> >         >     >     You may also want to try
> >         https://github.com/siemens/linux . See
> >         >     >     jailhouse-enabling branches for some releases.
> >         >     >
> >         >     >     >
> >         >     >     > In general, do the kernel config settings have to
> >         match between
> >         >     >     the root
> >         >     >     > node and non-linux or is the above fine?
> >         >     >
> >         >     >     No, they do not have to be the same, but they can.
> >         Still, an
> >         >     analysis
> >         >     >     requires your .config.
> >         >     >
> >         >     >     >
> >         >     >     > The vmlinux-4.1.16-Guest bzImage is approx 7MB,
> >         and the
> >         >     inmate node is
> >         >     >     > allocated ~75MB of RAM.
> >         >     >     >
> >         >     >     > I have a single UART, so I have configured the
> >         root cell
> >         >     system config
> >         >     >     > to output to the virtual hypervisor console:
> >         >     >
> >         >     >     Wait... You configured your root-cell to use the
> >         hypervisor debug
> >         >     >     console? How? It's only available once the
> hypervisor is
> >         >     enabled. How
> >         >     >     should this work?
> >         >     >
> >         >     >     But let's have a look at your configuration first.
> >         >     >
> >         >     >     So you want to:
> >         >     >       - Have the UART (0x3f8) available in the non-root
> cell
> >         >     >       - Use 0x3f8 as hypervisor debug console as well
> >         >     >       - No console for root-cell
> >         >     >
> >         >     >     Did I get this right?
> >         >     >
> >         >     >       Ralf
> >         >     >
> >         >     >     >
> >         >     >     > .flags =3D JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
> >         >     >     >
> >         >     >     > .debug_console =3D {
> >         >     >     > .type =3D JAILHOUSE_CON_TYPE_NONE,
> >         >     >     > },
> >         >     >     >
> >         >     >     > and I have configured the non-root linux cell to
> >         output to
> >         >     the UART:
> >         >     >     >
> >         >     >     > (Added serial 0x3f8 to pio bitmap for non-root
> >         linux) and
> >         >     started the
> >         >     >     > node with this:
> >         >     >     >
> >         >     >     > ./tools/jailhouse cell linux
> >         configs/x86/linux-x86.cell
> >         >     >     > /boot/vmlinux-4.1.16-Guest -c
> "console=3DttyS0,115200"
> >         >     >     > (Note I also tried "console=3Djailhouse" in the
> >         command above,
> >         >     and that
> >         >     >     > produces the same result)
> >         >     >     >
> >         >     >     > I then see the following on my hypervisor console
> >         >     (./tools/jailhouse
> >         >     >     > console -f):
> >         >     >     >
> >         >     >     > Created cell "linux-x86-demo"
> >         >     >     > ...
> >         >     >     > Cell "linux-x86-demo" can be loaded
> >         >     >     > Started cell "linux-x86-demo"
> >         >     >     >
> >         >     >     > After a little while I do get a parked CPU error
> >         on the root
> >         >     node,
> >         >     >     looks
> >         >     >     > like its trying to do something with the UART as
> well:
> >         >     >     > FATAL: Invalid PIO read, port: 3fe size: 1
> >         >     >     >
> >         >     >     > I would expect something to pop out on the UART
> >         from the
> >         >     non-root
> >         >     >     linux
> >         >     >     > node first.  Note that root node has serial 0x3f8
> >         disabled
> >         >     in its pio
> >         >     >     > bitmap.
> >         >     >     >
> >         >     >     > I verifed that the UART is functioning by allowin=
g
> the
> >         >     hypervisor to
> >         >     >     > print to it and also performed an echo test over
> >         ttyS0.
> >         >     >     >
> >         >     >     > I have tried several configurations of
> >         kernel.....including your
> >         >     >     current
> >         >     >     > "queues/jailhouse" branch head kernel for the
> >         non-root node,
> >         >     along
> >         >     >     with
> >         >     >     > the kernel config for 4.7 posted in this thread
> >         below (but I
> >         >     get same
> >         >     >     > result as above when I start it, no kernel output=
):
> >         >     >     >
> >         >     >     >
> >         >     >
> >         >
> >            "
> https://groups.google.com/forum/#!searchin/jailhouse-dev/Re$3A$20Failed$2=
0to$20boot$20jailhouse%7Csort:relevance/jailhouse-dev/M7UO89XFIk0/Qi40DDuMB=
AAJ
> ".
> >         >     >     >
> >         >     >     > Any information you can provide to me will be
> >         helpful.  I'm
> >         >     not sure
> >         >     >     > what might be going wrong here.
> >         >     >     >
> >         >     >     > Thanks,
> >         >     >     > Wayne
> >         >     >     >
> >         >     >     > --
> >         >     >     > You received this message because you are
> >         subscribed to the
> >         >     Google
> >         >     >     > Groups "Jailhouse" group.
> >         >     >     > To unsubscribe from this group and stop receiving
> >         emails
> >         >     from it, send
> >         >     >     > an email to
> >         jailhouse-dev+unsubscribe@googlegroups.com
> >         <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com>
> >         >     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com
> >         <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>>
> >         >     >     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.co=
m
> >         <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>
> >         >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com
> >         <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>>>
> >         >     >     > <mailto:jailhouse-dev+unsubscribe@googlegroups.co=
m
> >         <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com>
> >         >     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com
> >         <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>>
> >         >     >     <mailto:jailhouse-dev%2Bunsubscribe@googlegroups.co=
m
> >         <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com>
> >         >     <mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com
> >         <mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com>>>>.
> >         >     >     > To view this discussion on the web visit
> >         >     >     >
> >         >     >
> >         >
> >
> https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc2iKk1J6%2B0huh=
5__dS4HyujXzV9r%2BLbKLzuVZ4K3Bt5eA%40mail.gmail.com
> >         >     >     >
> >         >     >
> >         >
> >           <
> https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc2iKk1J6%2B0huh=
5__dS4HyujXzV9r%2BLbKLzuVZ4K3Bt5eA%40mail.gmail.com?utm_medium=3Demail&utm_=
source=3Dfooter
> >.
> >         >     >     > For more options, visit
> >         https://groups.google.com/d/optout.
> >         >     >
> >         >
> >
> > --
> > You received this message because you are subscribed to the Google
> > Groups "Jailhouse" group.
> > To unsubscribe from this group and stop receiving emails from it, send
> > an email to jailhouse-dev+unsubscribe@googlegroups.com
> > <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> > To view this discussion on the web visit
> >
> https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc0O2zSeuLLY3Mae=
RW7cQrWbq-6Y2BHJg%2Bx_j6nk%3DECa_A%40mail.gmail.com
> > <
> https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc0O2zSeuLLY3Mae=
RW7cQrWbq-6Y2BHJg%2Bx_j6nk%3DECa_A%40mail.gmail.com?utm_medium=3Demail&utm_=
source=3Dfooter
> >.
> > For more options, visit https://groups.google.com/d/optout.
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CA%2B%2BKhc36sP7ABEsR5Bp%2Bgpts0DUBENqV6eFDPazfs5kR_QRGaw%40m=
ail.gmail.com.
For more options, visit https://groups.google.com/d/optout.

--000000000000f3b8a5058b20c3aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ralf/Jan,<div><br></div><div>=C2=A0Are you sure you remove=
 the device from the kernel cmdline? <b>Yes, there is no ttyS* device in my=
 root linux cmdline</b><br>- Are you sure that there doesn&#39;t spawn a tt=
y? Check with systemctl. <b>No tty as far as I can tell, verified with &quo=
t;lsof | grep ttyS&quot;.=C2=A0 The lsof command stops working after the cr=
ash though</b><br>- lsof | grep ttyS<br>- The root-cell might receive the s=
erial device&#39;s interrupt, while its<br>=C2=A0 ports are assigned to the=
 non-root cell. Does the crash happen when<br>=C2=A0 you type in a characte=
r to the serial line? <b>This is possible, do you have an example of how I =
would accomplish assigning the interrupt (IRQ 4 for ttyS0) to the non-root?=
=C2=A0 To rule out the interrupt concern.</b><br><br>=C2=A0 In this case, a=
ssign the interrupt to the non-root cell. You will need<br>=C2=A0 it in any=
 case there once you have a initrd and want to type in stuff.<br><br>So the=
re must be some reason why the crash happens. The hard way is to<br>add 825=
0.nr_uarts=3D0 in your kernel cmdline of the root cell. <b>I can use this m=
ethod for now to continue booting the non-root linux.</b><span class=3D"gma=
il-im" style=3D"color:rgb(80,0,80)"><br><br>&gt;=C2=A0<br>&gt; =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if I leave out the pio mapping in the non-root linux, and<=
br>&gt; alolothat block in the root cell instead then the non-root linux ge=
ts a<br>&gt; PIO read fault on &quot;0x3F9&quot; while booting.=C2=A0 =C2=
=A0 =C2=A0 =C2=A0<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0Ralf mentioned that Li=
nux would not try enumerate the device if<br>&gt; its set to -1 (=C2=A0[0x3=
f8/8 ... 0x3ff/8] =3D -1)=C2=A0 , but the non-root seems to<br>&gt; attempt=
 to do something with it anyway:<br>&gt;=C2=A0<br>&gt; &quot;[ =C2=A0 =C2=
=A00.956146]Serial: 8250/16550 driver, 1 ports, IRQ sharing enabled&quot;<b=
r>&gt; &quot;FATAL: Invalid PIO read, port: 3f9: size 1&quot;=C2=A0=C2=A0<b=
r><br></span>Hmm. At least that&#39;s what I thought. I don&#39;t know how =
enumeration of<br>platform devices works exactly, but reconsidering this, t=
he behaviour<br>above makes sense: How would it know that a platform device=
 is not<br>present, depending of the configuration of the pio_bitmap.=C2=A0=
 =C2=A0<b> Since I do technically have two serial ports, is there a way (vi=
a command line or kernel config for ex) to hardcode what the non-root would=
 enumerate for the UART when its booting up?=C2=A0 Meaning, force it to &qu=
ot;see&quot; the 0x2f8 serial port as ttyS0 instead of 0x3f8 when booting u=
p=C2=A0 and</b><b>=C2=A0CONFIG_SERIAL_8250_RUNTIME_UARTS =3D 1</b><b>.=C2=
=A0 That way if you had say three serial ports and three cells (1 root, 2 n=
on-root linux) then each could have their own separate dedicated ttyS0.</b>=
</div><div><b><br></b></div><div>As far as just booting the non-root beside=
s the serial concern, I haven&#39;t provided an initramfs to my non-root li=
nux yet.=C2=A0 I would like to probably boot it with a simple ramdisk if po=
ssible to get a point where I can log in.=C2=A0</div><div><b><br></b></div>=
<div>Thanks,</div><div>Wayne</div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 12, 2019 at 6:43 AM Ralf Rams=
auer &lt;<a href=3D"mailto:ralf.ramsauer@oth-regensburg.de">ralf.ramsauer@o=
th-regensburg.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Hi,<br>
<br>
On 6/11/19 11:05 PM, Wayne wrote:<br>
&gt; Jan/Ralf,<br>
&gt; <br>
&gt; I was able to get past issues 1 and 3 above by using Jan&#39;s kernel =
config<br>
&gt; from this thread:<br>
&gt; <br>
&gt; <a href=3D"https://groups.google.com/forum/#!searchin/jailhouse-dev/Re=
$3A$20Failed$20to$20boot$20jailhouse%7Csort:relevance/jailhouse-dev/M7UO89X=
FIk0/Qi40DDuMBAAJ" rel=3D"noreferrer" target=3D"_blank">https://groups.goog=
le.com/forum/#!searchin/jailhouse-dev/Re$3A$20Failed$20to$20boot$20jailhous=
e%7Csort:relevance/jailhouse-dev/M7UO89XFIk0/Qi40DDuMBAAJ</a>&quot;.=C2=A0<=
br>
&gt; <br>
&gt; The DMA issue was resolved by disabling kernel option=C2=A0CONFIG_ISA_=
DMA_API<br>
&gt; as stated in another thread, and reflected in the config file above.<b=
r>
&gt; <br>
&gt; So now I think i&#39;ve almost got the non-root linux booting.=C2=A0 I=
&#39;m stuck at<br>
&gt; the point where its trying to mount a filesystem and since i&#39;m not=
<br>
&gt; providing an initramfs it panics.<br>
<br>
Perfect!<br>
<br>
&gt; <br>
&gt; Similar to the output below:<br>
&gt; <br>
&gt; [ 1.080178] VFS: Cannot open root device &quot;(null)&quot; or unknown=
-block(0,0):<br>
&gt; error -6<br>
&gt; [ 1.087662] Please append a correct &quot;root=3D&quot; boot option; h=
ere are the<br>
&gt; available partitions:<br>
&gt; [ 1.096013] Kernel panic - not syncing: VFS: Unable to mount root fs o=
n<br>
&gt; unknown-block(0,0)<br>
&gt; <br>
&gt; I have just a couple more questions:<br>
&gt; 1. In general, is it true that an inmate will takeover control from th=
e<br>
&gt; root of any resource in the following arrays, or are there some cases<=
br>
&gt; where they get &quot;shared&quot; between the root and inmate?<br>
<br>
Depends.<br>
<br>
&gt; =C2=A0 =C2=A0 =C2=A0A. &quot;.mem_regions&quot; -&gt; Shared?<br>
<br>
May be shared with the root cell (i.e., if the region has the flag<br>
JAILHOUSE_MEM_ROOTSHARED set).<br>
<br>
&gt; =C2=A0 =C2=A0 =C2=A0B. &quot;.irqchips&quot; -&gt; Shared?<br>
<br>
Shared with whom? Only one guest runs on a CPU. This guest will have<br>
full access to the irqchip. Some accesses must be intercepted.<br>
<br>
&gt; =C2=A0 =C2=A0 =C2=A0C. &quot;.pio_bitmap&quot; -&gt; Inmate takes cont=
rol of these if matching<br>
&gt; between inmate and root<br>
<br>
Exclusive control.<br>
<br>
&gt; =C2=A0 =C2=A0 =C2=A0D. &quot;.pci_devices&quot; -&gt; Inmate takes con=
trol?<br>
<br>
Exclusive control.<br>
<br>
&gt; =C2=A0 =C2=A0 =C2=A0E. &quot;.pci_caps&quot; -&gt; Inmate takes contro=
l?<br>
<br>
Exclusive control.<br>
<br>
&gt; <br>
&gt; 2. Along the same lines, going back to my ttyS0 issue mentioned above<=
br>
&gt; while trying to share it:<br>
&gt; <br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0If I allocate the following to the linux no=
n root cell (and set<br>
&gt; to -1 in the root)<br>
<br>
BTW, there&#39;s generally no need to set -1 in the root cell -- it will be=
<br>
taken away when the non-root cell is created.<br>
<br>
&gt; =C2=A0 =C2=A0 =C2=A0.pio_bitmap =3D {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [0x3f8/8 ... 0x3ff/8] =3D 0x00=C2=
=A0 =C2=A0/* serial 2*/<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; <br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0Then on the root cell I randomly get a PIO =
read fault on &quot;0x3FE&quot;<br>
&gt; when the non-root is booting, i&#39;m not sure what process is causing=
 this.<br>
<br>
- Are you sure you remove the device from the kernel cmdline?<br>
- Are you sure that there doesn&#39;t spawn a tty? Check with systemctl.<br=
>
- lsof | grep ttyS<br>
- The root-cell might receive the serial device&#39;s interrupt, while its<=
br>
=C2=A0 ports are assigned to the non-root cell. Does the crash happen when<=
br>
=C2=A0 you type in a character to the serial line?<br>
<br>
=C2=A0 In this case, assign the interrupt to the non-root cell. You will ne=
ed<br>
=C2=A0 it in any case there once you have a initrd and want to type in stuf=
f.<br>
<br>
So there must be some reason why the crash happens. The hard way is to<br>
add 8250.nr_uarts=3D0 in your kernel cmdline of the root cell.<br>
<br>
&gt; <br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0if I leave out the pio mapping in the non-r=
oot linux, and<br>
&gt; alolothat block in the root cell instead then the non-root linux gets =
a<br>
&gt; PIO read fault on &quot;0x3F9&quot; while booting.=C2=A0 =C2=A0 =C2=A0=
 =C2=A0<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0Ralf mentioned that Linux would not try enu=
merate the device if<br>
&gt; its set to -1 (=C2=A0[0x3f8/8 ... 0x3ff/8] =3D -1)=C2=A0 , but the non=
-root seems to<br>
&gt; attempt to do something with it anyway:<br>
&gt; <br>
&gt; &quot;[ =C2=A0 =C2=A00.956146]Serial: 8250/16550 driver, 1 ports, IRQ =
sharing enabled&quot;<br>
&gt; &quot;FATAL: Invalid PIO read, port: 3f9: size 1&quot;=C2=A0 <br>
<br>
Hmm. At least that&#39;s what I thought. I don&#39;t know how enumeration o=
f<br>
platform devices works exactly, but reconsidering this, the behaviour<br>
above makes sense: How would it know that a platform device is not<br>
present, depending of the configuration of the pio_bitmap.<br>
<br>
Anyway, 8250 drivers have some cmdline parameters that can be used to<br>
control initialisation (e.g., see the nr_uarts parameters above).<br>
<br>
&gt; <br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0Is it possible to map the same pio block in=
 both the root and<br>
&gt; non-root with a different mask?=C2=A0 Or does the non-root just overri=
de it?=C2=A0<br>
&gt; It seems like the latter is true.=C2=A0=C2=A0=C2=A0 <br>
<br>
Exactly. That&#39;s not a) possible, and b) does not really make sense.<br>
<br>
=C2=A0 Ralf<br>
<br>
&gt; <br>
&gt; Thanks again Jan and Ralf for your help getting to this point.<br>
&gt; <br>
&gt; <br>
&gt; On Tue, Jun 11, 2019 at 2:13 PM Wayne &lt;<a href=3D"mailto:racedrive1=
503@gmail.com" target=3D"_blank">racedrive1503@gmail.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:racedrive1503@gmail.com" target=3D"_blank=
">racedrive1503@gmail.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Jan &amp; Ralf:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I have a little good news, I have successfully gott=
en the non-root<br>
&gt;=C2=A0 =C2=A0 =C2=A0linux to display some startup output based on your =
suggestions.=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0Also, there must have been some small difference be=
tween the stock<br>
&gt;=C2=A0 =C2=A0 =C2=A0linux-x86-demo cell config and the one I tweaked.=
=C2=A0 I went back to<br>
&gt;=C2=A0 =C2=A0 =C2=A0the original and made some minor changes and it sta=
rted displaying<br>
&gt;=C2=A0 =C2=A0 =C2=A0the serial output now for the non-root node.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I ended up making the root cell the primary user of=
 the ttyS0<br>
&gt;=C2=A0 =C2=A0 =C2=A0device, and just having the non-root linux output t=
o the hypervisor<br>
&gt;=C2=A0 =C2=A0 =C2=A0virtual console (console=3Djailhouse).=C2=A0 In my =
setup, there appears to<br>
&gt;=C2=A0 =C2=A0 =C2=A0be some process still attempting to use the ttyS0 r=
andomly on the<br>
&gt;=C2=A0 =C2=A0 =C2=A0root linux, and that causes the hypervisor to halt =
it if I don&#39;t<br>
&gt;=C2=A0 =C2=A0 =C2=A0leave it in the PIO array.=C2=A0 Not sure who is do=
ing it.<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0This is where i&#39;m at now.=C2=A0 The non-root li=
nux keeps running into<br>
&gt;=C2=A0 =C2=A0 =C2=A0points where it tries to access PIO and gets parked=
:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A01. First crash:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0[ =C2=A0 =C2=A00.424925]kworker/u6:0 (27) used grea=
ted stack depth: 14656<br>
&gt;=C2=A0 =C2=A0 =C2=A0bytes left<br>
&gt;=C2=A0 =C2=A0 =C2=A0[ =C2=A0 =C2=A00.425807]futex has table entries: 10=
24 (order: 4, 65536 bytes)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;FATAL: Invalid PIO write, port: 70: size 1&qu=
ot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0...<br>
&gt;=C2=A0 =C2=A0 =C2=A0Parking CPU 3 (Cell: &quot;linux-x86-demo&quot;)<br=
>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0According to /proc/ioports, 70 has to do with the R=
ealtime clock<br>
&gt;=C2=A0 =C2=A0 =C2=A0(rtc0).=C2=A0 I was able to temporarily add the 70 =
mapping to the<br>
&gt;=C2=A0 =C2=A0 =C2=A0non-root linux, but should it be there at all?=C2=
=A0 I tried to disable<br>
&gt;=C2=A0 =C2=A0 =C2=A0RTC support in the guest kernel config.<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A02. On the next attempt, I then got further with a c=
rash trying to<br>
&gt;=C2=A0 =C2=A0 =C2=A0initialize Ser device ttyS0:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;[ =C2=A0 =C2=A00.956146]Serial: 8250/16550 dr=
iver, 1 ports, IRQ sharing enabled&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;FATAL: Invalid PIO read, port: 3f9: size 1&qu=
ot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0...<br>
&gt;=C2=A0 =C2=A0 =C2=A0Parking CPU 3 (Cell: &quot;linux-x86-demo&quot;)<br=
>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I can get around that if I allow the non-root acces=
s in its pio<br>
&gt;=C2=A0 =C2=A0 =C2=A0table, but then I have a problem above with the roo=
t linux randomly<br>
&gt;=C2=A0 =C2=A0 =C2=A0trying to use it.<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A03. Now with the temporary adjustments to the non-ro=
ot pio table<br>
&gt;=C2=A0 =C2=A0 =C2=A0above I get here:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;[ =C2=A0 =C2=A00.972399]clocksource:Switched =
to clocksource tsc&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;FATAL: Invalid PIO read, port: 87: size 1&quo=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0...<br>
&gt;=C2=A0 =C2=A0 =C2=A0Parking CPU 3 (Cell: &quot;linux-x86-demo&quot;)<br=
>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0According to proc/ioports this one has to do with &=
quot;dma page<br>
&gt;=C2=A0 =C2=A0 =C2=A0request&quot;. It isn&#39;t mapped in my root linux=
 PIO or non-root linux array.<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Aside from the serial conflict, it seems like these=
 should remain<br>
&gt;=C2=A0 =C2=A0 =C2=A0controlled by the root linux or hypervisor.=C2=A0 =
=C2=A0Do you use a<br>
&gt;=C2=A0 =C2=A0 =C2=A0particular bare minimum x86 kernel config on your m=
achine for the<br>
&gt;=C2=A0 =C2=A0 =C2=A0guest to get around these?=C2=A0 I know Jan mention=
ed the<br>
&gt;=C2=A0 =C2=A0 =C2=A0jailhouse-images project might have something, but =
I couldn&#39;t find<br>
&gt;=C2=A0 =C2=A0 =C2=A0it digging around quick.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Thanks to you both for your responses and patience.=
=C2=A0 I got the root<br>
&gt;=C2=A0 =C2=A0 =C2=A0linux up and going on my own, but the non-root gues=
t is proving to<br>
&gt;=C2=A0 =C2=A0 =C2=A0be more difficult.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Wayne<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Tue, Jun 11, 2019 at 11:31 AM Ralf Ramsauer<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:ralf.ramsauer@oth-regensburg.=
de" target=3D"_blank">ralf.ramsauer@oth-regensburg.de</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:ralf.ramsauer@oth-rege=
nsburg.de" target=3D"_blank">ralf.ramsauer@oth-regensburg.de</a>&gt;&gt; wr=
ote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Hi,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On 6/10/19 7:45 PM, Wayne wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Thank you for your responses Ral=
f and Jan.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Yes, I have successfully gotten =
both the apic-demo and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tiny-demo cells<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; to work on my system before atte=
mpting to load the non-root<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linux.=C2=A0 I<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; can see serial output from them.=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; However, if I try to share the U=
ART between root and inmate<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for them I<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; run into a crash on the hypervis=
or if the root linux attempts<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to write<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; to the UART (after creating/star=
ting a demo).=C2=A0 Does the root<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linux lose<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; access once an inmate is created=
/started?=C2=A0 Or am I missing<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0something<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; from my System config or tiny-de=
mo config that allows them to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0share?=C2=A0 I<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; attached the crash in hypervisor=
_output.txt.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Also, I noticed the tiny-demo ou=
tput on the UART gets mirrored<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0on the<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Yes, according to your config,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE=
 is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set. This means that the guest will u=
se the virtual console. The<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virtual<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0console uses the hypervisor output wh=
ich depends whatever is set<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in your<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0system configuration. In your case th=
e hypervisor uses 3f8.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0And additionally, the inmate also a v=
alid .console set. Again,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A03f8. This<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0means, it will use the console *and* =
the hypervisor debug<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hypercall. In<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0your case, both outputs are routed to=
 the same device which<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0explains the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mirroring.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Jailhouse virtual console.=C2=A0=
 Does that mean that its writing to the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; serial through the hypervisor an=
d not directly accessing ttyS0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0itself?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Exactly.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; If so, is there a way to create =
the cell to write ttyS0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0directly as a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; test?=C2=A0 To see if it exhibit=
s same behavior as the non-root linux.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Sure, simply align the .address field=
 of .console, and allow<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0access to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0that port via .pio_bitmap.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; FYI, I create the tiny-demo like=
 this:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; jailhouse cell create configs/x8=
6/tiny-demo.cell<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; jailhouse cell load tiny-demo in=
mates/demos/x86/tiny-demo.cell =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; jailhouse cell start tiny-demo<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Going back to my original non-ro=
ot linux question, I don&#39;t see any<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; output when connected over ttyS0=
.=C2=A0 Its address is 0x3f8<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(&quot;serial 1&quot;) in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; the PIO, and that seems to work =
fine for the other simple<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0demos, minus<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; the hypervisor crash issue above=
 when sharing.=C2=A0 I know there<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0is the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; other &quot;serial 2&quot; port =
but I haven&#39;t tried to use that one.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I see that port on our Dell server as=
 well. It&#39;s present, but I<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0don&#39;t<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0know where it&#39;s connected to.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Let me just summarise your issue:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0You only have one serial line availab=
le, right? From the root-cell&#39;s<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0POV, it&#39;s ttyS0 on 3f8.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I would propose to share ttyS0 betwee=
n the hypervisor and non-root<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Linux. This means:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 - Don&#39;t let the root-cell =
use ttyS0. Remove any console=3DttyS0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 parameters from you com=
mandline. Ensure that noone else accesses<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 ttyS0 (e.g., getty@ttyS=
0 or other friends)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 - Set 3f8 as debug_console in =
your master.c (seems you already<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0have)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 - Allow 3f8 access in the linu=
x-demo.c (already set in the default<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 linux-demo<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 - Disallow 2f8 access in linux=
-demo.c:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0[ 0x2f8/8 ...=C2=A0 0x2ff/8] =3D 0, /* serial2 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0[ 0x2f8/8 ...=C2=A0 0x2ff/8] =3D -1, /* serial2 */<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 I don&#39;t know how Li=
nux enumerates serial devices, but this<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ensures<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 that Linux won&#39;t se=
e the unconnected serial line and map<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ttyS0 to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 3f8<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; non root linux launched with:<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; /tools/jailhouse cell linux conf=
igs/x86/linux-x86.cell<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; /boot/vmlinux-4.1.16-Guest -c &q=
uot;console=3DttyS0,115200&quot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Then, this should actually work...<br=
>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0And if not, then console=3Djailhouse0=
 should work.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I can try the 4.19 siemens kerne=
l and &quot;next&quot; branch for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0jailhouse you<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; suggested.=C2=A0 Do you think th=
at combination will resolve the missing<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; serial for the non-root linux?=
=C2=A0 Otherwise, did my kernel<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0config, system<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; config, and non-root linux cell =
configs look OK?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I didn&#39;t look at it, but we shoul=
d at least - even if some flags are<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0still incorrect - see the &quot;Uncom=
pressing kernel...&quot; thing.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Wait -- one thing you could try: Deac=
tivate CONFIG_EFI and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0especially<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CONFIG_EFI_STUBS. I&#39;m not sure, b=
ut it could be that EFI_STUBS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0change<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the header format that our bootloader=
 patches.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Thanks again for your help.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0No problem. But it&#39;s not yet work=
ing. ;-)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 Ralf<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; On Fri, Jun 7, 2019 at 5:30 PM R=
alf Ramsauer<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &lt;<a href=3D"mailto:ralf.ramsa=
uer@oth-regensburg.de" target=3D"_blank">ralf.ramsauer@oth-regensburg.de</a=
><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:ralf.ram=
sauer@oth-regensburg.de" target=3D"_blank">ralf.ramsauer@oth-regensburg.de<=
/a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &lt;mailto:<a href=3D"mailto:ral=
f.ramsauer@oth-regensburg.de" target=3D"_blank">ralf.ramsauer@oth-regensbur=
g.de</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:ralf.ram=
sauer@oth-regensburg.de" target=3D"_blank">ralf.ramsauer@oth-regensburg.de<=
/a>&gt;&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Hi Wayne,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0On 6/7/19 10:=
04 PM, Wayne wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Hi Ralf,=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Thank yo=
u for your responses.=C2=A0 I have attached the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0requested config<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; files.=
=C2=A0 I am now just trying to use the same bzImage for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the root and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; the non-=
root linux node.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0One question =
that you didn&#39;t answer: do apic-demo or<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tiny-demo work?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0They need to =
to have correct .console parameter set, so<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ensure that<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0parameters ar=
e set if you run those demos in your<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linux-demo cell. Just<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0compare it to=
 tiny-demo.c or apic-demo.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Yes, I a=
m using vanilla 4.16 because the documentation<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0indicated<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0that it<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; is the f=
irst mainline release to officially support<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Jailhouse Guest<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; images.=
=C2=A0 Do you suggest that I use something else?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0As Jan alread=
y wrote: Try to use Siemens&#39; 4.19 branch.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Right no=
w i&#39;m just trying to get some serial output from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the non-root<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Linux.=
=C2=A0 Hopefully, I have that configured correctly.=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Ideally, I would<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; like to =
share the same serial console for the Root node<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and non-root<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; node eve=
ntually if possible.=C2=A0 I have been OK with using<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the virtual<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; console =
(jailhouse console -f) for the Hypervisor output.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0In addition t=
o Jan&#39;s comment:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Currently you=
 only have access to the jailhouse console<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0via &#39;jailhouse<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0console&#39; =
from your root cell. Imagine your root cell<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crashes for some<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0reason. You w=
ill never see the fault reason, which makes<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0things hard to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0debug.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0I would sugge=
st to configure the hypervisor to use the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0serial console.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0You can share=
 the device with the non-root Linux, that&#39;s<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0no problem.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0In this case,=
 the non-root kernel&#39;s output will always be<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printed to the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0serial consol=
e. Directly, if you choose console=3DttySx, and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0indirectly<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0via the hyper=
visor if you choose console=3Djailhouse.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0BTW: Accordin=
g to your config, your system is a PowerEdge,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0non-root cell=
 gets both, 0x2f8 and 0x3f8. Are you sure<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0that ttyS1 is the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0correct conso=
le that you are connected to?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Just mentioni=
ng this as we have a similar machine here,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and, afair, both<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0platform seri=
al device are &#39;usable&#39;, but one ends in the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nirvana while<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0it is accessi=
ble.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Ah, and one l=
ast thing: try to switch to the current next<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0branch for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0jailhouse. Ja=
n just integrated a few patches from me that<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0might also be<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0relevant for =
your machine.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0HTH<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 Ralf<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Wayne<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; On Fri, =
Jun 7, 2019 at 9:10 AM Ralf Ramsauer<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &lt;<a h=
ref=3D"mailto:ralf.ramsauer@oth-regensburg.de" target=3D"_blank">ralf.ramsa=
uer@oth-regensburg.de</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:ralf.ram=
sauer@oth-regensburg.de" target=3D"_blank">ralf.ramsauer@oth-regensburg.de<=
/a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a=
 href=3D"mailto:ralf.ramsauer@oth-regensburg.de" target=3D"_blank">ralf.ram=
sauer@oth-regensburg.de</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:ralf.ram=
sauer@oth-regensburg.de" target=3D"_blank">ralf.ramsauer@oth-regensburg.de<=
/a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &lt;mail=
to:<a href=3D"mailto:ralf.ramsauer@oth-regensburg.de" target=3D"_blank">ral=
f.ramsauer@oth-regensburg.de</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:ralf.ram=
sauer@oth-regensburg.de" target=3D"_blank">ralf.ramsauer@oth-regensburg.de<=
/a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a=
 href=3D"mailto:ralf.ramsauer@oth-regensburg.de" target=3D"_blank">ralf.ram=
sauer@oth-regensburg.de</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:ralf.ram=
sauer@oth-regensburg.de" target=3D"_blank">ralf.ramsauer@oth-regensburg.de<=
/a>&gt;&gt;&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0Hi,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0On 6/7/19 2:28 PM, Wayne wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; Hello,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; I am new to Linux development and Jailhouse.=C2=A0 I have=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0successfully<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0booted<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; the Jailhouse Hypervisor and root cell on a bare<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0metal X86 Linux<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0system<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; (No QEMU).=C2=A0 I am now trying to load a non-root<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Linux cell<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0and I have a<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; few questions.=C2=A0 Jailhouse accepts and starts my<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0non-root<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0linux cell<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; configuration and I see it as &quot;running&quot; through=
 the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&quot;jailhou=
se cell<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; list&quot; command.=C2=A0 However, I don&#39;t see any se=
rial<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0output from the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; &quot;non-root linux&quot; cell booting up.=C2=A0 I=E2=80=
=99m not sure<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0what the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0non-root node=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; is doing at this point.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0Ok, first of all, can you see any output from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Jailhouse&#39;s demo<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0inmates<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0(e.g., tiny-demo or apic-demo)?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0My=
 root node is a 4.16 kernel<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0configured this<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0way:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CONFIG_JAILHOUSE_GUEST is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0not set<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2. CONFIG_SERIO=3Dy<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0CONFIG_SERIAL=
_8250_RUNTIME_UARTS=3D4<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0My=
 non-root node is a 4.16 kernel<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0configured<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0this way:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CONFIG_JAILHOUSE_GUEST=3Dy<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2. CONFIG_SERIO=3Dm<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(can&#39;t seem<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0to disable<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; completely in my config for 4.16)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0CONFIG_SERIAL=
_8250_RUNTIME_UARTS=3D1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0Could you please provide a full .config? What branch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0are you<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0exactly<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0using? Vanilla 4.16?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0Please attach your system config and your non-root linux<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0config as wel=
l.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0You may also want to try<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/siemens=
/linux" rel=3D"noreferrer" target=3D"_blank">https://github.com/siemens/lin=
ux</a> . See<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0jailhouse-enabling branches for some releases.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; In general, do the kernel config settings have to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0match between<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0the root<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; node and non-linux or is the above fine?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0No, they do not have to be the same, but they can.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Still, an<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0analysis<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0requires your .config.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; The vmlinux-4.1.16-Guest bzImage is approx 7MB,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0inmate node i=
s<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; allocated ~75MB of RAM.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; I have a single UART, so I have configured the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0root cell<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0system config=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; to output to the virtual hypervisor console:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0Wait... You configured your root-cell to use the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hypervisor debug<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0console? How? It&#39;s only available once the hypervisor is<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0enabled. How<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0should this work?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0But let&#39;s have a look at your configuration first.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0So you want to:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0=C2=A0 - Have the UART (0x3f8) available in the non-root cell<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0=C2=A0 - Use 0x3f8 as hypervisor debug console as well<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0=C2=A0 - No console for root-cell<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0Did I get this right?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0=C2=A0 Ralf<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; .flags =3D JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; .debug_console =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; .type =3D JAILHOUSE_CON_TYPE_NONE,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; and I have configured the non-root linux cell to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0output to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0the UART:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; (Added serial 0x3f8 to pio bitmap for non-root<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linux) and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0started the<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; node with this:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; ./tools/jailhouse cell linux<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0configs/x86/linux-x86.cell<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; /boot/vmlinux-4.1.16-Guest -c &quot;console=3DttyS0,11520=
0&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; (Note I also tried &quot;console=3Djailhouse&quot; in the=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0command above,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0and that<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; produces the same result)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; I then see the following on my hypervisor console<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0(./tools/jail=
house<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; console -f):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; Created cell &quot;linux-x86-demo&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; ...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; Cell &quot;linux-x86-demo&quot; can be loaded<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; Started cell &quot;linux-x86-demo&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; After a little while I do get a parked CPU error<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0on the root<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0node,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0looks<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; like its trying to do something with the UART as well:<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; FATAL: Invalid PIO read, port: 3fe size: 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; I would expect something to pop out on the UART<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0non-root<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0linux<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; node first.=C2=A0 Note that root node has serial 0x3f8<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0disabled<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0in its pio<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; bitmap.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; I verifed that the UART is functioning by allowing the<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0hypervisor to=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; print to it and also performed an echo test over<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ttyS0.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; I have tried several configurations of<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kernel.....including your<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0current<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; &quot;queues/jailhouse&quot; branch head kernel for the<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0non-root node,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0along<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0with<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; the kernel config for 4.7 posted in this thread<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0below (but I<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0get same<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; result as above when I start it, no kernel output):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0&quot;<a href=3D"ht=
tps://groups.google.com/forum/#!searchin/jailhouse-dev/Re$3A$20Failed$20to$=
20boot$20jailhouse%7Csort:relevance/jailhouse-dev/M7UO89XFIk0/Qi40DDuMBAAJ"=
 rel=3D"noreferrer" target=3D"_blank">https://groups.google.com/forum/#!sea=
rchin/jailhouse-dev/Re$3A$20Failed$20to$20boot$20jailhouse%7Csort:relevance=
/jailhouse-dev/M7UO89XFIk0/Qi40DDuMBAAJ</a>&quot;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; Any information you can provide to me will be<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0helpful.=C2=A0 I&#39;m<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0not sure<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; what might be going wrong here.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; Thanks,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; Wayne<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; --<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; You received this message because you are<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subscribed to the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Google<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; Groups &quot;Jailhouse&quot; group.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; To unsubscribe from this group and stop receiving<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0emails<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0from it, send=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; an email to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:jailhouse-dev%2Buns=
ubscribe@googlegroups.com" target=3D"_blank">jailhouse-dev+unsubscribe@goog=
legroups.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jailhous=
e-dev%252Bunsubscribe@googlegroups.com" target=3D"_blank">jailhouse-dev%2Bu=
nsubscribe@googlegroups.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a=
 href=3D"mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com" target=3D"_=
blank">jailhouse-dev%2Bunsubscribe@googlegroups.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jailhous=
e-dev%25252Bunsubscribe@googlegroups.com" target=3D"_blank">jailhouse-dev%2=
52Bunsubscribe@googlegroups.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jailhouse-dev%252Bunsubscribe@goo=
glegroups.com" target=3D"_blank">jailhouse-dev%2Bunsubscribe@googlegroups.c=
om</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jailhous=
e-dev%25252Bunsubscribe@googlegroups.com" target=3D"_blank">jailhouse-dev%2=
52Bunsubscribe@googlegroups.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a=
 href=3D"mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com" target=3D=
"_blank">jailhouse-dev%252Bunsubscribe@googlegroups.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jailhous=
e-dev%2525252Bunsubscribe@googlegroups.com" target=3D"_blank">jailhouse-dev=
%25252Bunsubscribe@googlegroups.com</a>&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; &lt;mailto:<a href=3D"mailto:jailhouse-dev%2Bunsubscribe@=
googlegroups.com" target=3D"_blank">jailhouse-dev+unsubscribe@googlegroups.=
com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jailhous=
e-dev%252Bunsubscribe@googlegroups.com" target=3D"_blank">jailhouse-dev%2Bu=
nsubscribe@googlegroups.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a=
 href=3D"mailto:jailhouse-dev%252Bunsubscribe@googlegroups.com" target=3D"_=
blank">jailhouse-dev%2Bunsubscribe@googlegroups.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jailhous=
e-dev%25252Bunsubscribe@googlegroups.com" target=3D"_blank">jailhouse-dev%2=
52Bunsubscribe@googlegroups.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jailhouse-dev%252Bunsubscribe@goo=
glegroups.com" target=3D"_blank">jailhouse-dev%2Bunsubscribe@googlegroups.c=
om</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jailhous=
e-dev%25252Bunsubscribe@googlegroups.com" target=3D"_blank">jailhouse-dev%2=
52Bunsubscribe@googlegroups.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a=
 href=3D"mailto:jailhouse-dev%25252Bunsubscribe@googlegroups.com" target=3D=
"_blank">jailhouse-dev%252Bunsubscribe@googlegroups.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jailhous=
e-dev%2525252Bunsubscribe@googlegroups.com" target=3D"_blank">jailhouse-dev=
%25252Bunsubscribe@googlegroups.com</a>&gt;&gt;&gt;&gt;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; To view this discussion on the web visit<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0<a href=3D"https://groups=
.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc2iKk1J6%2B0huh5__dS4HyujXzV9r%=
2BLbKLzuVZ4K3Bt5eA%40mail.gmail.com" rel=3D"noreferrer" target=3D"_blank">h=
ttps://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc2iKk1J6%2B0huh5__=
dS4HyujXzV9r%2BLbKLzuVZ4K3Bt5eA%40mail.gmail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0&lt;<a href=3D"https://gr=
oups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc2iKk1J6%2B0huh5__dS4HyujXz=
V9r%2BLbKLzuVZ4K3Bt5eA%40mail.gmail.com?utm_medium=3Demail&amp;utm_source=
=3Dfooter" rel=3D"noreferrer" target=3D"_blank">https://groups.google.com/d=
/msgid/jailhouse-dev/CA%2B%2BKhc2iKk1J6%2B0huh5__dS4HyujXzV9r%2BLbKLzuVZ4K3=
Bt5eA%40mail.gmail.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt;.<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; For more options, visit<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://groups.google.com/=
d/optout" rel=3D"noreferrer" target=3D"_blank">https://groups.google.com/d/=
optout</a>.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; <br>
&gt; -- <br>
&gt; You received this message because you are subscribed to the Google<br>
&gt; Groups &quot;Jailhouse&quot; group.<br>
&gt; To unsubscribe from this group and stop receiving emails from it, send=
<br>
&gt; an email to <a href=3D"mailto:jailhouse-dev%2Bunsubscribe@googlegroups=
.com" target=3D"_blank">jailhouse-dev+unsubscribe@googlegroups.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:jailhouse-dev%2Bunsubscribe@googlegroups.=
com" target=3D"_blank">jailhouse-dev+unsubscribe@googlegroups.com</a>&gt;.<=
br>
&gt; To view this discussion on the web visit<br>
&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc=
0O2zSeuLLY3MaeRW7cQrWbq-6Y2BHJg%2Bx_j6nk%3DECa_A%40mail.gmail.com" rel=3D"n=
oreferrer" target=3D"_blank">https://groups.google.com/d/msgid/jailhouse-de=
v/CA%2B%2BKhc0O2zSeuLLY3MaeRW7cQrWbq-6Y2BHJg%2Bx_j6nk%3DECa_A%40mail.gmail.=
com</a><br>
&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2=
BKhc0O2zSeuLLY3MaeRW7cQrWbq-6Y2BHJg%2Bx_j6nk%3DECa_A%40mail.gmail.com?utm_m=
edium=3Demail&amp;utm_source=3Dfooter" rel=3D"noreferrer" target=3D"_blank"=
>https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc0O2zSeuLLY3MaeR=
W7cQrWbq-6Y2BHJg%2Bx_j6nk%3DECa_A%40mail.gmail.com?utm_medium=3Demail&amp;u=
tm_source=3Dfooter</a>&gt;.<br>
&gt; For more options, visit <a href=3D"https://groups.google.com/d/optout"=
 rel=3D"noreferrer" target=3D"_blank">https://groups.google.com/d/optout</a=
>.<br>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CA%2B%2BKhc36sP7ABEsR5Bp%2Bgpts0DUBENqV6eFDPazfs5k=
R_QRGaw%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://gr=
oups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc36sP7ABEsR5Bp%2Bgpts0DUBEN=
qV6eFDPazfs5kR_QRGaw%40mail.gmail.com</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

--000000000000f3b8a5058b20c3aa--
