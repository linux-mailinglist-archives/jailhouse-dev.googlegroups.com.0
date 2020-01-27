Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBEGRXPYQKGQEKXE4GAY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id C766E14A545
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 14:41:36 +0100 (CET)
Received: by mail-ed1-x53b.google.com with SMTP id f25sf2527802eds.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 05:41:36 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580132496; cv=pass;
        d=google.com; s=arc-20160816;
        b=VQwcaShn3opgzYRD3AFHaGeFHUpfxiz6P1URg1oWtR4yqNjImiNBWR8z5l9G8BzdG9
         /nKp8u2DItTEFFGCfvXYIOfUcAWZ+2CX43VzU73IqYA5woV95opo1ZsseenmwQhnoK+s
         Xtd7yI8+qRxQ+GkEdten5psQqjHLOZsJS0UadzU++83Y8t6G6+A9gtDYZ807eWWsI4Dp
         SP7ONf2AFogIwAOvRbSr+j/I06o0ccdmgYslPe7yh+Uq/Zi5m8IndzDVDUSHFrG4g+zE
         tipgjl0tmNUNi+8XUFRcPYemJPndnfOgpl5NB6V1Vx1r2VE/HGPBbMcocEwiB3ZukQSD
         dBTw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:mime-version:sender
         :dkim-signature;
        bh=xePKBIroVP4b6+dUjjDFb5PFFxu4x2TH9Jl96BjPLyQ=;
        b=q01hMxIgZMhiEsGTHbom2r70PYnOb3ahfzEoOjetw6f03I9TjgxkYfhEpe+CuTC1VC
         hkdUrmpNtmMpu6VZhMDTy0VbT0LJdFgpAf3dF6LKHC8wEToXD8bnGuxUGe6gDmrL06Ii
         mLUafosOzYwIfH1UKXf8p+cvWMtkfWO5ySza+AbbEBkMMgsmyh2EAVNqlYfNgcLnWiU+
         qGzBwzpXfYklbr1/5cIccVP5Bf+pFs+arnYZDtEusFPORKpmZLAPgV6BlzSRp3KHIKc5
         0QRR+MvuIsIWH42LD9QyI5oCxZR4ky918sEmF9utQY25PkxTa5JzzQDJ2fYUSSUP5H50
         rMAQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=TdkwUPkz;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=xePKBIroVP4b6+dUjjDFb5PFFxu4x2TH9Jl96BjPLyQ=;
        b=kL6DFEGiPsm414NkVlP5NxjX6DgJIC9GPxj4Hc0xLwzj3A3YekFBPkZMHUvGt9O1v/
         +0CJWfCojtmNl1lw+HVsCYI4fgpBSJuxQ4ZVhsPdXWYuD5FbUov/jhaTxssSHY6UyuDb
         98/na2avsCWoh1zTNZo12gaV6FpU3xpdCTMN9r5V1p4teya637jgvASkllAke24BxQbh
         /7SN2uW4frd0XtYuKXrV8W9HPaTgly0k5MKg6sxHpbO7Jo/sr80utGm++ubdXA8RRy0U
         I/imeugbE4FocEtCU6HY/3QoThhLENqGvCeUVLpkrZCilrTnXJvp329Tg/Wwd/2YvGst
         fkIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=xePKBIroVP4b6+dUjjDFb5PFFxu4x2TH9Jl96BjPLyQ=;
        b=Fy0bQudKOGTMqu8Be45n3NNIOp8WOG+5i7YaxhOUpgkauSjHcsfIlu0x9zNJlVt95H
         mzzjzkkguGBw0JeJ2fD/ZsBf5VCOlc6eYqICGmprqj1/WnKQpBqy4vjaBM/mCQ1e7K0E
         AlQgihQ7NxzIQNea6R9K5uCcUnC2fJEi5xJL1Kn5dXJwkeDjwS0FV5xUckiwuTkcsF/n
         uBukRCj0p+So4YnFwiJa3suPSfxQxKcgrJp7oUdoKe3bZCezov6OI0snDCe4mGese5bo
         gddWTDHMnJJx5gB4cR62J5SXsyZLX0CISBh3e4RkEQdrsTwfa4tMBENGTTVo8CYQ5HAl
         RT6A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXruBlmBKemyiRzSAMK1+p9WotvnCM6UwOqKCXNgVPy9/50JBvz
	CNkQXJBpxcaAPbwMhf5YzpM=
