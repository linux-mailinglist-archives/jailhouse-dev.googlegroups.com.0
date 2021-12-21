Return-Path: <jailhouse-dev+bncBCWJRXUWVQPBBVFGQ6HAMGQEGS3M4WI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3e.google.com (mail-qv1-xf3e.google.com [IPv6:2607:f8b0:4864:20::f3e])
	by mail.lfdr.de (Postfix) with ESMTPS id B135A47C087
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Dec 2021 14:15:01 +0100 (CET)
Received: by mail-qv1-xf3e.google.com with SMTP id o14-20020ad45c8e000000b004112b52fc2csf6391131qvh.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Dec 2021 05:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=QGm0oevCt5pWcEK9u83duxE+ETMH8fY6wlWmpYMTL1M=;
        b=hcFyMsFNtbvHxNh0+70+PmyTTg10GA/rPPxPE9qU+3VwhTq5BkPYyitiSEWN8MB4e0
         0szvERQkLlUFstftYoHNamzBqQeVZYbPDW1VBHg6AlvCjgfPxDokhVybh19K4g9B/JNW
         SEHVHKoaSdMe/whEJnP+GMvUg/my5tzX5R57x07gLOcJyaG/DV2shLNlA7OA95zJ8YMc
         i0/kCraVeEC57PuU5cQpYy3xw5yEtQmSmXZku55stVBUYdjwifAiIUgYOSAJ3WoTWFm1
         rP/+pFH9I39i0WQQNPH6VLW32EaiNNm+7DLOxrbiQJPayDG383mv3XyqdpGYhag51HhI
         GHUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=QGm0oevCt5pWcEK9u83duxE+ETMH8fY6wlWmpYMTL1M=;
        b=F9rIoZeMsRUc8thSjnM1Ik/NfsxKkw8eKtEQLCnA9HyP6zZWR4+XvvoA+xztkeZKT1
         +NXMXrAkPdievM3giue4iMmIT+t76KJgdHIoj9a+3ZAl3Bunw9R9nlUAYkexPrOZo68f
         +A3yQo6r2IFBUcH15MOMo+uDVRHJ5VNdswPf/Ey15GcwvjgSakVGRRgEAk6ewOhi8GEA
         +VWA8hnVWOQVyKiw2t238WueGW5yG09hZXxVttBQnz2KOMLBnneYgysEYXlAqzskjBKU
         I7+sA1/VNqD7NzgQnSeuWsKjbBXgDdWS26icC6DLGTTxczp40v4IenUtHu7GHZMpFMF8
         PQEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=QGm0oevCt5pWcEK9u83duxE+ETMH8fY6wlWmpYMTL1M=;
        b=XhM9Q8Tlnzmufi5xaNqepNn3LySXq6LE7XhpKdmjtbRGUo9d2s4B9ucYLn1R4gsD7e
         xoEo6i1wTvL1K/RmOHjwiNBRLtSGA7J1W1aSDa4HZLeXqzyWebkcBTiRHR0BQdN8lLB5
         7OBA3Tv0DR9VVrbZx5UCEUUEZhKlmwjXBLFnErkAfdMhuNVpwELF5ilUcGXkE+CNkd2c
         KxX+TIZzxFWmEQrqbqwjmMXIZTUmRKipalkrn364yE2CB+8iNJVt1C9GzL4s8gApw3Hd
         opaaGE06XlYw3fBIJE2HlFNOdIMor0awpKobXp+65SqvQrIy7pjddyQjoL08kb76inuY
         /iww==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533acEMUPOFXx3wZncB86O6pZcsQeY8EMz28+z8rAN4vKf8ZOsLW
	+iI/Zut2HSyr2fWZpKOQfhw=
X-Google-Smtp-Source: ABdhPJwfU74ktYAsSE31eHOhHKmLTggQ7UU9N5HCM5vS86rBXMEf81GGOR1TfxAxJbAmZntdjANiqg==
X-Received: by 2002:a05:622a:1cd:: with SMTP id t13mr2069286qtw.487.1640092500797;
        Tue, 21 Dec 2021 05:15:00 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:7d47:: with SMTP id h7ls893838qtb.6.gmail; Tue, 21 Dec
 2021 05:15:00 -0800 (PST)
X-Received: by 2002:a05:622a:185:: with SMTP id s5mr2039779qtw.299.1640092500261;
        Tue, 21 Dec 2021 05:15:00 -0800 (PST)
Date: Tue, 21 Dec 2021 05:14:59 -0800 (PST)
From: jiajun huang <huangjiajun145041@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <5b7a5935-27c3-4970-8246-608d401865a4n@googlegroups.com>
In-Reply-To: <016d5fd0-be24-4dc4-0693-62c87622b768@siemens.com>
References: <56692931-19ec-4a1a-9df9-f7a44eaa1869n@googlegroups.com>
 <016d5fd0-be24-4dc4-0693-62c87622b768@siemens.com>
