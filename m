Return-Path: <jailhouse-dev+bncBDPIBXN2TIERBBWZT3VQKGQEKEDBDEA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23a.google.com (mail-oi1-x23a.google.com [IPv6:2607:f8b0:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id B46F2A167D
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Aug 2019 12:44:23 +0200 (CEST)
Received: by mail-oi1-x23a.google.com with SMTP id d63sf1132631oib.5
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Aug 2019 03:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Z8LimK7upiLmymBE8lMIBvFbiYxu71B4WcFucGcRltI=;
        b=hgDDqC4AQJgQ8LMHZ/s/1fxymeFvdMT9XhnRO5i/9BpO4sFjqyNsUO7XZ8WNRukK+o
         zR+usfnAhDOUqj9XDoD3scNDuN+j5gNEr9epzcZJnyzuXzuW2rMBnIkd4DP+yVxk9gho
         DqmFecTwoP7ITQcqwj3vN4G5d8ZN3yG+Lch1Z3YVogGSnRDJGKQP8lBnm4Hp0d9lBRgA
         VM73U7rGstm82PHG3cx9qLZY7z4w9gYcnaZVxycFJtePAK1KTM58dOT1E/qcJ0s7SrFt
         pk5QixZWXamJN7lMSdVmwEN67A9XhbUB45XHiK8c7lRs4hIZhDYG9SegkBOkd1Edutdv
         A6Og==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Z8LimK7upiLmymBE8lMIBvFbiYxu71B4WcFucGcRltI=;
        b=LBZ9OBZkj5M0MqBBTSxIoxtOs5y42SMZCx7hTAnqYR/tLao4A4d8KI5UHoALiqpO75
         KKovY25DLaUCpSh09EUmDFYey7m3vqD75N2GBgPVh0SYJtZ8np8hVmuZjNC2XsrUD6Bx
         ZicMF1HiKHJIiO1ji5RBfA9jjmjAmuceobDcuIAEiRijbQD3a6Gb2b37869OmFhGl5p4
         43a9ggvcqSlXCgP+vyqv8HngyM+Hl73KHFGWTtN1DQR6+BF++XPaJ6gl1SmIria1njXG
         n/xGZRKOlc2bv5G2wrkbyTSIlt0foz6N6crOx4WXIoSKVNS2+U/KeUgR7+VE4knSQSxI
         omtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Z8LimK7upiLmymBE8lMIBvFbiYxu71B4WcFucGcRltI=;
        b=UhfVpi6QRVSSTq4F9C6wNdplxDV/Jwy0XGxENMI6ZGthLG3hdNtJBP8JBZRVCzXnFe
         lGXvRuhxtffXfRCZaKvj3C04J/OwatwrHG6lv62A1SW6Y6TMhGTMzwiNjZQ2VRzqwmRH
         O8uismJ8DrmBt6Mycm/XkNSR9LdnDohMwpN5epyysvHoHJ0A2rV98Lnh/h83vSXCI8n+
         Tn/AmZ5tsvTxGzP8+KFAWDftkCcyNRuadbw7o3fPdjnjOl06eL1tos+AikcLffK43HTx
         fvoGm14s++btXw5T05RLhSZSsgGRuzIjPWGrStfQPsw2m7Ko8YvIb2TMpHEcblPuaiLN
         5kZw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVrBsnh45ZVW0Nnx8E/1jg5HYDI8LnLK8PvDgymSuIYj4rtWvx4
	ktJcNiiSq7Ct3ojedHsYdt8=
X-Google-Smtp-Source: APXvYqwnKri0WUlIoLel+ANlrF3BQsxF3e8VFwEc5b8Azp9Kd7SPqwYdJ026eKwZBYA2siy5TFvXYw==
X-Received: by 2002:a05:6830:1018:: with SMTP id a24mr2387279otp.191.1567075462416;
        Thu, 29 Aug 2019 03:44:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:6250:: with SMTP id i16ls396095otk.1.gmail; Thu, 29 Aug
 2019 03:44:21 -0700 (PDT)
X-Received: by 2002:a05:6830:1209:: with SMTP id r9mr7470895otp.128.1567075461188;
        Thu, 29 Aug 2019 03:44:21 -0700 (PDT)
Date: Thu, 29 Aug 2019 03:44:20 -0700 (PDT)
From: Jan Lipponen <jan.lipponen@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <6b4bb950-5b1e-42e2-8d54-52beb009b025@googlegroups.com>
In-Reply-To: <0defc7ed-1e7a-5781-bcc6-9a0a5c45b4d4@siemens.com>
References: <500f983d-7afc-43b1-bc9a-13768226ad64@googlegroups.com>
 <0defc7ed-1e7a-5781-bcc6-9a0a5c45b4d4@siemens.com>
Subject: Re: Unable to find IVSHMEM pci-device on root cell (ARM64)
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3601_1561051750.1567075460482"
X-Original-Sender: jan.lipponen@gmail.com
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

------=_Part_3601_1561051750.1567075460482
Content-Type: multipart/alternative; 
	boundary="----=_Part_3602_1749052156.1567075460482"

------=_Part_3602_1749052156.1567075460482
Content-Type: text/plain; charset="UTF-8"

Hi Jan,

thanks for your quick answer! Please find the kernel log attached.

-Jan

On Thursday, 29 August 2019 13:17:49 UTC+3, Jan Kiszka wrote:
>
> On 29.08.19 10:36, Jan Lipponen wrote: 
> > Hi! 
> > 
> > I have ran in a similar situation as Sebastian in a post from yesterday 
> > <https://groups.google.com/forum/#!topic/jailhouse-dev/GgGrW2an4Tk> but 
> with a 
> > ARM64 device (ZCU104 board). The problem seems to be that Linux is 
> unable to 
> > detect the virtual IVSHMEM PCI device. The Jailhouse enables fine with 
> following 
> > logs: 
> > 
> > 
> > | 
> > Initializing Jailhouse hypervisor  on CPU 0 
> > Code location: 0x0000ffffc0200800 
> > Page pool usage after early setup: mem 39/996, remap 0/131072 
> > Initializing processors: 
> >   CPU 0... OK 
> >   CPU 1... OK 
> >   CPU 3... OK 
> >   CPU 2... OK 
> > Initializing unit: irqchip 
> > Initializing unit: PCI 
> > Adding virtual PCI device 00:00.0 to cell "ZCU104-root" 
> > DEBUG pci.c: pci_cell_init returned 0 
> > Page pool usage after late setup: mem 59/996, remap 5/131072 
> > Activating hypervisor 
> > [  627.901240] The Jailhouse is opening. 
> > | 
> > 
> > 
> > I've just added the DEBUG print there. 
> > 
> > I do not have the /lspci/ tool installed on the target, but I can see 
> that no 
> > PCI devices are created under //sys/bus/pci/devices/ and the probe 
> function of 
> > the /uio_ivshmem/ driver never gets called. Re-scanning the PCI bus 
> doesn't 
> > help. After enabling a guest cell I can see that Jailhouse is able to 
> create a 
> > shared memory connection between the guest and root cell via the IVSHMEM 
> device: 
> > 
> > | 
> > [ 1493.087945] CPU3: shutdown 
> > [ 1493.090656] psci: CPU3 killed. 
> > Adding virtual PCI device 00:00.0 to cell "ZynqMP-ZCU104-bmetal" 
> > Shared memory connection established: "ZynqMP-ZCU104-bmetal" <--> 
> "ZCU104-root" 
> > Created cell "ZynqMP-ZCU104-bmetal" 
> > | 
> > 
> > This makes me think that from the Jailhouse's point of view everything 
> is going 
> > great and the only problem is that Linux's PCI subsystem is just unable 
> to 
> > discover the device. I initially thought it is a device tree issue so I 
> went 
> > ahead and added a PCI node to the device tree, following the example in 
> > jailhouse/configs/arm64/dts/inmate-zynqmp.dts 
> > <
> https://github.com/siemens/jailhouse/blob/8e77d610dd4869223a5209c11e4314c2e1d4d334/configs/arm64/dts/inmate-zynqmp.dts#L91>. 
>
> > It seems that the base address of this generic PCI host controller needs 
> to 
> > match the /.pci_mmconfig_base /property in the root cell config. This, 
> however, 
> > resulted in a kernel warning: 
> > 
> > | 
> > Activating hypervisor 
> > [  171.863249] sysfs: cannot create duplicate filename 
> > '/bus/platform/devices/fc000000.pci' 
> > [  171.871362] ------------[ cut here ]------------ 
> > [  171.875977] WARNING: CPU: 1 PID: 1932 at fs/sysfs/dir.c:31 
> > sysfs_warn_dup+0x5c/0x78 
> > | 
> > 
> > So, the fc000000.pci device is already registered without my additional 
> device 
> > tree node, but the /uio_ivshmem/ does not get probed because it's 
> registered as 
> > a PCI driver. 
> > 
> > Additioanlly, I've tried adding CONFIG_KALLSYMS_ALL and CONFIG_PCI_DEBUG 
> in 
> > kernel config, but nothing changed. 
> > 
> > 
> > To get me forward, I would have couple of questions. 
> > 
> >   * Should a device indeed be created under /sys/bus/pci/devices when 
> Jailhouse 
> >     is enabled, regardless if /uio_ivshmem /driver is inserted into 
> kernel or not? 
>
> Yes. The device comes first (namely the virtual PCI host controller and 
> then, 
> via scanning it, the virtual device(s)), and then the drivers bind to it 
> (for 
> pci-generic host controller and ivshmem devices). 
>
> > 
> >   * Is the /uio_ivshmem /driver's probe called after Linux's PCI 
> subsystem 
> >     successfully registers the IVSHMEM device? 
>
> See above: The generic host controller should be detected first. It's 
> added via 
> a dt overlay by the jailhouse driver to the root cell. Could you share the 
> complete kernel log of the root cell? 
>
> > 
> >   * Should I add a device tree node for a /pci-host-generic /driver 
> (/compatible 
> >     = "pci-host-ecam-generic"/) or not? Initially, I only have an entry 
> for the 
> >     ZynqMP PCIe core (/compatible = "xlnx,nwl-pcie-2.11"/). 
> > 
>
> Nope, not needed, done automatically. 
>
> Jan 
>
> -- 
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE 
> Corporate Competence Center Embedded Linux 
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6b4bb950-5b1e-42e2-8d54-52beb009b025%40googlegroups.com.

------=_Part_3602_1749052156.1567075460482
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Jan,<div><br></div><div>thanks for your quick answer! P=
lease find the kernel log attached.</div><div><br></div><div>-Jan<br><br>On=
 Thursday, 29 August 2019 13:17:49 UTC+3, Jan Kiszka  wrote:<blockquote cla=
ss=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #=
ccc solid;padding-left: 1ex;">On 29.08.19 10:36, Jan Lipponen wrote:
<br>&gt; Hi!
<br>&gt;=20
<br>&gt; I have ran in a similar situation as Sebastian in a post from yest=
erday=20
<br>&gt; &lt;<a href=3D"https://groups.google.com/forum/#!topic/jailhouse-d=
ev/GgGrW2an4Tk" target=3D"_blank" rel=3D"nofollow" onmousedown=3D"this.href=
=3D&#39;https://groups.google.com/forum/#!topic/jailhouse-dev/GgGrW2an4Tk&#=
39;;return true;" onclick=3D"this.href=3D&#39;https://groups.google.com/for=
um/#!topic/jailhouse-dev/GgGrW2an4Tk&#39;;return true;">https://groups.goog=
le.com/<wbr>forum/#!topic/jailhouse-dev/<wbr>GgGrW2an4Tk</a>&gt;=C2=A0but w=
ith a=20
<br>&gt; ARM64 device (ZCU104 board). The problem seems to be that Linux is=
 unable to=20
<br>&gt; detect the virtual IVSHMEM PCI device. The Jailhouse enables fine =
with following=20
<br>&gt; logs:
<br>&gt;=20
<br>&gt;=20
<br>&gt; |
<br>&gt; Initializing Jailhouse hypervisor=C2=A0 on CPU 0
<br>&gt; Code location: 0x0000ffffc0200800
<br>&gt; Page pool usage after early setup: mem 39/996, remap 0/131072
<br>&gt; Initializing processors:
<br>&gt; =C2=A0=C2=A0CPU 0... OK
<br>&gt; =C2=A0=C2=A0CPU 1... OK
<br>&gt; =C2=A0=C2=A0CPU 3... OK
<br>&gt; =C2=A0=C2=A0CPU 2... OK
<br>&gt; Initializing unit: irqchip
<br>&gt; Initializing unit: PCI
<br>&gt; Adding virtual PCI device 00:00.0 to cell &quot;ZCU104-root&quot;
<br>&gt; DEBUG pci.c: pci_cell_init returned 0
<br>&gt; Page pool usage after late setup: mem 59/996, remap 5/131072
<br>&gt; Activating hypervisor
<br>&gt; [=C2=A0 627.901240] The Jailhouse is opening.
<br>&gt; |
<br>&gt;=20
<br>&gt;=20
<br>&gt; I&#39;ve just added the DEBUG print there.
<br>&gt;=20
<br>&gt; I do not have the /lspci/=C2=A0tool installed on the target, but I=
 can see that no=20
<br>&gt; PCI devices are created under //sys/bus/pci/devices/=C2=A0and the =
probe function of=20
<br>&gt; the /uio_ivshmem/ driver never gets called. Re-scanning the PCI bu=
s doesn&#39;t=20
<br>&gt; help. After enabling a guest cell I can see that Jailhouse is able=
 to create a=20
<br>&gt; shared memory connection between the guest and root cell via the I=
VSHMEM device:
<br>&gt;=20
<br>&gt; |
<br>&gt; [ 1493.087945] CPU3: shutdown
<br>&gt; [ 1493.090656] psci: CPU3 killed.
<br>&gt; Adding virtual PCI device 00:00.0 to cell &quot;ZynqMP-ZCU104-bmet=
al&quot;
<br>&gt; Shared memory connection established: &quot;ZynqMP-ZCU104-bmetal&q=
uot; &lt;--&gt; &quot;ZCU104-root&quot;
<br>&gt; Created cell &quot;ZynqMP-ZCU104-bmetal&quot;
<br>&gt; |
<br>&gt;=20
<br>&gt; This makes me think that from the Jailhouse&#39;s point of view ev=
erything is going=20
<br>&gt; great and the only problem is that Linux&#39;s PCI subsystem is ju=
st unable to=20
<br>&gt; discover the device. I initially thought it is a device tree issue=
 so I went=20
<br>&gt; ahead and added a PCI node to the device tree, following the examp=
le in=20
<br>&gt; jailhouse/configs/arm64/dts/<wbr>inmate-zynqmp.dts=20
<br>&gt; &lt;<a href=3D"https://github.com/siemens/jailhouse/blob/8e77d610d=
d4869223a5209c11e4314c2e1d4d334/configs/arm64/dts/inmate-zynqmp.dts#L91" ta=
rget=3D"_blank" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;https://ww=
w.google.com/url?q\x3dhttps%3A%2F%2Fgithub.com%2Fsiemens%2Fjailhouse%2Fblob=
%2F8e77d610dd4869223a5209c11e4314c2e1d4d334%2Fconfigs%2Farm64%2Fdts%2Finmat=
e-zynqmp.dts%23L91\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNF0TpzqzdxZxx5UKr=
1HvUq0xav6kw&#39;;return true;" onclick=3D"this.href=3D&#39;https://www.goo=
gle.com/url?q\x3dhttps%3A%2F%2Fgithub.com%2Fsiemens%2Fjailhouse%2Fblob%2F8e=
77d610dd4869223a5209c11e4314c2e1d4d334%2Fconfigs%2Farm64%2Fdts%2Finmate-zyn=
qmp.dts%23L91\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNF0TpzqzdxZxx5UKr1HvUq=
0xav6kw&#39;;return true;">https://github.com/siemens/<wbr>jailhouse/blob/<=
wbr>8e77d610dd4869223a5209c11e4314<wbr>c2e1d4d334/configs/arm64/dts/<wbr>in=
mate-zynqmp.dts#L91</a>&gt;.=20
<br>&gt; It seems that the base address of this generic PCI host controller=
 needs to=20
<br>&gt; match the /.pci_mmconfig_base /property in the root cell config. T=
his, however,=20
<br>&gt; resulted in a kernel warning:
<br>&gt;=20
<br>&gt; |
<br>&gt; Activating hypervisor
<br>&gt; [=C2=A0 171.863249] sysfs: cannot create duplicate filename=20
<br>&gt; &#39;/bus/platform/devices/<wbr>fc000000.pci&#39;
<br>&gt; [=C2=A0 171.871362] ------------[ cut here ]------------
<br>&gt; [=C2=A0 171.875977] WARNING: CPU: 1 PID: 1932 at fs/sysfs/dir.c:31=
=20
<br>&gt; sysfs_warn_dup+0x5c/0x78
<br>&gt; |
<br>&gt;=20
<br>&gt; So, the=C2=A0fc000000.pci device is already registered without my =
additional device=20
<br>&gt; tree node, but the /uio_ivshmem/=C2=A0does not get probed because =
it&#39;s registered as=20
<br>&gt; a PCI driver.
<br>&gt;=20
<br>&gt; Additioanlly, I&#39;ve tried adding=C2=A0CONFIG_KALLSYMS_ALL and=
=C2=A0CONFIG_PCI_DEBUG in=20
<br>&gt; kernel config, but nothing changed.
<br>&gt;=20
<br>&gt;=20
<br>&gt; To get me forward, I would have couple of questions.
<br>&gt;=20
<br>&gt; =C2=A0 * Should a device indeed be created under=C2=A0/sys/bus/pci=
/devices when Jailhouse
<br>&gt; =C2=A0 =C2=A0 is enabled, regardless if /uio_ivshmem /driver is in=
serted into kernel or not?
<br>
<br>Yes. The device comes first (namely the virtual PCI host controller and=
 then,=20
<br>via scanning it, the virtual device(s)), and then the drivers bind to i=
t (for=20
<br>pci-generic host controller and ivshmem devices).
<br>
<br>&gt;=20
<br>&gt; =C2=A0 * Is the /uio_ivshmem /driver&#39;s probe called after Linu=
x&#39;s PCI subsystem
<br>&gt; =C2=A0 =C2=A0 successfully registers the IVSHMEM device?
<br>
<br>See above: The generic host controller should be detected first. It&#39=
;s added via=20
<br>a dt overlay by the jailhouse driver to the root cell. Could you share =
the=20
<br>complete kernel log of the root cell?
<br>
<br>&gt;=20
<br>&gt; =C2=A0 * Should I add a device tree node for a /pci-host-generic /=
driver (/compatible
<br>&gt; =C2=A0 =C2=A0 =3D &quot;pci-host-ecam-generic&quot;/) or not? Init=
ially, I only have an entry for the
<br>&gt; =C2=A0 =C2=A0 ZynqMP PCIe core (/compatible =3D &quot;xlnx,nwl-pci=
e-2.11&quot;/).
<br>&gt;=20
<br>
<br>Nope, not needed, done automatically.
<br>
<br>Jan
<br>
<br>--=20
<br>Siemens AG, Corporate Technology, CT RDA IOT SES-DE
<br>Corporate Competence Center Embedded Linux
<br></blockquote></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/6b4bb950-5b1e-42e2-8d54-52beb009b025%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/6b4bb950-5b1e-42e2-8d54-52beb009b025%40googlegroups.com<=
/a>.<br />

------=_Part_3602_1749052156.1567075460482--

------=_Part_3601_1561051750.1567075460482
Content-Type: text/plain; charset=UTF-8; name=log.txt
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=log.txt
X-Attachment-Id: 47fbb2ec-1f55-4a84-9e4f-274b04308830
Content-ID: <47fbb2ec-1f55-4a84-9e4f-274b04308830>

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 4.14.0-xilinx-v2018.3 (wrm@wrm-dev-env-v2) (gc=
c version 8.2.0 (GCC)) #1 SMP Tue Aug 27 08:42:20 EEST 2019
[    0.000000] Boot CPU: AArch64 Processor [410fd034]
[    0.000000] Machine model: ZynqMP ZCU104 RevC
[    0.000000] earlycon: cdns0 at MMIO 0x00000000ff000000 (options '115200n=
8')
[    0.000000] bootconsole [cdns0] enabled
[    0.000000] Memory limited to 1536MB
[    0.000000] efi: Getting EFI parameters from FDT:
[    0.000000] efi: UEFI not found.
[    0.000000] cma: Reserved 256 MiB at 0x0000000050000000
[    0.000000] On node 0 totalpages: 395822
[    0.000000]   DMA zone: 5412 pages used for memmap
[    0.000000]   DMA zone: 0 pages reserved
[    0.000000]   DMA zone: 395822 pages, LIFO batch:31
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.1 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: MIGRATE_INFO_TYPE not supported.
[    0.000000] percpu: Embedded 21 pages/cpu @ffffffc04ff6d000 s45080 r8192=
 d32744 u86016
[    0.000000] pcpu-alloc: s45080 r8192 d32744 u86016 alloc=3D21*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3=20
[    0.000000] Detected VIPT I-cache on CPU0
[    0.000000] CPU features: enabling workaround for ARM erratum 845719
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 39041=
0
[    0.000000] Kernel command line: earlycon clk_ignore_unused mem=3D1536M
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] Dentry cache hash table entries: 262144 (order: 9, 2097152 b=
ytes)
[    0.000000] Inode-cache hash table entries: 131072 (order: 8, 1048576 by=
tes)
[    0.000000] Memory: 1259432K/1583288K available (9660K kernel code, 654K=
 rwdata, 5848K rodata, 512K init, 2151K bss, 61712K reserved, 262144K cma-r=
eserved)
[    0.000000] Virtual kernel memory layout:
[    0.000000]     modules : 0xffffff8000000000 - 0xffffff8008000000   (   =
128 MB)
[    0.000000]     vmalloc : 0xffffff8008000000 - 0xffffffbebfff0000   (   =
250 GB)
[    0.000000]       .text : 0xffffff8008080000 - 0xffffff80089f0000   (  9=
664 KB)
[    0.000000]     .rodata : 0xffffff80089f0000 - 0xffffff8008fb0000   (  5=
888 KB)
[    0.000000]       .init : 0xffffff8008fb0000 - 0xffffff8009030000   (   =
512 KB)
[    0.000000]       .data : 0xffffff8009030000 - 0xffffff80090d3a00   (   =
655 KB)
[    0.000000]        .bss : 0xffffff80090d3a00 - 0xffffff80092ed668   (  2=
152 KB)
[    0.000000]     fixed   : 0xffffffbefe7fd000 - 0xffffffbefec00000   (  4=
108 KB)
[    0.000000]     PCI I/O : 0xffffffbefee00000 - 0xffffffbeffe00000   (   =
 16 MB)
[    0.000000]     vmemmap : 0xffffffbf00000000 - 0xffffffc000000000   (   =
  4 GB maximum)
[    0.000000]               0xffffffbf00000000 - 0xffffffbf01b8bb18   (   =
 27 MB actual)
[    0.000000]     memory  : 0xffffffc000000000 - 0xffffffc07dec5000   (  2=
014 MB)
[    0.000000] Hierarchical RCU implementation.
[    0.000000] =09RCU event tracing is enabled.
[    0.000000] =09RCU restricting CPUs from NR_CPUS=3D8 to nr_cpu_ids=3D4.
[    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D4
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] GIC: Adjusting CPU interface base to 0x00000000f902f000
[    0.000000] GIC: Using split EOI/Deactivate mode
[    0.000000] arch_timer: cp15 timer(s) running at 99.99MHz (phys).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cy=
cles: 0x171015c6fb, max_idle_ns: 440795203665 ns
[    0.000003] sched_clock: 56 bits at 99MHz, resolution 10ns, wraps every =
4398046511101ns
[    0.008245] Console: colour dummy device 80x25
[    0.012377] console [tty0] enabled
[    0.015743] bootconsole [cdns0] disabled
[    0.019651] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 199.99 BogoMIPS (lpj=3D399995)
[    0.019664] pid_max: default: 32768 minimum: 301
[    0.019765] Mount-cache hash table entries: 4096 (order: 3, 32768 bytes)
[    0.019779] Mountpoint-cache hash table entries: 4096 (order: 3, 32768 b=
ytes)
[    0.020368] ASID allocator initialised with 65536 entries
[    0.020418] Hierarchical SRCU implementation.
[    0.020728] EFI services will not be available.
[    0.020760] zynqmp_plat_init Platform Management API v1.1
[    0.020768] zynqmp_plat_init Trustzone version v1.0
[    0.020867] smp: Bringing up secondary CPUs ...
[    0.021106] Detected VIPT I-cache on CPU1
[    0.021134] CPU1: Booted secondary processor [410fd034]
[    0.021397] Detected VIPT I-cache on CPU2
[    0.021415] CPU2: Booted secondary processor [410fd034]
[    0.021666] Detected VIPT I-cache on CPU3
[    0.021683] CPU3: Booted secondary processor [410fd034]
[    0.021723] smp: Brought up 1 node, 4 CPUs
[    0.021754] SMP: Total of 4 processors activated.
[    0.021762] CPU features: detected feature: 32-bit EL0 Support
[    0.021772] CPU: All CPU(s) started at EL2
[    0.021787] alternatives: patching kernel code
[    0.022398] devtmpfs: initialized
[    0.026061] random: get_random_u32 called from bucket_table_alloc+0x104/=
0x268 with crng_init=3D0
[    0.026227] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 7645041785100000 ns
[    0.026250] futex hash table entries: 1024 (order: 5, 131072 bytes)
[    0.031744] xor: measuring software checksum speed
[    0.071736]    8regs     :  2375.000 MB/sec
[    0.111764]    8regs_prefetch:  2052.000 MB/sec
[    0.151793]    32regs    :  2725.000 MB/sec
[    0.191824]    32regs_prefetch:  2309.000 MB/sec
[    0.191832] xor: using function: 32regs (2725.000 MB/sec)
[    0.191898] pinctrl core: initialized pinctrl subsystem
[    0.192044] random: fast init done
[    0.192413] NET: Registered protocol family 16
[    0.193154] cpuidle: using governor menu
[    0.193568] vdso: 2 pages (1 code @ ffffff80089f6000, 1 data @ ffffff800=
9034000)
[    0.193584] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers=
.
[    0.194116] DMA: preallocated 256 KiB pool for atomic allocations
[    0.216411] zynqmp-pinctrl pinctrl: zynqmp pinctrl initialized
[    0.217220] reset_zynqmp reset-controller: Xilinx zynqmp reset driver pr=
obed
[    0.217868] ARM CCI_400_r1 PMU driver probed
[    0.226572] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.291969] raid6: int64x1  gen()   455 MB/s
[    0.359997] raid6: int64x1  xor()   448 MB/s
[    0.428085] raid6: int64x2  gen()   686 MB/s
[    0.496118] raid6: int64x2  xor()   596 MB/s
[    0.564148] raid6: int64x4  gen()   978 MB/s
[    0.632158] raid6: int64x4  xor()   732 MB/s
[    0.700213] raid6: int64x8  gen()  1163 MB/s
[    0.768277] raid6: int64x8  xor()   757 MB/s
[    0.836363] raid6: neonx1   gen()   742 MB/s
[    0.904335] raid6: neonx1   xor()   872 MB/s
[    0.972397] raid6: neonx2   gen()  1138 MB/s
[    1.040444] raid6: neonx2   xor()  1163 MB/s
[    1.108504] raid6: neonx4   gen()  1514 MB/s
[    1.176527] raid6: neonx4   xor()  1410 MB/s
[    1.244583] raid6: neonx8   gen()  1545 MB/s
[    1.312608] raid6: neonx8   xor()  1458 MB/s
[    1.312616] raid6: using algorithm neonx8 gen() 1545 MB/s
[    1.312624] raid6: .... xor() 1458 MB/s, rmw enabled
[    1.312631] raid6: using neon recovery algorithm
[    1.313358] SCSI subsystem initialized
[    1.313397] libata version 3.00 loaded.
[    1.313521] usbcore: registered new interface driver usbfs
[    1.313556] usbcore: registered new interface driver hub
[    1.313590] usbcore: registered new device driver usb
[    1.313652] media: Linux media interface: v0.10
[    1.313677] Linux video capture interface: v2.00
[    1.313715] pps_core: LinuxPPS API ver. 1 registered
[    1.313723] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo =
Giometti <giometti@linux.it>
[    1.313742] PTP clock support registered
[    1.313769] EDAC MC: Ver: 3.0.0
[    1.314056] zynqmp-ipi ff9905c0.mailbox: Probed ZynqMP IPI Mailbox drive=
r.
[    1.314173] FPGA manager framework
[    1.314294] fpga-region fpga-full: FPGA Region probed
[    1.314370] Advanced Linux Sound Architecture Driver Initialized.
[    1.314606] Bluetooth: Core ver 2.22
[    1.314635] NET: Registered protocol family 31
[    1.314643] Bluetooth: HCI device and connection manager initialized
[    1.314654] Bluetooth: HCI socket layer initialized
[    1.314665] Bluetooth: L2CAP socket layer initialized
[    1.314683] Bluetooth: SCO socket layer initialized
[    1.315156] clocksource: Switched to clocksource arch_sys_counter
[    1.315225] VFS: Disk quotas dquot_6.6.0
[    1.315267] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 byte=
s)
[    1.319117] NET: Registered protocol family 2
[    1.319417] TCP established hash table entries: 16384 (order: 5, 131072 =
bytes)
[    1.319530] TCP bind hash table entries: 16384 (order: 6, 262144 bytes)
[    1.319738] TCP: Hash tables configured (established 16384 bind 16384)
[    1.319805] UDP hash table entries: 1024 (order: 3, 32768 bytes)
[    1.319849] UDP-Lite hash table entries: 1024 (order: 3, 32768 bytes)
[    1.319967] NET: Registered protocol family 1
[    1.320131] RPC: Registered named UNIX socket transport module.
[    1.320140] RPC: Registered udp transport module.
[    1.320147] RPC: Registered tcp transport module.
[    1.320154] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    1.320166] PCI: CLS 0 bytes, default 128
[    1.320248] Trying to unpack rootfs image as initramfs...
[    1.718427] Freeing initrd memory: 10420K
[    1.718798] hw perfevents: no interrupt-affinity property for /pmu, gues=
sing.
[    1.718956] hw perfevents: enabled with armv8_pmuv3 PMU driver, 7 counte=
rs available
[    1.719551] audit: initializing netlink subsys (disabled)
[    1.719638] audit: type=3D2000 audit(1.708:1): state=3Dinitialized audit=
_enabled=3D0 res=3D1
[    1.719937] workingset: timestamp_bits=3D62 max_order=3D19 bucket_order=
=3D0
[    1.720626] NFS: Registering the id_resolver key type
[    1.720647] Key type id_resolver registered
[    1.720654] Key type id_legacy registered
[    1.720666] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    1.720687] jffs2: version 2.2. (NAND) =C2=A9 2001-2006 Red Hat, Inc.
[    1.749755] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor 247)
[    1.749776] io scheduler noop registered
[    1.749784] io scheduler deadline registered
[    1.749804] io scheduler cfq registered (default)
[    1.749813] io scheduler mq-deadline registered
[    1.749820] io scheduler kyber registered
[    1.750880] xilinx-dpdma fd4c0000.dma: Xilinx DPDMA engine is probed
[    1.775001] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    1.777387] cacheinfo: Unable to detect cache hierarchy for CPU 0
[    1.781250] brd: module loaded
[    1.784490] loop: module loaded
[    1.785116] ahci-ceva fd0c0000.ahci: couldn't get PHY in node ahci: -517
[    1.785259] mtdoops: mtd device (mtddev=3Dname/number) must be supplied
[    1.786005] m25p80 spi0.0: unrecognized JEDEC id bytes: 00, 00, 00
[    1.786783] libphy: Fixed MDIO Bus: probed
[    1.787728] tun: Universal TUN/TAP device driver, 1.6
[    1.787871] CAN device driver interface
[    1.790072] macb ff0e0000.ethernet: Not enabling partial store and forwa=
rd
[    1.790440] libphy: MACB_mii_bus: probed
[    1.793713] macb ff0e0000.ethernet eth0: Cadence GEM rev 0x50070106 at 0=
xff0e0000 irq 15 (3e:b7:71:d2:72:46)
[    1.793731] TI DP83867 ff0e0000.ethernet-ffffffff:0c: attached PHY drive=
r [TI DP83867] (mii_bus:phy_addr=3Dff0e0000.ethernet-ffffffff:0c, irq=3DPOL=
L)
[    1.794166] usbcore: registered new interface driver asix
[    1.794217] usbcore: registered new interface driver ax88179_178a
[    1.794246] usbcore: registered new interface driver cdc_ether
[    1.794276] usbcore: registered new interface driver net1080
[    1.794305] usbcore: registered new interface driver cdc_subset
[    1.794334] usbcore: registered new interface driver zaurus
[    1.794370] usbcore: registered new interface driver cdc_ncm
[    1.794645] xilinx-axipmon ffa00000.perf-monitor: Probed Xilinx APM
[    1.796306] usbcore: registered new interface driver uas
[    1.796342] usbcore: registered new interface driver usb-storage
[    1.796779] rtc_zynqmp ffa60000.rtc: rtc core: registered ffa60000.rtc a=
s rtc0
[    1.796825] i2c /dev entries driver
[    1.797449] IR NEC protocol handler initialized
[    1.797458] IR RC5(x/sz) protocol handler initialized
[    1.797465] IR RC6 protocol handler initialized
[    1.797472] IR JVC protocol handler initialized
[    1.797479] IR Sony protocol handler initialized
[    1.797486] IR SANYO protocol handler initialized
[    1.797492] IR Sharp protocol handler initialized
[    1.797499] IR MCE Keyboard/mouse protocol handler initialized
[    1.797506] IR XMP protocol handler initialized
[    1.798454] usbcore: registered new interface driver uvcvideo
[    1.798462] USB Video Class driver (1.1.1)
[    1.798844] cdns-wdt fd4d0000.watchdog: Xilinx Watchdog Timer at ffffff8=
00930d000 with timeout 60s
[    1.798988] Bluetooth: HCI UART driver ver 2.3
[    1.798998] Bluetooth: HCI UART protocol H4 registered
[    1.799006] Bluetooth: HCI UART protocol BCSP registered
[    1.799031] Bluetooth: HCI UART protocol LL registered
[    1.799040] Bluetooth: HCI UART protocol ATH3K registered
[    1.799048] Bluetooth: HCI UART protocol Three-wire (H5) registered
[    1.799085] Bluetooth: HCI UART protocol Intel registered
[    1.799093] Bluetooth: HCI UART protocol QCA registered
[    1.799127] usbcore: registered new interface driver bcm203x
[    1.799213] usbcore: registered new interface driver bpa10x
[    1.799251] usbcore: registered new interface driver bfusb
[    1.799284] usbcore: registered new interface driver btusb
[    1.799293] Bluetooth: Generic Bluetooth SDIO driver ver 0.1
[    1.799340] usbcore: registered new interface driver ath3k
[    1.799453] EDAC MC: ECC not enabled
[    1.799677] EDAC DEVICE0: Giving out device to module zynqmp-ocm-edac co=
ntroller zynqmp_ocm: DEV ff960000.memory-controller (INTERRUPT)
[    1.800490] sdhci: Secure Digital Host Controller Interface driver
[    1.800499] sdhci: Copyright(c) Pierre Ossman
[    1.800506] sdhci-pltfm: SDHCI platform and OF driver helper
[    1.801828] ledtrig-cpu: registered to indicate activity on CPUs
[    1.801960] usbcore: registered new interface driver usbhid
[    1.801969] usbhid: USB HID core driver
[    1.803605] fpga_manager fpga0: Xilinx ZynqMP FPGA Manager registered
[    1.803882] usbcore: registered new interface driver snd-usb-audio
[    1.804464] pktgen: Packet Generator for packet performance testing. Ver=
sion: 2.75
[    1.804705] Netfilter messages via NETLINK v0.30.
[    1.804820] ip_tables: (C) 2000-2006 Netfilter Core Team
[    1.804952] Initializing XFRM netlink socket
[    1.805012] NET: Registered protocol family 10
[    1.805404] Segment Routing with IPv6
[    1.805446] ip6_tables: (C) 2000-2006 Netfilter Core Team
[    1.805569] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    1.805863] NET: Registered protocol family 17
[    1.805879] NET: Registered protocol family 15
[    1.805897] bridge: filtering via arp/ip/ip6tables is no longer availabl=
e by default. Update your scripts to load br_netfilter if you need this.
[    1.805910] Ebtables v2.0 registered
[    1.805989] can: controller area network core (rev 20170425 abi 9)
[    1.806021] NET: Registered protocol family 29
[    1.806035] can: raw protocol (rev 20170425)
[    1.806042] can: broadcast manager protocol (rev 20170425 t)
[    1.806052] can: netlink gateway (rev 20170425) max_hops=3D1
[    1.806234] Bluetooth: RFCOMM TTY layer initialized
[    1.806246] Bluetooth: RFCOMM socket layer initialized
[    1.806260] Bluetooth: RFCOMM ver 1.11
[    1.806274] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[    1.806281] Bluetooth: BNEP filters: protocol multicast
[    1.806292] Bluetooth: BNEP socket layer initialized
[    1.806299] Bluetooth: HIDP (Human Interface Emulation) ver 1.2
[    1.806309] Bluetooth: HIDP socket layer initialized
[    1.806401] 9pnet: Installing 9P2000 support
[    1.806423] Key type dns_resolver registered
[    1.806753] registered taskstats version 1
[    1.807057] Btrfs loaded, crc32c=3Dcrc32c-generic
[    1.811584] ff000000.serial: ttyPS0 at MMIO 0xff000000 (irq =3D 25, base=
_baud =3D 6249999) is a xuartps
[    3.217603] console [ttyPS0] enabled
[    3.221863] ff010000.serial: ttyPS1 at MMIO 0xff010000 (irq =3D 26, base=
_baud =3D 6249999) is a xuartps
[    3.232144] xilinx-psgtr fd400000.zynqmp_phy: Lane:1 type:8 protocol:4 p=
ll_locked:yes
[    3.240314] PLL: shutdown
[    3.243023] PLL: shutdown
[    3.246006] PLL: enable
[    3.248546] PLL: shutdown
[    3.252215] PLL: enable
[    3.254735] xilinx-dp-snd-codec fd4a0000.zynqmp-display:zynqmp_dp_snd_co=
dec0: Xilinx DisplayPort Sound Codec probed
[    3.265391] xilinx-dp-snd-pcm zynqmp_dp_snd_pcm0: Xilinx DisplayPort Sou=
nd PCM probed
[    3.273422] xilinx-dp-snd-pcm zynqmp_dp_snd_pcm1: Xilinx DisplayPort Sou=
nd PCM probed
[    3.281728] xilinx-dp-snd-card fd4a0000.zynqmp-display:zynqmp_dp_snd_car=
d: xilinx-dp-snd-codec-dai <-> xilinx-dp-snd-codec-dai mapping ok
[    3.294157] xilinx-dp-snd-card fd4a0000.zynqmp-display:zynqmp_dp_snd_car=
d: xilinx-dp-snd-codec-dai <-> xilinx-dp-snd-codec-dai mapping ok
[    3.306929] xilinx-dp-snd-card fd4a0000.zynqmp-display:zynqmp_dp_snd_car=
d: Xilinx DisplayPort Sound Card probed
[    3.317104] OF: graph: no port node found in /amba/zynqmp-display@fd4a00=
00
[    3.324086] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    3.330702] [drm] No driver support for vblank timestamp query.
[    3.336677] xlnx-drm xlnx-drm.0: bound fd4a0000.zynqmp-display (ops zynq=
mp_dpsub_component_ops)
[    4.423170] [drm] Cannot find any crtc or sizes
[    4.427862] [drm] Initialized xlnx 1.0.0 20130509 for fd4a0000.zynqmp-di=
splay on minor 0
[    4.435971] zynqmp-display fd4a0000.zynqmp-display: ZynqMP DisplayPort S=
ubsystem driver probed
[    4.444917] xilinx-psgtr fd400000.zynqmp_phy: Lane:3 type:3 protocol:2 p=
ll_locked:yes
[    4.462856] ahci-ceva fd0c0000.ahci: AHCI 0001.0301 32 slots 2 ports 6 G=
bps 0x3 impl platform mode
[    4.471819] ahci-ceva fd0c0000.ahci: flags: 64bit ncq sntf pm clo only p=
mp fbs pio slum part ccc sds apst=20
[    4.482090] scsi host0: ahci-ceva
[    4.485579] scsi host1: ahci-ceva
[    4.488987] ata1: SATA max UDMA/133 mmio [mem 0xfd0c0000-0xfd0c1fff] por=
t 0x100 irq 23
[    4.496906] ata2: SATA max UDMA/133 mmio [mem 0xfd0c0000-0xfd0c1fff] por=
t 0x180 irq 23
[    4.506765] xilinx-psgtr fd400000.zynqmp_phy: Lane:2 type:0 protocol:3 p=
ll_locked:yes
[    4.514811] xhci-hcd xhci-hcd.0.auto: xHCI Host Controller
[    4.520307] xhci-hcd xhci-hcd.0.auto: new USB bus registered, assigned b=
us number 1
[    4.528171] xhci-hcd xhci-hcd.0.auto: hcc params 0x0238f625 hci version =
0x100 quirks 0x22010810
[    4.536895] xhci-hcd xhci-hcd.0.auto: irq 31, io mem 0xfe200000
[    4.542920] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002
[    4.549709] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    4.556927] usb usb1: Product: xHCI Host Controller
[    4.561806] usb usb1: Manufacturer: Linux 4.14.0-xilinx-v2018.3 xhci-hcd
[    4.568505] usb usb1: SerialNumber: xhci-hcd.0.auto
[    4.573657] hub 1-0:1.0: USB hub found
[    4.577422] hub 1-0:1.0: 1 port detected
[    4.581511] xhci-hcd xhci-hcd.0.auto: xHCI Host Controller
[    4.587002] xhci-hcd xhci-hcd.0.auto: new USB bus registered, assigned b=
us number 2
[    4.594757] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003
[    4.601545] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    4.608765] usb usb2: Product: xHCI Host Controller
[    4.613640] usb usb2: Manufacturer: Linux 4.14.0-xilinx-v2018.3 xhci-hcd
[    4.620333] usb usb2: SerialNumber: xhci-hcd.0.auto
[    4.625425] hub 2-0:1.0: USB hub found
[    4.629188] hub 2-0:1.0: 1 port detected
[    4.634194] pca953x 0-0020: 0-0020 supply vcc not found, using dummy reg=
ulator
[    4.644147] pca953x 0-0020: interrupt support not compiled in
[    4.650673] at24 2-0054: 1024 byte 24c08 EEPROM, writable, 1 bytes/write
[    4.657402] i2c i2c-0: Added multiplexed i2c bus 2
[    4.662372] i2c i2c-0: Added multiplexed i2c bus 3
[    4.667403] i2c i2c-0: Added multiplexed i2c bus 4
[    4.672779] ina2xx 5-0040: power monitor ina226 (Rshunt =3D 5000 uOhm)
[    4.679168] i2c i2c-0: Added multiplexed i2c bus 5
[    4.684081] i2c i2c-0: Added multiplexed i2c bus 6
[    4.688995] i2c i2c-0: Added multiplexed i2c bus 7
[    4.693898] i2c i2c-0: Added multiplexed i2c bus 8
[    4.698810] i2c i2c-0: Added multiplexed i2c bus 9
[    4.703596] pca954x 0-0074: registered 8 multiplexed busses for I2C swit=
ch pca9548
[    4.711185] cdns-i2c ff030000.i2c: 400 kHz mmio ff030000 irq 17
[    4.763165] mmc0: SDHCI controller on ff170000.mmc [ff170000.mmc] using =
ADMA 64-bit
[    4.777170] rtc_zynqmp ffa60000.rtc: setting system clock to 2019-08-29 =
10:15:57 UTC (1567073757)
[    4.786044] of_cfs_init
[    4.788503] of_cfs_init: OK
[    4.791391] clk: Not disabling unused clocks
[    4.795903] ALSA device list:
[    4.798857]   #0: DisplayPort monitor
[    4.817352] ata2: SATA link down (SStatus 0 SControl 330)
[    4.822775] ata1: SATA link down (SStatus 0 SControl 330)
[    4.828341] Freeing unused kernel memory: 512K
[    4.846616] mmc0: new high speed SDHC card at address aaaa
[    4.852383] mmcblk0: mmc0:aaaa SB16G 14.8 GiB=20
[    4.860801]  mmcblk0: p1 p2
[    4.937988] udevd[1697]: starting version 3.2.7
[    4.944219] udevd[1697]: specified group 'kvm' unknown
[    4.951977] udevd[1698]: starting eudev-3.2.7
[    4.988143] udevd[1698]: specified group 'kvm' unknown
[    5.387124] pps pps0: new PPS source ptp0
[    5.391168] macb ff0e0000.ethernet: gem-ptp-timer ptp clock registered.
[    5.397885] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
[    5.559166] [drm] Cannot find any crtc or sizes
[    6.411277] macb ff0e0000.ethernet eth0: link up (1000/Full)
[    6.416946] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
[  184.551843] jailhouse: loading out-of-tree module taints kernel.
[  208.414320] The Jailhouse is opening.
[  219.278507] random: crng init done
[  300.691463] CPU3: shutdown
[  300.694172] psci: CPU3 killed.
[  300.718159] Created Jailhouse cell "ZCU104-baremetal"

------=_Part_3601_1561051750.1567075460482--
