Return-Path: <jailhouse-dev+bncBCWJRXUWVQPBB4WSX6FAMGQEC4YSS2Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x838.google.com (mail-qt1-x838.google.com [IPv6:2607:f8b0:4864:20::838])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7674185FD
	for <lists+jailhouse-dev@lfdr.de>; Sun, 26 Sep 2021 05:31:00 +0200 (CEST)
Received: by mail-qt1-x838.google.com with SMTP id a18-20020aed2792000000b002a6d480aa95sf23765293qtd.14
        for <lists+jailhouse-dev@lfdr.de>; Sat, 25 Sep 2021 20:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=549Oqie6iAmZdEkga73tha2n8O5jGSMR9JHoRYrZlY4=;
        b=SF8VNmSaYlH/tAApMxF2vJO6+t3KP1WQW7e/ylVzuKiRm+a0faIOpZO6stue3qSObw
         zVB4fsAi13gc3WR+WoMHyM8LFSYPOZhIrecrK+qyW7B11MZmEG830aXUC1M2v7Fk/HXT
         cJWROW7GTCawJHVh2Q7sB9Eitxqb8A9iSe+8G2Vza9Qkn4XKu2q7h/XuPctQAtkm5Gez
         288QUBEE0keywf9DKFw2HRClxOG/7OujreWvurtwqwNJzDjY1vagQhMZkeqFxCEifSIL
         u6ik/Pk0cdYHzt/EINqmFNNEs4vNZ78H9aH8e+aHqQPTQ8cTrCxogrWhL4KDdrSCjP5F
         VVmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=549Oqie6iAmZdEkga73tha2n8O5jGSMR9JHoRYrZlY4=;
        b=FbFQAdxvbYoqMIMVoFF3hydpSFum2DHyzNCsArHmWA9Kd8zVvQsaGTn2U2KZZKyO8T
         4nDLv9oizdVDBUFChy3D8rNGdYyRBJ7dibNPx2UByQYg/PsdxzAVq22KbsbbMyVabn4L
         x2OTuVTLsP9+MEUSsQBADBgHndus4pNIpt6tII9zDs4LMzRGuWDCPJbwFU//6eCjoPK+
         L3SkVN9mfRDusxH+JxljhaQp7kFQopdmeNrwgkHQCXBIPKGx3fmI4AZ1jj+Vj9rFbOQX
         mBehzxbGH7Mi0bSfFYdkE+Cs1U4gvhSjAIamTnZvChNdscRHDXtbcwgwNw3Gr/TJ5vhz
         RDAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=549Oqie6iAmZdEkga73tha2n8O5jGSMR9JHoRYrZlY4=;
        b=cjavBLncwEZxUVGZjBtgunmf6nQ/O15e2fWcDQX3sbsHty+wGrQO3G8tug1NlzFRJc
         r6jZHZEjMWtY314KFhc2Yy2bMH5M3O3yTHdHA8ZkJLayv0UbJIGbIYV3ol49IFrgYysS
         h/gF6Ew1LHzLdsteyEzp4I6y8VHliTlaJOnc91esSEEjZcyf4poNBehCbH1IjFe3SveB
         KaeXqobmsVFs/RU/+X7asPR4rObhKQWJdn1kCXxp2pNgci88cUuSZ+d5Wh7EFqv15EBk
         aE0nboPcscFdfWovAaCrKTuL9ZyQknoOWF/x+LSitv0W/UJ2QChwVozbVR06O1SIx02Z
         G4hg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533PJfTh7MuxYvuJOKNBA6IjSwWXhjqFMCvxp14DhkJSKYqutAtf
	QGA+qWkq1Qh0lvQ72w7817M=
X-Google-Smtp-Source: ABdhPJzsE1LnxQMD+H3R27rhwmv1ci6lX8twx9HiS3cx7s1Hy3mwSwqMOcIgrWPgpJZ5sJ1dM4itng==
X-Received: by 2002:a05:6214:1233:: with SMTP id p19mr18082999qvv.20.1632627059005;
        Sat, 25 Sep 2021 20:30:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:bb05:: with SMTP id l5ls165413qkf.3.gmail; Sat, 25 Sep
 2021 20:30:58 -0700 (PDT)
X-Received: by 2002:a37:a548:: with SMTP id o69mr18233673qke.9.1632627058463;
        Sat, 25 Sep 2021 20:30:58 -0700 (PDT)
