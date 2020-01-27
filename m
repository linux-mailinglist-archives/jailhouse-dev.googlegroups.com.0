Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBL4KXLYQKGQEL4BBFHQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 73340149F09
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 07:37:36 +0100 (CET)
Received: by mail-lj1-x23c.google.com with SMTP id y15sf2217910lji.1
        for <lists+jailhouse-dev@lfdr.de>; Sun, 26 Jan 2020 22:37:36 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580107055; cv=pass;
        d=google.com; s=arc-20160816;
        b=trGsOlv0rINBS/C1VOGcBFciQY78Ex5H2ICD3+qx4fCZTZ1F4pmLmsjBmyhCMAgYfO
         HT0MCshXF1fPpnRO7nIRrpiwzHv9S3UAZkrnSlJaE9DWiX8K5hsdM+iMOhJbHx8nFZeE
         SqA/FzG+vlh9Z2sDWBsqA1/Nq0eavZQ1Sd2Ej3kkHFCA9dqMAavfZaImzNY9c14zoJVK
         fh4BKxJlWoTbxWsQB7mtEgs35sWvQRK8M8LnLjuE86DUvqylyzNKo1MrO9267FoNI3RB
         D8l20sL24Sam6I3OidHUGRj8Wp4UP62gslGLILiZECdRwqjD16AgXuPsQiAVKkknp3Pz
         UzOw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:mime-version:sender
         :dkim-signature;
        bh=JSeG7uSWWqzTR9UA1FSTCaJ5zgtsWMNSRe89v+g1jDg=;
        b=xaCBVOioBMZPATm+9Qsp60w4pKQejefUlVaBG6iYqyZCyJ1HZu7EA+Kc3zqiOusZb8
         3AS9OENHkq+hsy05AOVC9JV5sps53HdO5V5iw9KsIpaDmYgTBUoIDWoaclpxuyR1xmUw
         l2ovN/jKzT9jyJ/m127UBYY+efQwmsWFWc8bQEi2lXz4REwlFsuKBFWvCK629O+vA3PV
         14MR4tJ6TgjoA6k0rkMS47q9RYhlLKzl4vocxmNY7/px48P4+Xtf1p4NK/dDnb4c2dGN
         MGuQexzso6TJ++tcla9ilYGD1TQ56hMFF1pqDlgCg27lBQqk74EbVmWbyGQZNVaU4JdK
         PhKw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=HllUSAn3;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=JSeG7uSWWqzTR9UA1FSTCaJ5zgtsWMNSRe89v+g1jDg=;
        b=rGFUJtNva5K+QIIm4RAUupWRoPe9/6O70j7I3nY5o5HDvypgkOIeTYFknxUdXn/C1q
         UU4S85KikULRJcmyGakaCBAM6LhYcINfbpV6HbozK8mMdbMszDDK3V0nDtZ+x2Y/XZR+
         +nFglangMbgfQy3Y3PVe9vw9T2hFGGHBo6ESvf1/9Tm+nyqKisbgC4zsk2lGmvANsUrF
         v9y1GVSvmHq3UEnnxOpT8L89JvgBe08Eu3EVrqFu93O0/5l/b/y8GOmdD1iOtOnO2pY4
         3lwldR/QyoP/S46788f8L4iFxyoNzAwrNSJY5yrwOo8Efv1SvnuPlMG7Gdt5V/UV6WpU
         huIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=JSeG7uSWWqzTR9UA1FSTCaJ5zgtsWMNSRe89v+g1jDg=;
        b=TXw68omeI7VBtrmWkEcaJHEELkFGVVzSsG6YNoJBtYn7iKAQkQl6BiL6Bjbqh9TmT0
         bo2BKO5DGa5vzPXssHwaYejOgSfEwOde1/GHfsaplSvHG/E8XOS2sYIE8MiuYoOo6sIP
         FIsn+BXIeEKvpj+TMDYFkGwmnHtSDEaZqCwLA63nr/lu5p8mVzPRvPAQvmeYx69fuMsm
         hKeij/VUZJx4plwMV/ZyZF2cIbclBEajoB5Gdw1bCZBfukyZivFIbF0wSF+sGAJ+YDqY
         5VhbenzwJEAspyOn5xJt0DUlrajEYmbt3yr99wEFJdfHrmUbeDhJoScbex7dn7i5RA1S
         S91w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUdBOarRnkU1Ek1BSl7CFptsQlKjlzWt9VFlMbiP2c9EUw6ud/i
	7AZuO839hIKicUIH9JJRRjw=