X-Google-Smtp-Source: APXvYqzDDCXTqCS64XvGRm86Suenz5iaZE0WrW3uuaPTJpXsJym2U4/JfRfLxwj4g7BqjrQilBx3cg==
X-Received: by 2002:a17:906:3ce2:: with SMTP id d2mr13561110ejh.292.1580132496523;
        Mon, 27 Jan 2020 05:41:36 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:1b06:: with SMTP id by6ls2567547edb.1.gmail; Mon,
 27 Jan 2020 05:41:35 -0800 (PST)
X-Received: by 2002:aa7:d412:: with SMTP id z18mr13922144edq.6.1580132495797;
        Mon, 27 Jan 2020 05:41:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580132495; cv=none;
        d=google.com; s=arc-20160816;
        b=cdUNxeviMdXzM1P0SgIsxdlbbnplp1/hanY/6MJJYAx8N8KTHtTeXlXrc6inquAI37
         rlzTiZesZ1443o8ui12jtCt+joLwq/KXnANT6w3jXVsA0VtMmEKQx46TLND+u0ykCuDt
         z37jtnrJG05Ku9vzhF8/lXuWc3QLmSMe41XpC42goekyNaZ76W4JjeZUeRxgvQcxF1Iy
         0KbmXJ1C+IBfvp5Kj/zy9E7r5cZj6C3nQiGuSUCkaOFlq1Lc84FWO5WmxtWf/V2Tf9Eq
         TnkAUt74wLQlKIPCtnOZrnRg0HuKuV97dH8YG1ceAV/a7ZYIgWUsv3Uh+INZHB56AAI1
         eIrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=6e1EbN0m9GMm8I2mCKGZ7ZVF2mZSjgJev01ucpE/g50=;
        b=Ja97uD/Kw7NXKbQyOh9yUG/AkR7TwpfbnNG6G8ZI6O9nt3f7Lw6WitoRtFe8xiD7wT
         f54gsAwXtN8M7ewzXVj0kywQaH5Rt2vUeU6BmK6Hpol63IQa6uQtVY0drff6Yh8XQ8PF
         duMhmhGlTrDPXPx33KVpSUU3IFGFt6YOlXdaiSyG1rEQqW4PZON7W3gVxA2r3I4IubV3
         FoBIIhoIbQLQJilQCC+sRuen8nKE7HMEDduffN6N4hoCerFzsPFtQXLRunBUEKhWLFAy
         yCSdxBtiLlhWrURINz8nA7uz32Qqc/kiIvD2LH8JtjjxhZgS3GhzaXT8v7DKivSVH4jY
         09Zg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=TdkwUPkz;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id n21si804991eja.0.2020.01.27.05.41.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2020 05:41:35 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([95.157.55.156]) by smtp.web.de
 (mrweb101 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0MeBPe-1jEAYj12xK-00PxwM; Mon, 27 Jan 2020 14:41:35 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v2 4/4] Documentation: Update hypervisor interfaces specification