Date: Sat, 25 Sep 2021 20:30:57 -0700 (PDT)
From: =?UTF-8?B?6buE5a626am5?= <huangjiajun145041@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <2387af87-2391-4dff-b826-831ffac4d536n@googlegroups.com>
Subject: Crash when creating root cell in x86 -----FATAL: Invalid PIO read,
 port: 5658 size: 4
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2388_223517996.1632627057709"
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

------=_Part_2388_223517996.1632627057709
Content-Type: multipart/alternative; 
	boundary="----=_Part_2389_1542167892.1632627057709"

------=_Part_2389_1542167892.1632627057709
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
When I tried to execute jailhouse enable sysconfig.cell on x86 platform,=20
the machine crashed later. This happens in QEMU as well. So I dumped the=20
logs in QEMU and found that there was an error when jailhouse accessed port=
=20
5658 through PIO. Attached is the detailed log information. By the way, my=
=20
CPU is i5-9600K.

thanks=EF=BC=8C
 Jiajun

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/2387af87-2391-4dff-b826-831ffac4d536n%40googlegroups.com.

------=_Part_2389_1542167892.1632627057709
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,<div>When I tried to execute jailhouse enable sysconfig.cell on x86 plat=
form, the machine crashed later. This happens in QEMU as well. So I dumped =
the logs in QEMU and found that there was an error when jailhouse accessed =
port 5658 through PIO. Attached is the detailed log information. By the way=
, my CPU is i5-9600K.<br></div><div><br></div><div>thanks=EF=BC=8C</div><di=
v>&nbsp;Jiajun</div><div><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/2387af87-2391-4dff-b826-831ffac4d536n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/2387af87-2391-4dff-b826-831ffac4d536n%40googlegroups.co=
m</a>.<br />

------=_Part_2389_1542167892.1632627057709--

------=_Part_2388_223517996.1632627057709
Content-Type: text/plain; charset=US-ASCII; name=bug-log.txt
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=bug-log.txt
X-Attachment-Id: 751e2a27-fdc1-47bf-aafa-af57b672d15b
Content-ID: <751e2a27-fdc1-47bf-aafa-af57b672d15b>

Initializing Jailhouse hypervisor v0.12 (279-g6300012) on CPU 2
Code location: 0xfffffffff0000050
Using x2APIC
Page pool usage after early setup: mem 47/974, remap 0/131072
Initializing processors:
 CPU 2... (APIC ID 2) OK
 CPU 3... (APIC ID 3) OK
 CPU 1... (APIC ID 1) OK
 CPU 0... (APIC ID 0) OK
Initializing unit: VT-d
DMAR unit @0xfed90000/0x1000
Reserving 24 interrupt(s) for device ff:00.0 at index 0
Initializing unit: IOAPIC
Initializing unit: Cache Allocation Technology
Initializing unit: PCI
Adding PCI device 00:00.0 to cell "RootCell"
Adding PCI device 00:01.0 to cell "RootCell"
Adding PCI device 00:02.0 to cell "RootCell"
Reserving 5 interrupt(s) for device 00:02.0 at index 24
Adding PCI device 00:1b.0 to cell "RootCell"
Reserving 1 interrupt(s) for device 00:1b.0 at index 29
Adding PCI device 00:1f.0 to cell "RootCell"
Adding PCI device 00:1f.2 to cell "RootCell"
Reserving 1 interrupt(s) for device 00:1f.2 at index 30
Adding PCI device 00:1f.3 to cell "RootCell"
Page pool usage after late setup: mem 268/974, remap 65542/131072
Activating hypervisor
FATAL: Invalid PIO read, port: 5658 size: 4
RIP: 0xffffffffc0205443 RSP: 0xffff9ea57fc83de8 FLAGS: 86
RAX: 0x00000000564d5868 RBX: 0x0000000000000000 RCX: 0x0000000000000028
RDX: 0x0000000000005658 RSI: 0x0000000000000000 RDI: 0xffff9ea56b72b400
CS: 10 BASE: 0x0000000000000000 AR-BYTES: a09b EFER.LMA 1
CR0: 0x0000000080050033 CR3: 0x000000022a00a002 CR4: 0x0000000000362ee0
EFER: 0x0000000000000d01
Parking CPU 1 (Cell: "RootCell")
Ignoring NMI IPI to CPU 1
Ignoring NMI IPI to CPU 1

------=_Part_2388_223517996.1632627057709--