X-Google-Smtp-Source: APXvYqxeKFOT+PmVs6qdp6/npfept03KCkRUj8GM9u3juw+aqYe9HozDNGnkFCwGn8tVAcydCax+SQ==
X-Received: by 2002:ac2:5444:: with SMTP id d4mr7199230lfn.49.1580107055459;
        Sun, 26 Jan 2020 22:37:35 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9c85:: with SMTP id x5ls1537096lji.0.gmail; Sun, 26 Jan
 2020 22:37:34 -0800 (PST)
X-Received: by 2002:a2e:84d0:: with SMTP id q16mr9333023ljh.138.1580107054691;
        Sun, 26 Jan 2020 22:37:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580107054; cv=none;
        d=google.com; s=arc-20160816;
        b=qPTUASqEtbI428zqP0k1qmE3elgtoyk/f6piVFgzJn2OaBPQYfLW4Sgjhgh4LZlIlm
         kzMo64ojYX29MRZv/sqAOK2y3g37CMawIuJ1p+2GtKzYmBa5dPMKQaPfk3ZR8QOUIsi7
         j8QZlgrBLTNTVLyVvx7pxGx3XLWTryvdBwTmrTT5s/C1HgcvYaoK19YSN5Q1V+LufygR
         xuTbmeM5fi+3/N3zkVfCC5Y8j6tsVkFZqH62mBjBGG0L2hhOMzHniey23XvPcUzTLhUc
         QhtGiPMye9wTpBbtu0ZQACZOBreyx5kpoV0Prm6c0Gi20znrfFfUi2lhqytmgWsd5BT5
         5alA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=6B4nwOg0wxDG9tB6HHewqe8EMtL3wH0MpbDpb3+gbkc=;
        b=ECAKrk7Twkrtb/uf1x2A/QEcLKhQjR6vxEWX4aseChbBD6rKKxS4+nX9LyIsv7o6KK
         zRjVYH9Z20wAhFR2Er7JQlgB6PPDwMvr0AFZeFTbjzZT0O++CpNHYSPoyXzYTIFbC6ur
         1xMBRz9n+DE2JFq5XfYVIfkezF8u/cqs4hQB08pxSJ7mthaydCo/vQw5O8K4zRNC1J6a
         FHyulQHPRJqiAh+4mmTXPV1aGZV/y0scoOEk4cBSiwbN+DERhYMcxR+N4ABz35p5eIu8
         qifV8EWkhDAvFcEI2eEO1FbPPoz6uNc23l5NpqNXBNhRGuMiTKhu76Ot2Zvx5uc80uks
         N/XQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=HllUSAn3;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id 68si466362lfi.3.2020.01.26.22.37.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Jan 2020 22:37:34 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([95.157.55.156]) by smtp.web.de
 (mrweb102 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0Le4Po-1jNNsf3ewe-00px1r; Mon, 27 Jan 2020 07:37:33 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH 3/3] Documentation: Update hypervisor interfaces specification
