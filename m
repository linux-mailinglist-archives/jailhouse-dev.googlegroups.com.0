Return-Path: <jailhouse-dev+bncBCJ2NIVKYUNBBPHOWP6QKGQEX5JYXQA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3b.google.com (mail-qv1-xf3b.google.com [IPv6:2607:f8b0:4864:20::f3b])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8792B0159
	for <lists+jailhouse-dev@lfdr.de>; Thu, 12 Nov 2020 09:50:05 +0100 (CET)
Received: by mail-qv1-xf3b.google.com with SMTP id w6sf3353669qvr.15
        for <lists+jailhouse-dev@lfdr.de>; Thu, 12 Nov 2020 00:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=XIZ5nEV8b22mKK6H8gP6fC38Z2bgwsrg67QJ3FRV77U=;
        b=MlyR6cPxEz857VSxBrt25pZaHOb9l+mwUzq4EzYnTjh7XghxN3JFyxAlYGrNRI2ph7
         WAKGtWgJhx06qcZhfLBjhVHVTLDTkxSkfloMGhi+AG1kBXAXV/pXFwGP5zyIIr7Oe3wg
         OeHUKs+1zG4k9UFDCpUak29u8k/9dNMo9BNvy2C3NQyh3rNtjtUMiqKQ78VYqWpbD8NO
         SoRdOfL/RFSsSbrzTmrC8kRhAOeOvYrznUj0KhVPd8bH5wL0HY/5prF4KQwmaJNwX1U2
         UgU+GRqQTX6FN2hzD/3LaRjUPtFE+PSdns+IknRJuhxnseZ3iFcztIyL/O+eK8a46rmu
         q51w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XIZ5nEV8b22mKK6H8gP6fC38Z2bgwsrg67QJ3FRV77U=;
        b=q9DumC1u4zWeFQxwsAbTq9IMq5zbvz90ae7mq84bY8ILg8v5uiGf+9CByNWLnl1/9C
         BAxcqzRd/iRfzcfuwwAOmJgh21YDup0SnzqmsViB1gKatz20r5KCozpySHFN0LbaCgVD
         QPFnyddnD5qGuS14G4G7Q14gPBn1T7tonD2NMoQS0ZXraqLiwEyyQ548/ealK+9HOxxy
         qKmX0ixe7T6tSRkFVn1nHtD59cRZWlf+yRIQislygRoAmjdoTWmC2JQHmaCjGocMM+tV
         PyhKunTULa5o5kqmCmU5sm73s2KKjVO0xrN4gK5QsHlVr3nfzDjYDQc0ScsNzN+f7zmO
         8HVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XIZ5nEV8b22mKK6H8gP6fC38Z2bgwsrg67QJ3FRV77U=;
        b=b9507M3/ovxs2sOaj51CRaMLlckRD5rq23FyqfEgJcKPVdFlrdF/1t1cLszxTFKiuD
         HxjKCj+PZAIWN7juBqg0iBGIp5jNFhf70oDAPzGdHmW3dQKa5ZrVZuqPASNhtxxVLuro
         bYG5z6b8npWPrCY5cUKmGx833y9IVX9khXjsq+l2SYlLMFTM67P+w7AYbJJXKaVgiW5n
         aVhfVPXbgSl8zeBwtYRXCfpfOgW//fsUIMLcLElQtshmd/lYU/DCl6JYqxB2M5EYd4Vs
         QnbLU2u5tULsVWqvo0WEZ52tRKoDGB1xQFe+Qmdih+7m8eyMwsYubvuvYiFe4uUpdiqr
         2bLA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532nFmT4BfzzzCv76/zUNhbdWi6VQKOaVbBCRbeNv/XqY+0nd+x5
	lfJTfQgoJqeJ/eQWhyUOenI=