Subject: Re: Root Cell crash in QEMU
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_15472_1370272726.1640092499740"
X-Original-Sender: huangjiajun145041@gmail.com
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

------=_Part_15472_1370272726.1640092499740
Content-Type: multipart/alternative; 
	boundary="----=_Part_15473_198906962.1640092499740"

------=_Part_15473_198906962.1640092499740
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks!  The cause of the bug is that the MMIO address is not page aligned=
=EF=BC=81

=E5=9C=A82021=E5=B9=B410=E6=9C=8814=E6=97=A5=E6=98=9F=E6=9C=9F=E5=9B=9B UTC=
+8 17:59:56<j.kiszka...@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A

> On 01.10.21 18:40, jiajun huang wrote:
> > Dear Jailhouse community=EF=BC=8C
> >=20
> > I am currently running into an issue when trying boot jailhouse on QEMU=
.
> > I follow the guidelines on
> > https://github.com/siemens/jailhouse/tree/wip/kvm. When I use the
> > sysconfig.c created by "jailhouse config create -c ttyS0 --mem-hv 128M
> > --mem-inmates 1536M configs/x86/sysconfig.c" to enable root cell, the
> > issue "FATAL: Invalid PIO read, port: 5658 size: 4" and "FATAL: Invalid
> > MMIO/RAM read" happened. I solved these issues with the help of
> >=20
> https://events.static.linuxfound.org/sites/events/files/slides/ELCE2016-J=
ailhouse-Tutorial.pdf
> .
> > Attached is the modified sysconfig.c file. However, the root cell will
> > still crash with no log a few minutes later.=20
> >=20
> > Initializing Jailhouse hypervisor v0.12 (5-g06ba27d-dirty) on CPU 0
> > Code location: 0xfffffffff0000050
> > Using x2APIC
> > Page pool usage after early setup: mem 108/32207, remap 0/131072
> > Initializing processors:
> >  CPU 0... (APIC ID 0) OK
> >  CPU 1... (APIC ID 1) OK
> >  CPU 3... (APIC ID 3) OK
> >  CPU 2... (APIC ID 2) OK
> > Initializing unit: VT-d
> > DMAR unit @0xfed90000/0x1000
> > Reserving 24 interrupt(s) for device ff:00.0 at index 0
> > Initializing unit: IOAPIC
> > Initializing unit: Cache Allocation Technology
> > Initializing unit: PCI
> > Adding PCI device 00:00.0 to cell "RootCell"
> > Adding PCI device 00:01.0 to cell "RootCell"
> > Adding PCI device 00:02.0 to cell "RootCell"
> > Reserving 5 interrupt(s) for device 00:02.0 at index 24
> > Adding PCI device 00:1b.0 to cell "RootCell"
> > Reserving 1 interrupt(s) for device 00:1b.0 at index 29
> > Adding PCI device 00:1f.0 to cell "RootCell"
> > Adding PCI device 00:1f.2 to cell "RootCell"
> > Reserving 1 interrupt(s) for device 00:1f.2 at index 30
> > Adding PCI device 00:1f.3 to cell "RootCell"
> > Page pool usage after late setup: mem 333/32207, remap 65542/131072
> > Activating hypervisor
> >=20
> >=20
> > I want to know if I need to add all the missing PCI memory regions and
> > PCI IO ports to sysconfig.c according to the results of /proc/iomem and
> > /proc/ioports?
>
> Did you see configs/x86/qemu-x86.c already? That is supposed to work for
> the recommended command line and also the start-qemu.sh script from
> jailhouse-images. There are likely some subtle differences to the config
> the generator spits out, unfortunately. I haven't tried "config create"
> on QEMU in a long while, simply because we have a reference config, but
> maybe there is something that could be improved once you found the
> relevant differences.
>
> Jan
>
> --=20
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/5b7a5935-27c3-4970-8246-608d401865a4n%40googlegroups.com.

------=_Part_15473_198906962.1640092499740
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks!&nbsp;&nbsp;The cause of the bug is that the MMIO address is not pag=
e aligned=EF=BC=81<br><br><div class=3D"gmail_quote"><div dir=3D"auto" clas=
s=3D"gmail_attr">=E5=9C=A82021=E5=B9=B410=E6=9C=8814=E6=97=A5=E6=98=9F=E6=
=9C=9F=E5=9B=9B UTC+8 17:59:56&lt;j.kiszka...@gmail.com> =E5=86=99=E9=81=93=
=EF=BC=9A<br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 =
0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">On =
01.10.21 18:40, jiajun huang wrote:
<br>&gt; Dear Jailhouse community=EF=BC=8C
<br>&gt;=20
<br>&gt; I am currently running into an issue when trying boot jailhouse on=
 QEMU.