Date: Mon, 27 Jan 2020 14:41:27 +0100
Message-Id: <a66f29e51f7162f352ab1464fcac2f212aa92201.1580132487.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1580132487.git.jan.kiszka@web.de>
References: <cover.1580132487.git.jan.kiszka@web.de>
In-Reply-To: <cover.1580132487.git.jan.kiszka@web.de>
References: <cover.1580132487.git.jan.kiszka@web.de>
X-Provags-ID: V03:K1:OLQ15i9isIt4kKoW8W1YMO/ggwzIKp07nj9dZ700juPVGNRV47W
 yJS2pqrRdotzZbIio7iVznA8MdZcpy6wOUr/B/2BevSuVYn9+Hq8ZS5zX4M3JSeEbdcEPzP
 ILwzS0bsqa8zlvibZXJ5huDEz69Uimu5dNORKZStcboxqTXl2kYB37wXWbyVcc7eW3ZL7Op
 d2Hx3DMIeWzwIfK0yxCNw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:TN0tZn6yn6k=:zieDqKatTUiY+BMPXAN3wN
 E+x8EqQTJAtRdqGZcUwmXz5F5i5dJ196Di8WrpVgI5Cf6paf7Dk7TRl4I9JGUzprzRf+yDZAz
 vqR+ny/msGBem2QV98GblT7oKxJyOgie7b2Cl+LlR0J/+zaHRodVXKysmESZVvJq/CX3cJNP3
 cJAV7g4+moNiNiy9txjMIGE1XZuUHQxAgeGQr/xgJKRy3b2U+9sNV5SiPPqBzpI72XHvadTC9
 /OrTH4BDMxXgpt44hf7LdMqxnv+PB5StcBjkG+KqvqZXgvVLnC+bGZCLn/jjWwvO8Q/vmZzX5
 bPp+d9wSwfOUZsPQKzlgQC9G49jRc3mSUR+e3gkHwc7zZMUs3+YyfL+6pb8Q7rWh+4jr4DQQd
 BIdRFeCrFPuTEc/0vZXK9o0S8AkoDyYG54o7c5aWXwgCYv/AX2IXGIjSvl+vYv4axb6FzyfvP
 vFmU3h/4RY2Y33DGCqatBZBk6JVnaZ+wUoqEDCGfLiqPy7LSiL6XhYr7/hZTRt8+AlylE5g5P
 QUg6U4VTNRKFw7DjaPw7quQmC4ZsA3FzxmYudEbDsnhKqhzVBDtJKhHQ2gZSpkjYWFEQWPUib
 Ulr7cylzyXWGR/0tVxJMhL0dlNVyiaGgCVHXR/Ozeffk8p+C16cIZZPuQ8v5GZDBYARNglbrf
 kUt+hnkgmf9+4zDkrA1NMYLD/+snlYmvok7QSPnm2sKkARRecpBfqWp3bfY6bKPYJy7e2MH0E
 ndiTRbvgTCHOTP5ugCRXKAxCZc1t19XjZyAAuiprY1GST7YZ5MIJiG7QSbfgMvbn42HWOMmAl
 a0kjMvZ3iBUNJlfbaiZ0zrlp4DJO0hIxIp5nxmsDJ7pVaHYYNSY/aucEbycb65kgkHrG3LZnL
 V+g2PCpahbZ5l1yTiBNxtY+kNfcyyV2vi+AgN6bFaB4UQ5gUSnnaJLeNswGoOzGkZMkU3S4Fw
 jWScia1EJU1FagC3wEr6JTFaqOrw/c3deXCWthat1iw12VJMTNBh8Ehp/4hObZfQgzPI2oQPi
 u3GTjI/JYlMKngU04LG7OkcL8gpUYflzmk5v0V/+TLPxyJcnVdHt8HcCFXwRlUIH6ziwNLMjV
 I3V3pwuXZvr4/HEICuxWpW2efL/oQDhrPNwGV9Nx6hTIlag1iGEdsKbZ+69qQcRPdXd8s2bmd
 Aqg6IFeyBC+iaUGqaWbLDGBeKDxwKt+YD/ivd2fPF8debwxoQXCf73OlU4+mRnMq8whBgLF5h
 +eYjBEheWDc78sRU+
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=TdkwUPkz;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as
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
Reviewed-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 Documentation/hypervisor-interfaces.txt | 153 ++++++++++++++++++++++++++------
 1 file changed, 126 insertions(+), 27 deletions(-)

diff --git a/Documentation/hypervisor-interfaces.txt b/Documentation/hypervisor-interfaces.txt
index f29bac43..d888dab7 100644
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

@@ -230,14 +251,32 @@ Hypercall "CPU Get Info" (code 7)
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
+               1004 - VM exits due to maintenance IRQs
+               1005 - VM exits due to IRQ injections
+               1006 - VM exits due to SGI injections
+               1007 - VM exits due to PSCI calls
+               1008 - VM exits due to SMCCC calls
+               1009 - VM exits due to CP15 accesses (only ARMv7)

 Statistic counters are reset when a CPU is assigned to a different cell. The
 total number of VM exits may be different from the sum of all specific VM exit
@@ -295,8 +334,9 @@ Communication region layout
     +------------------------------+
     |  Message from Cell (32 bit)  |
     +------------------------------+
-    |      Reserved (32 bit)       |
+    : Generic Platform Information :
     +------------------------------+
+    :     Architecture-specific    :
     :     Platform Information     :
     +------------------------------+ - higher address

@@ -305,7 +345,7 @@ Platform Information part is architecture-specific. Its content is filled by
 the hypervisor during cell creation and shall be considered read-only until
 cell destruction.

-The ABI revision described here is 0. Future versions may not use a compatible
+The ABI revision described here is 2. Future versions may not use a compatible
 layout or field semantic, except for the fields "Signature", "ABI Revision" and
 "Cell State".

@@ -385,22 +425,80 @@ to destroy or restart that cell. On restart, it will also reset the state field
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
@@ -408,3 +506,4 @@ References

 [1] Documentation/cell-environments.txt
 [2] Documentation/configuration-format.txt
+[3] Documentation/debug-output.md
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a66f29e51f7162f352ab1464fcac2f212aa92201.1580132487.git.jan.kiszka%40web.de.