X-Google-Smtp-Source: ABdhPJxv8A9VcbLG5NFCb6qcurWDCxiD1yu53OpiTUphjXs76UutrM43YNow9C1/DW1Ydb5o01nSsA==
X-Received: by 2002:a0c:e0c9:: with SMTP id x9mr29607306qvk.56.1605171004575;
        Thu, 12 Nov 2020 00:50:04 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0c:b897:: with SMTP id y23ls526020qvf.5.gmail; Thu, 12 Nov
 2020 00:50:03 -0800 (PST)
X-Received: by 2002:a05:6214:4e5:: with SMTP id cl5mr1749179qvb.42.1605171003401;
        Thu, 12 Nov 2020 00:50:03 -0800 (PST)
Date: Thu, 12 Nov 2020 00:50:02 -0800 (PST)
From: Peter pan <peter.panjf@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <e223356c-fc2c-4c3b-98c3-6d27fba1099an@googlegroups.com>
Subject: one question about MSI-X support for vPCI
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_280_2060260567.1605171002273"
X-Original-Sender: peter.panjf@gmail.com
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

------=_Part_280_2060260567.1605171002273
Content-Type: multipart/alternative; 
	boundary="----=_Part_281_962156904.1605171002273"

------=_Part_281_962156904.1605171002273
Content-Type: text/plain; charset="UTF-8"

Dear Jailhouse Community,

I am runing Jailhouse on kernel v5.4, and port some ivshmem patches from 
http://git.kiszka.org/?p=linux.git;a=summary

The issue I have is uio_shmem and ivshmem-net will probe failed when I use 
MSI-X mode for vPCI after I run Jailhouse enable command.  Please find the 
folowing log:

[   21.581019] jailhouse: loading out-of-tree module taints kernel.

[   30.000988] pci-host-generic fb500000.pci: host bridge /pci@0 ranges:

[   30.000997] pci-host-generic fb500000.pci:   MEM 0xfb600000..0xfb603fff 
-> 0xfb600000

[   30.001028] pci-host-generic fb500000.pci: ECAM at [mem 
0xfb500000-0xfb5fffff] for [bus 00]

[   30.001081] pci-host-generic fb500000.pci: PCI host bridge to bus 0003:00

[   30.001085] pci_bus 0003:00: root bus resource [bus 00]

[   30.001087] pci_bus 0003:00: root bus resource [mem 
0xfb600000-0xfb603fff]

[   30.001105] pci 0003:00:00.0: [110a:4106] type 00 class 0xff0000

[   30.001128] pci 0003:00:00.0: reg 0x10: [mem 0x00000000-0x00000fff]

[   30.001136] pci 0003:00:00.0: reg 0x14: [mem 0x00000000-0x000001ff]

[   30.001340] pci 0003:00:01.0: [110a:4106] type 00 class 0xff0001

[   30.001359] pci 0003:00:01.0: reg 0x10: [mem 0x00000000-0x00000fff]

[   30.001368] pci 0003:00:01.0: reg 0x14: [mem 0x00000000-0x000001ff]

[   30.002389] pci 0003:00:00.0: BAR 0: assigned [mem 0xfb600000-0xfb600fff]

[   30.002397] pci 0003:00:01.0: BAR 0: assigned [mem 0xfb601000-0xfb601fff]

[   30.002403] pci 0003:00:00.0: BAR 1: assigned [mem 0xfb602000-0xfb6021ff]

[   30.002409] pci 0003:00:01.0: BAR 1: assigned [mem 0xfb602200-0xfb6023ff]

[   30.002478] uio_ivshmem 0003:00:00.0: enabling device (0000 -> 0002)

[   30.002505] uio_ivshmem 0003:00:00.0: state_table at 0x00000000fb700000, 
size 0x0000000000001000

[   30.002512] uio_ivshmem 0003:00:00.0: rw_section at 0x00000000fb701000, 
size 0x0000000000009000

[   30.002520] uio_ivshmem 0003:00:00.0: input_sections at 
0x00000000fb70a000, size 0x0000000000006000

[   30.002524] uio_ivshmem 0003:00:00.0: output_section at 
0x00000000fb70a000, size 0x0000000000002000