<br>&gt; I follow the guidelines on
<br>&gt; <a href=3D"https://github.com/siemens/jailhouse/tree/wip/kvm" targ=
et=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.c=
om/url?hl=3Dzh-CN&amp;q=3Dhttps://github.com/siemens/jailhouse/tree/wip/kvm=
&amp;source=3Dgmail&amp;ust=3D1640178095855000&amp;usg=3DAFQjCNHDCAsLZ7ah7a=
0wBtiMzxXcQv16iQ">https://github.com/siemens/jailhouse/tree/wip/kvm</a>. Wh=
en I use the
<br>&gt; sysconfig.c created by &quot;jailhouse config create -c ttyS0 --me=
m-hv 128M
<br>&gt; --mem-inmates 1536M configs/x86/sysconfig.c&quot; to enable root c=
ell, the
<br>&gt; issue &quot;FATAL: Invalid PIO read, port: 5658 size: 4&quot; and =
&quot;FATAL: Invalid
<br>&gt; MMIO/RAM read&quot; happened. I solved these issues with the help =
of
<br>&gt; <a href=3D"https://events.static.linuxfound.org/sites/events/files=
/slides/ELCE2016-Jailhouse-Tutorial.pdf" target=3D"_blank" rel=3D"nofollow"=
 data-saferedirecturl=3D"https://www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttp=
s://events.static.linuxfound.org/sites/events/files/slides/ELCE2016-Jailhou=
se-Tutorial.pdf&amp;source=3Dgmail&amp;ust=3D1640178095855000&amp;usg=3DAFQ=
jCNFc6jxqwbT14zHypcwF3elFCzZshg">https://events.static.linuxfound.org/sites=
/events/files/slides/ELCE2016-Jailhouse-Tutorial.pdf</a>.
<br>&gt; Attached is the modified sysconfig.c file. However, the root cell =
will
<br>&gt; still crash with no log a few minutes later.=C2=A0
<br>&gt;=20
<br>&gt; Initializing Jailhouse hypervisor v0.12 (5-g06ba27d-dirty) on CPU =
0
<br>&gt; Code location: 0xfffffffff0000050
<br>&gt; Using x2APIC
<br>&gt; Page pool usage after early setup: mem 108/32207, remap 0/131072
<br>&gt; Initializing processors:
<br>&gt; =C2=A0CPU 0... (APIC ID 0) OK
<br>&gt; =C2=A0CPU 1... (APIC ID 1) OK
<br>&gt; =C2=A0CPU 3... (APIC ID 3) OK
<br>&gt; =C2=A0CPU 2... (APIC ID 2) OK
<br>&gt; Initializing unit: VT-d
<br>&gt; DMAR unit @0xfed90000/0x1000
<br>&gt; Reserving 24 interrupt(s) for device ff:00.0 at index 0
<br>&gt; Initializing unit: IOAPIC
<br>&gt; Initializing unit: Cache Allocation Technology
<br>&gt; Initializing unit: PCI
<br>&gt; Adding PCI device 00:00.0 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 00:01.0 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 00:02.0 to cell &quot;RootCell&quot;
<br>&gt; Reserving 5 interrupt(s) for device 00:02.0 at index 24
<br>&gt; Adding PCI device 00:1b.0 to cell &quot;RootCell&quot;
<br>&gt; Reserving 1 interrupt(s) for device 00:1b.0 at index 29
<br>&gt; Adding PCI device 00:1f.0 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 00:1f.2 to cell &quot;RootCell&quot;
<br>&gt; Reserving 1 interrupt(s) for device 00:1f.2 at index 30
<br>&gt; Adding PCI device 00:1f.3 to cell &quot;RootCell&quot;
<br>&gt; Page pool usage after late setup: mem 333/32207, remap 65542/13107=
2
<br>&gt; Activating hypervisor
<br>&gt;=20
<br>&gt;=20
<br>&gt; I want to know if I need to add all the missing PCI memory regions=
 and
<br>&gt; PCI IO ports to sysconfig.c according to the results of /proc/iome=
m and
<br>&gt; /proc/ioports?
<br>
<br>Did you see configs/x86/qemu-x86.c already? That is supposed to work fo=
r
<br>the recommended command line and also the start-qemu.sh script from
<br>jailhouse-images. There are likely some subtle differences to the confi=
g
<br>the generator spits out, unfortunately. I haven&#39;t tried &quot;confi=
g create&quot;
<br>on QEMU in a long while, simply because we have a reference config, but
<br>maybe there is something that could be improved once you found the
<br>relevant differences.
<br>
<br>Jan
<br>
<br>--=20
<br>Siemens AG, T RDA IOT
<br>Corporate Competence Center Embedded Linux
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/5b7a5935-27c3-4970-8246-608d401865a4n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/5b7a5935-27c3-4970-8246-608d401865a4n%40googlegroups.co=
m</a>.<br />

------=_Part_15473_198906962.1640092499740--

------=_Part_15472_1370272726.1640092499740--