Date: Mon, 27 Jan 2020 07:37:26 +0100
Message-Id: <5ea60323214f8cbd4c12c529acfe5223a289a10c.1580107046.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1580107046.git.jan.kiszka@web.de>
References: <cover.1580107046.git.jan.kiszka@web.de>
In-Reply-To: <cover.1580107046.git.jan.kiszka@web.de>
References: <cover.1580107046.git.jan.kiszka@web.de>
X-Provags-ID: V03:K1:YPRV44W/wglyHL54Mk4x56AoAX57mAxPyY837bD+zOWLlOqhYFe
 lNDYTMr0MJ8LpFPnuPSpqKtCX9sXlVuOSapFHNacBupWX3v0BQni8yp075wUtu8d9mTVuel
 q6czapQGXBMHJdGAhGNrQXr1nmGSymQovEp5EioruKJucKHCgtY96TAQBpMrRp/u5ixE/HS
 wtm1LxHM33vir7x1Ds/Bw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3kub9PNJ3Po=:KaLq0/lvh7MaSJzd+fd8XA
 b3H12RDopSI6HFFRnX6wc6JggABV2db9SZyYLBPvYL8xbHAJBuLTXfWZDJgizLs3TuCPhzDxU
 rUi3E4Jn9iKq/hiTh3Tca2iTApNhghrR06kX/yLWx+T2dtfM4b3GZymvndCrBzElHiFpb+GCm
 ozCkipyeFLabcK+6CWmBEizMxyiThV3r6EwvF6kDXMXhSulH0Y/jNi4w0iBty3QjEn+AFuAjC
 QERgeVMX3/Aink3lRd1dTLYwxCxQPzCJ3k8Sjhm4DP2L1G96VvgPsyRtxHPTHrOekYJDPpuJp
 s5JGFu7aFy9JnK3loXYze36pNHMFgOI9/48Q05xOjO+eo2yG5RG942x639Ew7DTRGiDaOjQyt
 4D5A7ZQZX4Uf/7WotzG4q8PFMuoHzANFRuGMFznu+RMEjWcuhkH3EKzwhLx9mBPl4ohJE2d8S
 Hlj+0xac3OGxHYOEznmcjAMUGizQvlhhJr1dYD0c1Z3pd4nrtH8uqqUg7GZXeZv3/4D6C70Jy
 ErSjtnsdZQlJ/D/bpZDhxYHzCsZ5AIwg64p/0FL226vDu2HBMcjGxUlLmvYe997zgF7sPYnaM
 Ltc64CP1Ofn51uGToay5fd1iYlOlfag0y15FfqVbINFWMjRx1TkngmcBbxRMsevteqtjfF2VS
 H6uydIqGs8KrsZ2jCdDBFYdsRZKin6Sr/xxTzTMBUbyWXWWRQcLwWb1TAP+GFbpES4GU+UUtj
 WN0CPAqbqhIFB2kIZpXcbgxjG7qduEWnhMGhplk+r4iM2uLyElBWjqbv9ZYveTGPiLovXYVqI
 mRSW3mswD9g0XvjD07tFc7irBCDxKjZ1hqX8O0FAT2ocdL3P6Z1IYplECv//dvjPECbG96c2G
 WE4k6vzqUUm/h5aadQZlCYmuEmU9WqBu9yYzxD/cmI1Ycd94iPMWuQqgjzkhw8tkieqF5nVou
 4HQwbmicTS+75r00waPy8mWbzhfDHUqXvPhdTV3b0jNKA31pV7Jwo2gmMNFuselS/IqnpS7TJ
 SUSjX5l2p2k7++4sulipricgxYHuJVof38pJas4XmGjh3U1BJ6cam+AETOZNp9PF85/X4FNBI
 ij7bf4aaWZaC+IK+lUClNkM/+Tk83AUznpUWQz4LVpEX3ab6LCiBYczNIEQK65cTzAcLU5UCU
 wvVXZfytezGaTnKcFEf+OHDv5T/OAVSDCRa5M4Ovvgm+ti0+uHGWPreoiiTfes73FIJggQ6NI
 X5pPKIXGzj3qnQeOJ
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=HllUSAn3;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
Content-Type: text/plain; charset="UTF-8"
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Lots of things changed since the file was last touched. Add the
hypercall ABIs for non-Intel-x86, update the "CPU Get Info" hypercall
with new statistic types, and extend the Comm Region description with
the console and non-x86 extensions added meanwhile.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 Documentation/hypervisor-interfaces.txt | 152 ++++++++++++++++++++++++++------
 1 file changed, 125 insertions(+), 27 deletions(-)