[   30.002576] uio_ivshmem: probe of 0003:00:00.0 failed with error -28

[   30.002620] ivshmem-net 0003:00:01.0: enabling device (0000 -> 0002)

[   30.002664] ivshmem-net 0003:00:01.0: TX memory at 0x00000000fb801000, 
size 0x000000000007f000

[   30.002667] ivshmem-net 0003:00:01.0: RX memory at 0x00000000fb880000, 
size 0x000000000007f000

[   30.047630] ivshmem-net: probe of 0003:00:01.0 failed with error -28

[   30.047714] The Jailhouse is opening.

After some investigation I found the dts node of vPIC is added to root cell 
by using vpci_template.dts,  the Jailhouse driver create_vpci_of_overlay() 
in driver/pci.c can't add the handler of "msi-parent" to this PCI node,  
but the kernel driver of the virtual PCI device use the following function 
ret = pci_alloc_irq_vectors(pdev, 1, 2, PCI_IRQ_LEGACY | PCI_IRQ_MSIX);
So the  driver will probe MSIX irq for the device, because there is no msi 
controller is speficied to vPCI, the result is no irq-domain is provided to 
this PCI and irq allocated failed.

so how to fix such issue? Appreciate any comments and suggestions, thanks.

Best Regards,
Jiafei.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e223356c-fc2c-4c3b-98c3-6d27fba1099an%40googlegroups.com.

------=_Part_281_962156904.1605171002273
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Jailhouse Community,<div><br></div><div>I am runing Jailhouse on kerne=
l v5.4, and port some ivshmem patches from&nbsp;<a href=3D"http://git.kiszk=
a.org/?p=3Dlinux.git;a=3Dsummary">http://git.kiszka.org/?p=3Dlinux.git;a=3D=
summary</a></div><div><br></div><div>The issue I have is uio_shmem and ivsh=
mem-net will probe failed when I use MSI-X mode for vPCI after I run Jailho=
use enable command.&nbsp; Please find the folowing log:</div><div><br></div=
><div><p>[&nbsp;&nbsp; 21.581019] jailhouse: loading out-of-tree
module taints kernel.</p>

<p>[&nbsp;&nbsp; 30.000988] pci-host-generic fb500000.pci:
host bridge /pci@0 ranges:</p>

<p>[&nbsp;&nbsp; 30.000997] pci-host-generic
fb500000.pci:&nbsp;&nbsp; MEM
0xfb600000..0xfb603fff -&gt; 0xfb600000</p>

<p>[&nbsp;&nbsp; 30.001028] pci-host-generic fb500000.pci:
ECAM at [mem 0xfb500000-0xfb5fffff] for [bus 00]</p>

<p>[&nbsp;&nbsp; 30.001081] pci-host-generic fb500000.pci:
PCI host bridge to bus 0003:00</p>

<p>[&nbsp;&nbsp; 30.001085] pci_bus 0003:00: root bus
resource [bus 00]</p>

<p>[&nbsp;&nbsp; 30.001087] pci_bus 0003:00: root bus
resource [mem 0xfb600000-0xfb603fff]</p>

<p>[&nbsp;&nbsp; 30.001105] pci 0003:00:00.0: [110a:4106]
type 00 class 0xff0000</p>

<p>[&nbsp;&nbsp; 30.001128] pci 0003:00:00.0: reg 0x10: [mem
0x00000000-0x00000fff]</p>

<p>[&nbsp;&nbsp; 30.001136] pci 0003:00:00.0: reg 0x14: [mem
0x00000000-0x000001ff]</p>

<p>[&nbsp;&nbsp; 30.001340] pci 0003:00:01.0: [110a:4106]
type 00 class 0xff0001</p>

<p>[&nbsp;&nbsp; 30.001359] pci 0003:00:01.0: reg 0x10: [mem
0x00000000-0x00000fff]</p>

