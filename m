Return-Path: <jailhouse-dev+bncBDM2HMO5Q4HBBVUFXOUQMGQEBOBZPIQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oa1-x3c.google.com (mail-oa1-x3c.google.com [IPv6:2001:4860:4864:20::3c])
	by mail.lfdr.de (Postfix) with ESMTPS id EC31D7CC9C8
	for <lists+jailhouse-dev@lfdr.de>; Tue, 17 Oct 2023 19:22:31 +0200 (CEST)
Received: by mail-oa1-x3c.google.com with SMTP id 586e51a60fabf-1ea01dcf2ccsf4798742fac.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 17 Oct 2023 10:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1697563351; x=1698168151; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H032OUFA1VyzhlReSiOAKuD/XeeSgNVmIJlITkoyDhQ=;
        b=jOOamNU+2SffbRYioePHyXLKk3+PiRIkW63WI/B1JI6P3GufbqBQnFKVXOp7Fd9bqD
         JSs8OodprVmqAL98qKDEG7W3BK/UbKZgSMokVwERtBNQIUKV2DFQ/BhLBUhBR8oIFcvj
         BvlM2sE0JHmIoCEDu7pFFGbnH2+d5oQK0MkvagD0od5I4EpInxIDZRHWiUH2DZMSEcCm
         7ibsz73uFIjyZBNrTCsavOBu52l0fuIsohDJTZYrR3I+ee8iG0gE/AOFGJg376hHCLqH
         hswCfa27GbYEDNdxqwIHMiw62/cdZS+BtD28C00Ntpoy+uWjQ2W6pDD6yW+O9zg5g13r
         SNcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marples.net; s=mail; t=1697563351; x=1698168151; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H032OUFA1VyzhlReSiOAKuD/XeeSgNVmIJlITkoyDhQ=;
        b=ECEUFN6/N6bcH+g39pTvww8PUtC5lrAMhA+tJQGT0MoZA61gjsnk8CmkGIBHxHps5w
         ozlTNnwLsY1J7Gw8viq/Xj1s5HGoj+bswr6zvnhJ9TTu827o6WuO2Ugh16d3WhC5r/St
         C1/AeJ5l1+TNJaX6KlEISBDd4YnuKWIpfXEHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697563351; x=1698168151;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H032OUFA1VyzhlReSiOAKuD/XeeSgNVmIJlITkoyDhQ=;
        b=bZlgE4XiLQCBl0nO+9MtEnwXyzMZH5Ot/YsjdhJ59ueHS55u/+tnXvhujH9zkP9Btw
         ZqM8ewDihnr9YL60GJQHaOfBLhJhN4MR+L2aZvW+rSf9GBr0jsAq8sGrEe8az28XjYJc
         xyvxy26aEfBVdOIrIl9oOFkE4DHJcXRUrHlup82vhMnPkGcR5UFQUX4KcZwd6O4gy4og
         v0aH6cFYj17XQ9i1bzJeiFhR1Fm7KjVfKt2rCNhujYWbK/WrwjNdj+GJbG70t1XntK/o
         TgTB7K8IKq8vn6IOgneQDvr0hPNsqpon0apHXvL2D6ZvJaay6U/k9LedbcyTjmmSKiwT
         +hhA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YwailKEVFoaKwMPNVrj0/vYSwDAWqJThw2Wxup9MI2k16bV/4gM
	253ruk8w3s82Mue36dGO8L0=
X-Google-Smtp-Source: AGHT+IHWdi+h7yYTnvuosUqoj2ieQrJ74SvWK5WaGrZ5a6Ehbsd+XwYt9WXWa6KM9x3VCWZoJRPyDg==
X-Received: by 2002:a05:6870:310f:b0:1e9:a85a:9ec0 with SMTP id v15-20020a056870310f00b001e9a85a9ec0mr1324032oaa.0.1697563350776;
        Tue, 17 Oct 2023 10:22:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6870:9189:b0:1e9:88a0:a67c with SMTP id
 b9-20020a056870918900b001e988a0a67cls1398310oaf.2.-pod-prod-01-us; Tue, 17
 Oct 2023 10:22:29 -0700 (PDT)
X-Received: by 2002:a05:6808:18aa:b0:3ad:29a4:f54f with SMTP id bi42-20020a05680818aa00b003ad29a4f54fmr1176782oib.4.1697563349723;
        Tue, 17 Oct 2023 10:22:29 -0700 (PDT)
Date: Tue, 17 Oct 2023 10:22:29 -0700 (PDT)
From: Dave Marples <dave@marples.net>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <bf20ebf0-f447-4e73-8d94-e82b2d8dd836n@googlegroups.com>
In-Reply-To: <8753f9c0-7105-4362-9884-90a2c57fd137@marples.net>
References: <5a564454-0a20-4c44-93c2-67e30025c8a6n@googlegroups.com>
 <4b8c293a-de5d-4ede-ab38-c42294ba3554@marples.net>
 <36d21a58-fb8b-47f3-977f-ab179f0ea8b6@oth-regensburg.de>
 <8753f9c0-7105-4362-9884-90a2c57fd137@marples.net>
Subject: Re: Can't install jailhouse on linux-6.1 arm system
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_522_320067783.1697563349130"
X-Original-Sender: dave@marples.net
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

------=_Part_522_320067783.1697563349130
Content-Type: multipart/alternative; 
	boundary="----=_Part_523_1840207485.1697563349130"

------=_Part_523_1840207485.1697563349130
Content-Type: text/plain; charset="UTF-8"

Grr, my build suffered User Error. Once I built it properly everthing 
starts to work much better. Thanks for the help!!