diff --git a/Documentation/hypervisor-interfaces.txt b/Documentation/hypervisor-interfaces.txt
index f29bac43..74982e9d 100644
--- a/Documentation/hypervisor-interfaces.txt
+++ b/Documentation/hypervisor-interfaces.txt
@@ -13,7 +13,8 @@ Detection
 ---------

 This interface is useful for cell code that should work not only inside a
-Jailhouse cell. The ABI is architecture specific.
+Jailhouse cell. The ABI is architecture specific. So far, it is only available
+for x86.


 x86 ABI
@@ -63,16 +64,36 @@ a similar channel. Details of the hypercall ABI are architecture specific and
 will be defined in the following.


-Intel x86 (IA-32/32e) ABI
-- - - - - - - - - - - - -
+x86 ABI
+- - - -

-Instruction:    vmcall
+Instruction:    vmcall (IA-32/32e) / vmmcall (AMD64)
 Hypercall code: EAX
-1. argument:    RDI (IA-32e) / EDI (IA-32)
-2. argument:    RSI (IA-32e) / ESI (IA-32)
+1. argument:    RDI (64-bit mode) / EDI (32-bit mode)
+2. argument:    RSI (64-bit mode) / ESI (32-bit mode)
 Return code:    EAX


+ARMv7 ABI
+- - - - -
+
+Instruction:    hvc #0x4a48
+Hypercall code: r0
+1. argument:    r1
+2. argument:    r2
+Return code:    r0
+
+
+ARMv8 ABI
+- - - - -
+
+Instruction:    hvc #0x4a48
+Hypercall code: x0
+1. argument:    x1
+2. argument:    x2
+Return code:    x0
+
+
 Hypercall "Disable" (code 0)
 - - - - - - - - - - - - - - -

@@ -230,14 +251,31 @@ Hypercall "CPU Get Info" (code 7)
 Obtain information about a specific CPU.

 Arguments: 1. Logical ID of CPU to be queried
-           2. Information type:
+           2. Generic information type:
                   0 - CPU state
                1000 - Total number of VM exits
-               1001 - VM exits due to MMIO access
-               1002 - VM exits due to PIO access
-               1003 - VM exits due to IPI submissions
-               1004 - VM exits due to management events
-               1005 - VM exits due to hypercalls
+               1001 - VM exits due to MMIO accesses
+               1002 - VM exits due to management events
+               1003 - VM exits due to hypercalls
+
+               x86-specific type:
+
+               1004 - VM exits due to PIO accesses
+               1005 - VM exits due to xAPIC accesses
+               1006 - VM exits due to CR accesses
+               1007 - VM exits due to CPUID instructions
+               1008 - VM exits due to XSETBV instructions
+               1009 - VM exits due to exceptions
+               1010 - VM exits due to unspecified MSR accesses
+               1011 - VM exits due to x2APIC ICR MSR accesses
+
+               ARMv7/ARMv8-specific type:
+
+               1004 - VM exits due to IRQ injections
+               1005 - VM exits due to SGI injections
+               1006 - VM exits due to PSCI calls
+               1007 - VM exits due to SMCCC calls
+               1008 - VM exits due to CP15 accesses (only ARMv7)

 Statistic counters are reset when a CPU is assigned to a different cell. The
 total number of VM exits may be different from the sum of all specific VM exit
@@ -295,8 +333,9 @@ Communication region layout
     +------------------------------+
     |  Message from Cell (32 bit)  |
     +------------------------------+
-    |      Reserved (32 bit)       |
+    : Generic Platform Information :
     +------------------------------+
+    :     Architecture-specific    :
     :     Platform Information     :
     +------------------------------+ - higher address

@@ -305,7 +344,7 @@ Platform Information part is architecture-specific. Its content is filled by
 the hypervisor during cell creation and shall be considered read-only until
 cell destruction.