<p>[&nbsp;&nbsp; 30.001368] pci 0003:00:01.0: reg 0x14: [mem
0x00000000-0x000001ff]</p>

<p>[&nbsp;&nbsp; 30.002389] pci 0003:00:00.0: BAR 0: assigned
[mem 0xfb600000-0xfb600fff]</p>

<p>[&nbsp;&nbsp; 30.002397] pci 0003:00:01.0: BAR 0: assigned
[mem 0xfb601000-0xfb601fff]</p>

<p>[&nbsp;&nbsp; 30.002403] pci 0003:00:00.0: BAR 1: assigned
[mem 0xfb602000-0xfb6021ff]</p>

<p>[&nbsp;&nbsp; 30.002409] pci 0003:00:01.0: BAR 1: assigned
[mem 0xfb602200-0xfb6023ff]</p>

<p>[&nbsp;&nbsp; 30.002478] uio_ivshmem 0003:00:00.0:
enabling device (0000 -&gt; 0002)</p>

<p>[&nbsp;&nbsp; 30.002505] uio_ivshmem 0003:00:00.0:
state_table at 0x00000000fb700000, size 0x0000000000001000</p>

<p>[&nbsp;&nbsp; 30.002512] uio_ivshmem 0003:00:00.0:
rw_section at 0x00000000fb701000, size 0x0000000000009000</p>

<p>[&nbsp;&nbsp; 30.002520] uio_ivshmem 0003:00:00.0:
input_sections at 0x00000000fb70a000, size 0x0000000000006000</p>

<p>[&nbsp;&nbsp; 30.002524] uio_ivshmem 0003:00:00.0:
output_section at 0x00000000fb70a000, size 0x0000000000002000</p>

<p>[&nbsp;&nbsp; 30.002576] <font color=3D"#ff0000">uio_ivshmem: probe of
0003:00:00.0 failed with error -28</font><br></p>

<p>[&nbsp;&nbsp; 30.002620] ivshmem-net 0003:00:01.0:
enabling device (0000 -&gt; 0002)</p>

<p>[&nbsp;&nbsp; 30.002664] ivshmem-net 0003:00:01.0: TX
memory at 0x00000000fb801000, size 0x000000000007f000</p>

<p>[&nbsp;&nbsp; 30.002667] ivshmem-net 0003:00:01.0: RX
memory at 0x00000000fb880000, size 0x000000000007f000</p>

<p>[&nbsp;&nbsp; 30.047630] <font color=3D"#ff0000">ivshmem-net: probe of
0003:00:01.0 failed with error -28</font><br></p>

<p>[&nbsp;&nbsp; 30.047714] The Jailhouse is opening.</p></div><div><br></d=
iv><div>After some investigation I found the dts node of vPIC is added to r=
oot cell by using vpci_template.dts,&nbsp; the Jailhouse driver&nbsp;create=
_vpci_of_overlay() in&nbsp;driver/pci.c can't add the handler of "msi-paren=
t" to this PCI node,&nbsp; but the kernel driver of the virtual PCI device =
use the following function&nbsp;</div><div>ret =3D pci_alloc_irq_vectors(pd=
ev, 1, 2, PCI_IRQ_LEGACY | <font color=3D"#ff0000">PCI_IRQ_MSIX)</font>;<br=
></div><div>So the&nbsp; driver will probe MSIX irq for the device, because=
 there is no msi controller is speficied to vPCI, the result is no irq-doma=
in is provided to this PCI and irq allocated failed.</div><div><br></div><d=
iv>so how to fix such issue? Appreciate any comments and suggestions, thank=
s.</div><div><br></div><div>Best Regards,</div><div>Jiafei.</div><div><br><=
/div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/e223356c-fc2c-4c3b-98c3-6d27fba1099an%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/e223356c-fc2c-4c3b-98c3-6d27fba1099an%40googlegroups.co=
m</a>.<br />

------=_Part_281_962156904.1605171002273--

------=_Part_280_2060260567.1605171002273--