# jailhouse enable imx8mm.cell
[   57.058121]  jailhouse: firmware: direct-loading firmware jailhouse.bin
[   57.068743] pci-host-generic bb800000.pci: host bridge /pci@0 ranges:
[   57.075325] pci-host-generic bb800000.pci:      MEM 
0x00bb900000..0x00bb903fff -> 0x00bb900000
[   57.084068] pci-host-generic bb800000.pci: ECAM at [mem 
0xbb800000-0xbb8fffff] for [bus 00]
[   57.092822] pci-host-generic bb800000.pci: PCI host bridge to bus 0001:00
[   57.099638] pci_bus 0001:00: root bus resource [bus 00]
[   57.104908] pci_bus 0001:00: root bus resource [mem 
0xbb900000-0xbb903fff]
[   57.111833] pci 0001:00:00.0: [110a:4106] type 00 class 0xff0000
[   57.117874] pci 0001:00:00.0: reg 0x10: [mem 0x00000000-0x00000fff]
[   57.124382] pci 0001:00:01.0: [110a:4106] type 00 class 0xff0001
[   57.130430] pci 0001:00:01.0: reg 0x10: [mem 0x00000000-0x00000fff]
[   57.137880] pci 0001:00:00.0: BAR 0: assigned [mem 0xbb900000-0xbb900fff]
[   57.144709] pci 0001:00:01.0: BAR 0: assigned [mem 0xbb901000-0xbb901fff]
[   57.151711] The Jailhouse is opening.
root@localhost:~/jailhouse/configs/arm64# 

On Tuesday, 17 October 2023 at 18:08:08 UTC+1 Dave Marples wrote:

>
>
> Help still appreciated...Can't help getting the feeling I'm missing a 
> document somewhere whereby all this lot magically becomes easy... 
>
>
> Did you also apply the patch that I attached? I'm pretty sure that it's 
> missing. 
>
> Hi Ralf,
>
> Thanks for the reply. That patch was indeed missing but applying it didn't 
> change my symptoms. Just spinning up a yocto image to see where the 
> differences are.
>
> Regards
>
> DAVE
>
>
>
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/bf20ebf0-f447-4e73-8d94-e82b2d8dd836n%40googlegroups.com.

------=_Part_523_1840207485.1697563349130
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Grr, my build suffered User Error. Once I built it properly everthing start=
s to work much better. Thanks for the help!!<div><br /></div><div><font fac=
e=3D"Courier New"># jailhouse enable imx8mm.cell<br />[ =C2=A0 57.058121] =
=C2=A0jailhouse: firmware: direct-loading firmware jailhouse.bin<br />[ =C2=
=A0 57.068743] pci-host-generic bb800000.pci: host bridge /pci@0 ranges:<br=
 />[ =C2=A0 57.075325] pci-host-generic bb800000.pci: =C2=A0 =C2=A0 =C2=A0M=
EM 0x00bb900000..0x00bb903fff -&gt; 0x00bb900000<br />[ =C2=A0 57.084068] p=
ci-host-generic bb800000.pci: ECAM at [mem 0xbb800000-0xbb8fffff] for [bus =
00]<br />[ =C2=A0 57.092822] pci-host-generic bb800000.pci: PCI host bridge=
 to bus 0001:00<br />[ =C2=A0 57.099638] pci_bus 0001:00: root bus resource=
 [bus 00]<br />[ =C2=A0 57.104908] pci_bus 0001:00: root bus resource [mem =
0xbb900000-0xbb903fff]<br />[ =C2=A0 57.111833] pci 0001:00:00.0: [110a:410=
6] type 00 class 0xff0000<br />[ =C2=A0 57.117874] pci 0001:00:00.0: reg 0x=
10: [mem 0x00000000-0x00000fff]<br />[ =C2=A0 57.124382] pci 0001:00:01.0: =
[110a:4106] type 00 class 0xff0001<br />[ =C2=A0 57.130430] pci 0001:00:01.=
0: reg 0x10: [mem 0x00000000-0x00000fff]<br />[ =C2=A0 57.137880] pci 0001:=
00:00.0: BAR 0: assigned [mem 0xbb900000-0xbb900fff]<br />[ =C2=A0 57.14470=
9] pci 0001:00:01.0: BAR 0: assigned [mem 0xbb901000-0xbb901fff]<br />[ =C2=
=A0 57.151711] The Jailhouse is opening.<br />root@localhost:~/jailhouse/co=
nfigs/arm64# </font><br /><br /></div><div class=3D"gmail_quote"><div dir=
=3D"auto" class=3D"gmail_attr">On Tuesday, 17 October 2023 at 18:08:08 UTC+=
1 Dave Marples wrote:<br/></div><blockquote class=3D"gmail_quote" style=3D"=
margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-lef=
t: 1ex;"><div>
    <br>
    <blockquote type=3D"cite">
      <blockquote type=3D"cite">
        <br>
        Help still appreciated...Can&#39;t help getting the feeling I&#39;m
        missing a document somewhere whereby all this lot magically
        becomes easy...
        <br>
      </blockquote>
      <br>
      Did you also apply the patch that I attached? I&#39;m pretty sure tha=
t
      it&#39;s missing.
      <br>
      <br>
    </blockquote>
    </div><div><p>Hi Ralf,</p>
    <p>Thanks for the reply. That patch was indeed missing but applying
      it didn&#39;t change my symptoms. Just spinning up a yocto image to
      see where the differences are.</p>
    <p>Regards</p>
    <p>DAVE</p>
    <p><br>
    </p>
    <p><br>
    </p>
  </div>

</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/bf20ebf0-f447-4e73-8d94-e82b2d8dd836n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/bf20ebf0-f447-4e73-8d94-e82b2d8dd836n%40googlegroups.co=
m</a>.<br />

------=_Part_523_1840207485.1697563349130--

------=_Part_522_320067783.1697563349130--