-The ABI revision described here is 0. Future versions may not use a compatible
+The ABI revision described here is 2. Future versions may not use a compatible
 layout or field semantic, except for the fields "Signature", "ABI Revision" and
 "Cell State".

@@ -385,22 +424,80 @@ to destroy or restart that cell. On restart, it will also reset the state field
 to "Running".


+Generic Platform Information
+- - - - - - - - - - - - - - -
+
+    +--------------------------------------+ - begin of communication region
+    :          header, see above           :   (lower address)
+    +--------------------------------------+
+    |      Information Flags (32 bit)      |
+    +--------------------------------------+
+    |       Console Address (64 bit)       |
+    +--------------------------------------+
+    |        Console Size (32 bit)         |
+    +--------------------------------------+
+    |        Console Type (16 bit)         |
+    +--------------------------------------+
+    |        Console Flags (16 bit)        |
+    +--------------------------------------+
+    |    Console UART Divider (32 bit)     |
+    +--------------------------------------+
+    |    Console UART Gate No. (32 bit)    |
+    +--------------------------------------+
+    | Console UART Clock Register (64 bit) |
+    +--------------------------------------+
+    |    PCI MMCONFIG Address (64 bit)     |
+    +--------------------------------------+
+    :         Architecture-specific        :
+    :         Platform Information         :
+    +--------------------------------------+ - higher address
+
+The Information Flags field defines two bits so far: Bit 0 is set when the cell
+may use the Debug Console putc hypercall. Bit 1 is set when the cell shall use
+the Debug Console putc hypercall as output console. Other bits in this field
+are reserved.
+
+See [3] for a description of the console fields.
+
+
 Platform Information for x86
 - - - - - - - - - - - - - - -

-    +----------------------------------+ - begin of communication region
-    :     generic part, see above      :   (lower address)
-    +----------------------------------+
-    |  PCI MMCONFIG Address (64 bit)   |
-    +----------------------------------+
-    |     PM Timer Address (16 bit)    |
-    +----------------------------------+
-    |     Number of CPUs (16 bit)      |
-    +----------------------------------+
-    |  TSC Frequency in kHz (32 bit)   |
-    +----------------------------------+
-    | APIC Timer Freq. in kHz (32 bit) |
-    +----------------------------------+ - higher address
+    +--------------------------------------+ - begin of communication region
+    :          header, see above           :   (lower address)
+    +--------------------------------------+
+    :    generic information, see above    :
+    +--------------------------------------+
+    |       PM Timer Address (16 bit)      |
+    +--------------------------------------+
+    |       Number of CPUs (16 bit)        |
+    +--------------------------------------+
+    |    TSC Frequency in kHz (32 bit)     |
+    +--------------------------------------+
+    | APIC Timer Frequency in kHz (32 bit) |
+    +--------------------------------------+ - higher address
+
+
+Platform Information for ARMv7 and ARMv8
+- - - - - - - - - - - - - - - - - - - - -
+
+    +--------------------------------------+ - begin of communication region
+    :          header, see above           :   (lower address)
+    +--------------------------------------+
+    :    generic information, see above    :
+    +--------------------------------------+
+    |         GIC Version (8 bit)          |
+    +--------------------------------------+
+    |          Reserved (56 bit)           |
+    +--------------------------------------+
+    |   GIC Distributor Address (64 bit)   |
+    +--------------------------------------+
+    |  GIC CPU Interface Address (64 bit)  |
+    +--------------------------------------+
+    |  GIC Redistributor Address (64 bit)  |
+    +--------------------------------------+
+    |  Virtual PCI Host IRQ Base (32 bit)  |
+    +--------------------------------------+ - higher address


 References
@@ -408,3 +505,4 @@ References

 [1] Documentation/cell-environments.txt
 [2] Documentation/configuration-format.txt
+[3] Documentation/debug-output.md
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5ea60323214f8cbd4c12c529acfe5223a289a10c.1580107046.git.jan.kiszka%40web.de.
