Return-Path: <jailhouse-dev+bncBDWK5VGE4EPBBBHJRWCQMGQEFRYO3IY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x63a.google.com (mail-pl1-x63a.google.com [IPv6:2607:f8b0:4864:20::63a])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A673873B5
	for <lists+jailhouse-dev@lfdr.de>; Tue, 18 May 2021 10:02:19 +0200 (CEST)
Received: by mail-pl1-x63a.google.com with SMTP id l9-20020a1709030049b02900f184d9d878sf2697200pla.16
        for <lists+jailhouse-dev@lfdr.de>; Tue, 18 May 2021 01:02:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621324933; cv=pass;
        d=google.com; s=arc-20160816;
        b=rfiFESIVz8oI0Evs5ljLIUliZi9FkemvpoPcROazaZo83/FRWYWkcTCIsMTZ0LCILO
         Z+BOndnP1N9xgoXrY+qVgRv/iwrojI4Pw97zhdpu7YJOldytjXTH9YntEc4wUqmDZszp
         wP5MafaGS+ZwhJwN6BVS9RXDWmgl+0Gq/XvQ+5J1qn2RYyUIvX5pK5MfSldBtIXzTKY4
         cZQqsOyJRZmf6g5SWfIXTPxyvr8ZoQt0N41YDch8sVMQS6SRhMvhTa3AUi13U3ongLQM
         +qjDhEN+lJwb0Xm+zksyow0s7USyoscK4NEWKZtkprhc2XfKTsFSDlbq+y752edjx5Zd
         0uYw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=UuucOcXijdbtNrp/T5SvYk0XdhQGcltiAZ4mPwOT43U=;
        b=N1xW2gyZKXmUsnSlADPMDtw8DJaf9YyhKXvDy+Fu+XD2pK0Rjry5lMNSwQYjtvY7+b
         29b5PzDkbN7YLrvmoekh/ZBaTtaT0Ybcj3G2TkZScBEJCyzlre7qwnclBzZya9ypgipr
         R2Ka7IFU50AuaJA7SMjkKwwWeqh22hIaXi4yQUqO14kQzeoMokXqtrozHp0M9sgHx/IQ
         0qVJtnYV/8HVT8ry5VoNb06+1W5CD+AocMwrYL8tcn6+Y4QjmtO3FqRt3/6vqrX3vC53
         93usFCLSLP4wPy3TZcnbT2wCxUrD4AV+fVcy2dYKCZR+uMHZ6ODvp+55fwe1ET4QQ8e8
         vhdg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=VJEfREgZ;
       spf=pass (google.com: domain of prashantkalikotay1995@gmail.com designates 2607:f8b0:4864:20::229 as permitted sender) smtp.mailfrom=prashantkalikotay1995@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UuucOcXijdbtNrp/T5SvYk0XdhQGcltiAZ4mPwOT43U=;
        b=DcUTNvzpaWClIZHWIHqGJZlhpXowSDbXSr1iEZf9T9MCU0X+YYgg7HFtej9dTGfwxf
         gQFI/Xo05RidHvHviAki+9nbeYADCs+KdlyPrhenXCLGxifzmQdosXLG8xuL+0iJBjUa
         gC7og6EW7onpvi/zg6viAcKbxiBsOYEEFeFrTo5mRo5LK2keQhdHavPQBBBtil7ryEi/
         6Pn7JBXEv1Ci1oBjkq5E1APumbnMNZ5wX0bOGz425qbXnGY0hj1yjZD26C+eOHSqIUvW
         +Y5ZD3OtFOTAu6XJNGIZsudoQxcz32nfNe9vxW9eWTJVgzc65cGhhsu9f9PdlsM9VW0f
         Nejg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=UuucOcXijdbtNrp/T5SvYk0XdhQGcltiAZ4mPwOT43U=;
        b=MFVfTQ3VNJiI17CogUQgfdLJUtxcQPlCXxXZqCxo3oeiqlZYpQh1dZeh/3vSYs2oQh
         JOpXT+uTyo49DQ87woCG/LITGjOb+BXJ+Eg5WQQOAvXS3OyKv3DkXr8phBty4meq6QCU
         YIOti15KN0Vx9Yarl5wUp+i/8n+9zGBaLM76lYGBuD1HQw+J6mBcyMUAgHXQg3Y5RnuU
         c6Nr+sz5vCN631VGblC6JE9V+U4t4bcazPxerKYAjMF1vaOFWaIHILYfc5n7mWMGxaJO
         D7yae3ReqMjRxLFMXQP65BwVouw6McBoVq9EdR6Ubt9gCG8ThOi6lwTzsTibAr9Y9M0K
         33gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=UuucOcXijdbtNrp/T5SvYk0XdhQGcltiAZ4mPwOT43U=;
        b=MpQ4xe5Xt4M7Tn+0K6SSBDpuYocsOAZOHp9NeJ/4eUHxyA4vZoMoThnvjKgkOPZYzt
         iLYfDbqmmW+OvAj5lZLI1Y75R3QdB3IX1biGyczYY/r5eegmTNuDC1ka5d82NU/tmM5/
         x867sbuKBovuDXvcJhsMQtc1VT7Df1PIGV55fqAIoR91CEAMHLkUyQooVmQRBOo4H0OV
         593x0NYJMRDmGO4X8uO32xr9GBpmXi8WtxGKQU7DaN0Cqo9muY2Tz75S8ooVJMN6e5Mx
         MalJSvkUUW6MiCC3awJ7UJ0v9VQKN+ZPF6cS9mTVtj6B0EuXII8TU1JYiaUtbnSS7yQb
         6hKg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533MIzz8Dq+Uyu3TJtwSMis5K/Mr7yZzD+Axf7BxxLnWd69Kr7+5
	nxi7iQOJlKFe2CJF431jCYE=
X-Google-Smtp-Source: ABdhPJyfxgFXiveXrzTXgBkosCCscHFbL3gd6qtXWNJH8MXw0/TmuG1H7H+XgC9nQZAfpXReQTL7cA==
X-Received: by 2002:a63:521a:: with SMTP id g26mr950404pgb.279.1621324933132;
        Tue, 18 May 2021 01:02:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a65:6183:: with SMTP id c3ls8885933pgv.6.gmail; Tue, 18 May
 2021 01:02:12 -0700 (PDT)
X-Received: by 2002:a62:7885:0:b029:2d5:941e:f574 with SMTP id t127-20020a6278850000b02902d5941ef574mr3825554pfc.80.1621324932543;
        Tue, 18 May 2021 01:02:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621324932; cv=none;
        d=google.com; s=arc-20160816;
        b=pbEZZixX4kDJP4654LOCHBP7AnWG7oLo6xZDUtwnks+vrjArlnvfPGTVONduupJobY
         5fklGukqq/VxJBpqA4Z4zBvZei69atCntfH/ID5EB+yugfEXdh60AdW9AgBN76BGeVop
         QhD5vpaxruzMK12cmZ3s6wC6W+bVokLTQDnB0xEqgMWIwIF4mLBWkQLW9OjFnI7erlKy
         R5j5r83typyYbl17WBi+fPmt33MXUHjUvgav/620WAaCooDMOZBlEqzV24KGKX4NPbe9
         8yIEMRC4hS+y0CBl4g7FyjylE3Vu11ir8KVUvvr8gaAvQpFXx5vQyDrnnwLH0NiSAmbo
         GgxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=cJwzNvVpfJnJM7kcda3oRNPMS+e1tI2dX/cEPqD9VyI=;
        b=t9dV48VRyKKAZZb3Lq0eYEKwfKsPcZSXaPItFXKJL2yMPPDzQmfFy854jfcCMcSPDS
         ENFgoYS8ijfAV0EZviq7PU8PIxGoBUmv5ZOxIXMYQ3OkFsklY/3KxTWvDJ198gIMgs4F
         0rqQoY5hWKr2a/c9gU+fMKjemp+T1GHQGdFvi4heKYXqIuLUj7vZhdLXk28x1OIDN57E
         QTjfUAen71JEO/HZVjAcdWCP8BepeugGGnWasiXbUV4uqfJsujhkbQqz1/Dk4ouPl/nT
         mMgv0EKXLr8l3COTLP9bb4U8cYnXoY0cPVcGEmXqUxcnSW53O6agvGbTxK650PM1RsIO
         fQRg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=VJEfREgZ;
       spf=pass (google.com: domain of prashantkalikotay1995@gmail.com designates 2607:f8b0:4864:20::229 as permitted sender) smtp.mailfrom=prashantkalikotay1995@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com. [2607:f8b0:4864:20::229])
        by gmr-mx.google.com with ESMTPS id n22si552765pfu.0.2021.05.18.01.02.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 May 2021 01:02:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of prashantkalikotay1995@gmail.com designates 2607:f8b0:4864:20::229 as permitted sender) client-ip=2607:f8b0:4864:20::229;
Received: by mail-oi1-x229.google.com with SMTP id u11so9007096oiv.1
        for <jailhouse-dev@googlegroups.com>; Tue, 18 May 2021 01:02:12 -0700 (PDT)
X-Received: by 2002:aca:4887:: with SMTP id v129mr2874096oia.137.1621324931722;
 Tue, 18 May 2021 01:02:11 -0700 (PDT)
MIME-Version: 1.0
From: Prashant Kalikotay <prashantkalikotay1995@gmail.com>
Date: Tue, 18 May 2021 13:32:00 +0530
Message-ID: <CAEoyBwCDWM=+iUXzXtECTpugFprTkMSj-P+goS0R8yOizZTYdg@mail.gmail.com>
Subject: Installation error in Fedora
To: jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="0000000000009eeffa05c29620f0"
X-Original-Sender: prashantkalikotay1995@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=VJEfREgZ;       spf=pass
 (google.com: domain of prashantkalikotay1995@gmail.com designates
 2607:f8b0:4864:20::229 as permitted sender) smtp.mailfrom=prashantkalikotay1995@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--0000000000009eeffa05c29620f0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello All,
              I am trying to install Jailhouse in Fedora, X86 system. While
running make I run into these errors:
[prashant@fedora jailhouse]$ make
  CC [M]  /home/prashant/jailhouse/driver/cell.o
  CC [M]  /home/prashant/jailhouse/driver/main.o
  CC [M]  /home/prashant/jailhouse/driver/sysfs.o
  CC [M]  /home/prashant/jailhouse/driver/pci.o
  LD [M]  /home/prashant/jailhouse/driver/jailhouse.o
  CC      /home/prashant/jailhouse/configs/x86/apic-demo.o
  OBJCOPY /home/prashant/jailhouse/configs/x86/apic-demo.cell
  CC      /home/prashant/jailhouse/configs/x86/e1000-demo.o
  OBJCOPY /home/prashant/jailhouse/configs/x86/e1000-demo.cell
  CC      /home/prashant/jailhouse/configs/x86/f2a88xm-hd3.o
  OBJCOPY /home/prashant/jailhouse/configs/x86/f2a88xm-hd3.cell
  CC      /home/prashant/jailhouse/configs/x86/imb-a180.o
  OBJCOPY /home/prashant/jailhouse/configs/x86/imb-a180.cell
  CC      /home/prashant/jailhouse/configs/x86/ioapic-demo.o
  OBJCOPY /home/prashant/jailhouse/configs/x86/ioapic-demo.cell
  CC      /home/prashant/jailhouse/configs/x86/ivshmem-demo.o
  OBJCOPY /home/prashant/jailhouse/configs/x86/ivshmem-demo.cell
  CC      /home/prashant/jailhouse/configs/x86/linux-x86-demo.o
  OBJCOPY /home/prashant/jailhouse/configs/x86/linux-x86-demo.cell
  CC      /home/prashant/jailhouse/configs/x86/pci-demo.o
  OBJCOPY /home/prashant/jailhouse/configs/x86/pci-demo.cell
  CC      /home/prashant/jailhouse/configs/x86/qemu-x86.o
  OBJCOPY /home/prashant/jailhouse/configs/x86/qemu-x86.cell
  CC      /home/prashant/jailhouse/configs/x86/smp-demo.o
  OBJCOPY /home/prashant/jailhouse/configs/x86/smp-demo.cell
  CC      /home/prashant/jailhouse/configs/x86/tiny-demo.o
  OBJCOPY /home/prashant/jailhouse/configs/x86/tiny-demo.cell
  CC      /home/prashant/jailhouse/hypervisor/arch/x86/asm-defines.s
  GEN
/home/prashant/jailhouse/hypervisor/arch/x86/include/generated/asm/asm-defi=
nes.h
  CC      /home/prashant/jailhouse/hypervisor/arch/x86/svm.o
  CC      /home/prashant/jailhouse/hypervisor/arch/x86/amd_iommu.o
  AS      /home/prashant/jailhouse/hypervisor/arch/x86/svm-vmexit.o
  CC      /home/prashant/jailhouse/hypervisor/arch/x86/apic.o
  CC      /home/prashant/jailhouse/hypervisor/arch/x86/dbg-write.o
  AS      /home/prashant/jailhouse/hypervisor/arch/x86/entry.o
  CC      /home/prashant/jailhouse/hypervisor/arch/x86/setup.o
  CC      /home/prashant/jailhouse/hypervisor/arch/x86/control.o
  CC      /home/prashant/jailhouse/hypervisor/arch/x86/mmio.o
  CC      /home/prashant/jailhouse/hypervisor/arch/x86/iommu.o
  CC      /home/prashant/jailhouse/hypervisor/arch/x86/paging.o
  CC      /home/prashant/jailhouse/hypervisor/arch/x86/pci.o
  CC      /home/prashant/jailhouse/hypervisor/arch/x86/i8042.o
  CC      /home/prashant/jailhouse/hypervisor/arch/x86/vcpu.o
/home/prashant/jailhouse/hypervisor/arch/x86/vcpu.c: In function
=E2=80=98vcpu_reset=E2=80=99:
/home/prashant/jailhouse/hypervisor/arch/x86/vcpu.c:429:9: warning:
=E2=80=98memset=E2=80=99 offset [0, 127] is out of the bounds [0, 0] [-Warr=
ay-bounds]
  429 |         memset(&cpu_data->guest_regs, 0,
sizeof(cpu_data->guest_regs));
      |
^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  CC      /home/prashant/jailhouse/hypervisor/arch/x86/efifb.o
  CC      /home/prashant/jailhouse/hypervisor/arch/x86/ivshmem.o
  CC      /home/prashant/jailhouse/hypervisor/arch/x86/ioapic.o
  AR      /home/prashant/jailhouse/hypervisor/arch/x86/lib-amd.a
  CC      /home/prashant/jailhouse/hypervisor/arch/x86/vmx.o
  CC      /home/prashant/jailhouse/hypervisor/arch/x86/vtd.o
  AS      /home/prashant/jailhouse/hypervisor/arch/x86/vmx-vmexit.o
  CC      /home/prashant/jailhouse/hypervisor/arch/x86/cat.o
  AR      /home/prashant/jailhouse/hypervisor/arch/x86/lib-intel.a
  LDS     /home/prashant/jailhouse/hypervisor/hypervisor.lds
  CC      /home/prashant/jailhouse/hypervisor/setup.o
  CC      /home/prashant/jailhouse/hypervisor/printk.o
  CC      /home/prashant/jailhouse/hypervisor/paging.o
  CC      /home/prashant/jailhouse/hypervisor/control.o
  CC      /home/prashant/jailhouse/hypervisor/lib.o
  CC      /home/prashant/jailhouse/hypervisor/mmio.o
  CC      /home/prashant/jailhouse/hypervisor/pci.o
  CC      /home/prashant/jailhouse/hypervisor/ivshmem.o
  CC      /home/prashant/jailhouse/hypervisor/uart.o
  CC      /home/prashant/jailhouse/hypervisor/uart-8250.o
  LD      /home/prashant/jailhouse/hypervisor/hypervisor-amd.o
  OBJCOPY /home/prashant/jailhouse/hypervisor/jailhouse-amd.bin
  LD      /home/prashant/jailhouse/hypervisor/hypervisor-intel.o
  OBJCOPY /home/prashant/jailhouse/hypervisor/jailhouse-intel.bin
  CC      /home/prashant/jailhouse/inmates/lib/x86/../alloc.o
  CC      /home/prashant/jailhouse/inmates/lib/x86/../cmdline.o
  CC      /home/prashant/jailhouse/inmates/lib/x86/../pci.o
  CC      /home/prashant/jailhouse/inmates/lib/x86/../printk.o
  CC      /home/prashant/jailhouse/inmates/lib/x86/../setup.o
  CC      /home/prashant/jailhouse/inmates/lib/x86/../string.o
  CC      /home/prashant/jailhouse/inmates/lib/x86/../test.o
  CC      /home/prashant/jailhouse/inmates/lib/x86/../uart-8250.o
  CC      /home/prashant/jailhouse/inmates/lib/x86/cpu-features.o
  CC      /home/prashant/jailhouse/inmates/lib/x86/excp.o
  AS      /home/prashant/jailhouse/inmates/lib/x86/header-64.o
  AS      /home/prashant/jailhouse/inmates/lib/x86/header-common.o
  CC      /home/prashant/jailhouse/inmates/lib/x86/ioapic.o
  CC      /home/prashant/jailhouse/inmates/lib/x86/irq.o
  CC      /home/prashant/jailhouse/inmates/lib/x86/mem.o
  CC      /home/prashant/jailhouse/inmates/lib/x86/pci.o
  CC      /home/prashant/jailhouse/inmates/lib/x86/printk.o
  CC      /home/prashant/jailhouse/inmates/lib/x86/setup.o
  CC      /home/prashant/jailhouse/inmates/lib/x86/smp.o
  CC      /home/prashant/jailhouse/inmates/lib/x86/timing.o
  CC      /home/prashant/jailhouse/inmates/lib/x86/uart.o
  AR      /home/prashant/jailhouse/inmates/lib/x86/lib.a
  CC      /home/prashant/jailhouse/inmates/lib/x86/cpu-features-32.o
  CC      /home/prashant/jailhouse/inmates/lib/x86/excp-32.o
  AS      /home/prashant/jailhouse/inmates/lib/x86/header-common-32.o
  CC      /home/prashant/jailhouse/inmates/lib/x86/irq-32.o
  CC      /home/prashant/jailhouse/inmates/lib/x86/ioapic-32.o
  CC      /home/prashant/jailhouse/inmates/lib/x86/printk-32.o
  CC      /home/prashant/jailhouse/inmates/lib/x86/setup-32.o
  CC      /home/prashant/jailhouse/inmates/lib/x86/uart-32.o
  CC      /home/prashant/jailhouse/inmates/lib/x86/../alloc-32.o
  CC      /home/prashant/jailhouse/inmates/lib/x86/../pci-32.o
  CC      /home/prashant/jailhouse/inmates/lib/x86/../string-32.o
  CC      /home/prashant/jailhouse/inmates/lib/x86/../cmdline-32.o
  CC      /home/prashant/jailhouse/inmates/lib/x86/../setup-32.o
  CC      /home/prashant/jailhouse/inmates/lib/x86/../test-32.o
  CC      /home/prashant/jailhouse/inmates/lib/x86/../uart-8250-32.o
  CC      /home/prashant/jailhouse/inmates/lib/x86/../printk-32.o
  AS      /home/prashant/jailhouse/inmates/lib/x86/header-32.o
  AR      /home/prashant/jailhouse/inmates/lib/x86/lib32.a
  CC      /home/prashant/jailhouse/inmates/demos/x86/tiny-demo.o
  LD      /home/prashant/jailhouse/inmates/demos/x86/tiny-demo-linked.o
  OBJCOPY /home/prashant/jailhouse/inmates/demos/x86/tiny-demo.bin
  CC      /home/prashant/jailhouse/inmates/demos/x86/apic-demo.o
  LD      /home/prashant/jailhouse/inmates/demos/x86/apic-demo-linked.o
  OBJCOPY /home/prashant/jailhouse/inmates/demos/x86/apic-demo.bin
  CC      /home/prashant/jailhouse/inmates/demos/x86/ioapic-demo.o
  LD      /home/prashant/jailhouse/inmates/demos/x86/ioapic-demo-linked.o
  OBJCOPY /home/prashant/jailhouse/inmates/demos/x86/ioapic-demo.bin
  CC      /home/prashant/jailhouse/inmates/demos/x86/32-bit-demo.o
  LD      /home/prashant/jailhouse/inmates/demos/x86/32-bit-demo-linked.o
  OBJCOPY /home/prashant/jailhouse/inmates/demos/x86/32-bit-demo.bin
  CC      /home/prashant/jailhouse/inmates/demos/x86/pci-demo.o
  LD      /home/prashant/jailhouse/inmates/demos/x86/pci-demo-linked.o
  OBJCOPY /home/prashant/jailhouse/inmates/demos/x86/pci-demo.bin
  CC      /home/prashant/jailhouse/inmates/demos/x86/e1000-demo.o
  LD      /home/prashant/jailhouse/inmates/demos/x86/e1000-demo-linked.o
  OBJCOPY /home/prashant/jailhouse/inmates/demos/x86/e1000-demo.bin
  CC      /home/prashant/jailhouse/inmates/demos/x86/../ivshmem-demo.o
  LD      /home/prashant/jailhouse/inmates/demos/x86/ivshmem-demo-linked.o
  OBJCOPY /home/prashant/jailhouse/inmates/demos/x86/ivshmem-demo.bin
  CC      /home/prashant/jailhouse/inmates/demos/x86/smp-demo.o
  LD      /home/prashant/jailhouse/inmates/demos/x86/smp-demo-linked.o
  OBJCOPY /home/prashant/jailhouse/inmates/demos/x86/smp-demo.bin
  CC      /home/prashant/jailhouse/inmates/demos/x86/cache-timings.o
  LD      /home/prashant/jailhouse/inmates/demos/x86/cache-timings-linked.o
  OBJCOPY /home/prashant/jailhouse/inmates/demos/x86/cache-timings.bin
  CC      /home/prashant/jailhouse/inmates/tests/x86/mmio-access.o
  LD      /home/prashant/jailhouse/inmates/tests/x86/mmio-access-linked.o
  OBJCOPY /home/prashant/jailhouse/inmates/tests/x86/mmio-access.bin
  CC      /home/prashant/jailhouse/inmates/tests/x86/mmio-access-32.o
  LD      /home/prashant/jailhouse/inmates/tests/x86/mmio-access-32-linked.=
o
  OBJCOPY /home/prashant/jailhouse/inmates/tests/x86/mmio-access-32.bin
  CC      /home/prashant/jailhouse/inmates/tests/x86/sse-demo.o
  LD      /home/prashant/jailhouse/inmates/tests/x86/sse-demo-linked.o
  OBJCOPY /home/prashant/jailhouse/inmates/tests/x86/sse-demo.bin
  CC      /home/prashant/jailhouse/inmates/tests/x86/sse-demo-32.o
  LD      /home/prashant/jailhouse/inmates/tests/x86/sse-demo-32-linked.o
  OBJCOPY /home/prashant/jailhouse/inmates/tests/x86/sse-demo-32.bin
  CC      /home/prashant/jailhouse/inmates/tools/x86/linux-loader.o
  LD      /home/prashant/jailhouse/inmates/tools/x86/linux-loader-linked.o
  OBJCOPY /home/prashant/jailhouse/inmates/tools/x86/linux-loader.bin
  GEN     /home/prashant/jailhouse/pyjailhouse/pci_defs.py
  CC      /home/prashant/jailhouse/tools/jailhouse.o
  LD      /home/prashant/jailhouse/tools/jailhouse
  CC      /home/prashant/jailhouse/tools/demos/ivshmem-demo.o
  LD      /home/prashant/jailhouse/tools/demos/ivshmem-demo
  CC      /home/prashant/jailhouse/tools/demos/cache-timings.o
  LD      /home/prashant/jailhouse/tools/demos/cache-timings
  GEN     /home/prashant/jailhouse/tools/jailhouse-config-collect
  CC      /home/prashant/jailhouse/tools/jailhouse-gcov-extract.o
  LD      /home/prashant/jailhouse/tools/jailhouse-gcov-extract
  GEN     /home/prashant/jailhouse/tools/jailhouse.8
  GEN     /home/prashant/jailhouse/tools/jailhouse-cell.8
  GEN     /home/prashant/jailhouse/tools/jailhouse-enable.8
  MODPOST /home/prashant/jailhouse/Module.symvers
ERROR: modpost: "lapic_timer_period"
[/home/prashant/jailhouse/driver/jailhouse.ko] undefined!
ERROR: modpost: "__get_vm_area_caller"
[/home/prashant/jailhouse/driver/jailhouse.ko] undefined!
ERROR: modpost: "ioremap_page_range"
[/home/prashant/jailhouse/driver/jailhouse.ko] undefined!
make[2]: *** [scripts/Makefile.modpost:111:
/home/prashant/jailhouse/Module.symvers] Error 1
make[2]: *** Deleting file '/home/prashant/jailhouse/Module.symvers'
make[1]: *** [Makefile:1714: modules] Error 2
make: *** [Makefile:40: modules] Error 2
[prashant@fedora jailhouse]$

I could see the issue is with the kernel. Could I get necessary steps to
fix this? How to apply patches if I have? Pointing to any resource also
might be very helpful.
Thank you

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CAEoyBwCDWM%3D%2BiUXzXtECTpugFprTkMSj-P%2BgoS0R8yOizZTYdg%40m=
ail.gmail.com.

--0000000000009eeffa05c29620f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello All,</div><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I am trying to install Jai=
lhouse in Fedora, X86 system. While running make I run into these errors:</=
div><div>[prashant@fedora jailhouse]$ make<br>=C2=A0 CC [M] =C2=A0/home/pra=
shant/jailhouse/driver/cell.o<br>=C2=A0 CC [M] =C2=A0/home/prashant/jailhou=
se/driver/main.o<br>=C2=A0 CC [M] =C2=A0/home/prashant/jailhouse/driver/sys=
fs.o<br>=C2=A0 CC [M] =C2=A0/home/prashant/jailhouse/driver/pci.o<br>=C2=A0=
 LD [M] =C2=A0/home/prashant/jailhouse/driver/jailhouse.o<br>=C2=A0 CC =C2=
=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/configs/x86/apic-demo.o<br>=C2=A0=
 OBJCOPY /home/prashant/jailhouse/configs/x86/apic-demo.cell<br>=C2=A0 CC =
=C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/configs/x86/e1000-demo.o<br>=
=C2=A0 OBJCOPY /home/prashant/jailhouse/configs/x86/e1000-demo.cell<br>=C2=
=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/configs/x86/f2a88xm-hd3=
.o<br>=C2=A0 OBJCOPY /home/prashant/jailhouse/configs/x86/f2a88xm-hd3.cell<=
br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/configs/x86/imb-a=
180.o<br>=C2=A0 OBJCOPY /home/prashant/jailhouse/configs/x86/imb-a180.cell<=
br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/configs/x86/ioapi=
c-demo.o<br>=C2=A0 OBJCOPY /home/prashant/jailhouse/configs/x86/ioapic-demo=
.cell<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/configs/x86=
/ivshmem-demo.o<br>=C2=A0 OBJCOPY /home/prashant/jailhouse/configs/x86/ivsh=
mem-demo.cell<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/con=
figs/x86/linux-x86-demo.o<br>=C2=A0 OBJCOPY /home/prashant/jailhouse/config=
s/x86/linux-x86-demo.cell<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/j=
ailhouse/configs/x86/pci-demo.o<br>=C2=A0 OBJCOPY /home/prashant/jailhouse/=
configs/x86/pci-demo.cell<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/j=
ailhouse/configs/x86/qemu-x86.o<br>=C2=A0 OBJCOPY /home/prashant/jailhouse/=
configs/x86/qemu-x86.cell<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/j=
ailhouse/configs/x86/smp-demo.o<br>=C2=A0 OBJCOPY /home/prashant/jailhouse/=
configs/x86/smp-demo.cell<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/j=
ailhouse/configs/x86/tiny-demo.o<br>=C2=A0 OBJCOPY /home/prashant/jailhouse=
/configs/x86/tiny-demo.cell<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant=
/jailhouse/hypervisor/arch/x86/asm-defines.s<br>=C2=A0 GEN =C2=A0 =C2=A0 /h=
ome/prashant/jailhouse/hypervisor/arch/x86/include/generated/asm/asm-define=
s.h<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/hypervisor/ar=
ch/x86/svm.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/hype=
rvisor/arch/x86/amd_iommu.o<br>=C2=A0 AS =C2=A0 =C2=A0 =C2=A0/home/prashant=
/jailhouse/hypervisor/arch/x86/svm-vmexit.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=
=A0/home/prashant/jailhouse/hypervisor/arch/x86/apic.o<br>=C2=A0 CC =C2=A0 =
=C2=A0 =C2=A0/home/prashant/jailhouse/hypervisor/arch/x86/dbg-write.o<br>=
=C2=A0 AS =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/hypervisor/arch/x86/=
entry.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/hyperviso=
r/arch/x86/setup.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhous=
e/hypervisor/arch/x86/control.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/pras=
hant/jailhouse/hypervisor/arch/x86/mmio.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0=
/home/prashant/jailhouse/hypervisor/arch/x86/iommu.o<br>=C2=A0 CC =C2=A0 =
=C2=A0 =C2=A0/home/prashant/jailhouse/hypervisor/arch/x86/paging.o<br>=C2=
=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/hypervisor/arch/x86/pci=
.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/hypervisor/arc=
h/x86/i8042.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/hyp=
ervisor/arch/x86/vcpu.o<br>/home/prashant/jailhouse/hypervisor/arch/x86/vcp=
u.c: In function =E2=80=98vcpu_reset=E2=80=99:<br>/home/prashant/jailhouse/=
hypervisor/arch/x86/vcpu.c:429:9: warning: =E2=80=98memset=E2=80=99 offset =
[0, 127] is out of the bounds [0, 0] [-Warray-bounds]<br>=C2=A0 429 | =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 memset(&amp;cpu_data-&gt;guest_regs, 0, sizeof(cpu=
_data-&gt;guest_regs));<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>=C2=
=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/hypervisor/arch/x86/efi=
fb.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/hypervisor/a=
rch/x86/ivshmem.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse=
/hypervisor/arch/x86/ioapic.o<br>=C2=A0 AR =C2=A0 =C2=A0 =C2=A0/home/prasha=
nt/jailhouse/hypervisor/arch/x86/lib-amd.a<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=
=A0/home/prashant/jailhouse/hypervisor/arch/x86/vmx.o<br>=C2=A0 CC =C2=A0 =
=C2=A0 =C2=A0/home/prashant/jailhouse/hypervisor/arch/x86/vtd.o<br>=C2=A0 A=
S =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/hypervisor/arch/x86/vmx-vmex=
it.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/hypervisor/a=
rch/x86/cat.o<br>=C2=A0 AR =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/hyp=
ervisor/arch/x86/lib-intel.a<br>=C2=A0 LDS =C2=A0 =C2=A0 /home/prashant/jai=
lhouse/hypervisor/hypervisor.lds<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/pra=
shant/jailhouse/hypervisor/setup.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/p=
rashant/jailhouse/hypervisor/printk.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/hom=
e/prashant/jailhouse/hypervisor/paging.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/=
home/prashant/jailhouse/hypervisor/control.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=
=A0/home/prashant/jailhouse/hypervisor/lib.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=
=A0/home/prashant/jailhouse/hypervisor/mmio.o<br>=C2=A0 CC =C2=A0 =C2=A0 =
=C2=A0/home/prashant/jailhouse/hypervisor/pci.o<br>=C2=A0 CC =C2=A0 =C2=A0 =
=C2=A0/home/prashant/jailhouse/hypervisor/ivshmem.o<br>=C2=A0 CC =C2=A0 =C2=
=A0 =C2=A0/home/prashant/jailhouse/hypervisor/uart.o<br>=C2=A0 CC =C2=A0 =
=C2=A0 =C2=A0/home/prashant/jailhouse/hypervisor/uart-8250.o<br>=C2=A0 LD =
=C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/hypervisor/hypervisor-amd.o<br=
>=C2=A0 OBJCOPY /home/prashant/jailhouse/hypervisor/jailhouse-amd.bin<br>=
=C2=A0 LD =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/hypervisor/hyperviso=
r-intel.o<br>=C2=A0 OBJCOPY /home/prashant/jailhouse/hypervisor/jailhouse-i=
ntel.bin<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/inmates/=
lib/x86/../alloc.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhous=
e/inmates/lib/x86/../cmdline.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prash=
ant/jailhouse/inmates/lib/x86/../pci.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/ho=
me/prashant/jailhouse/inmates/lib/x86/../printk.o<br>=C2=A0 CC =C2=A0 =C2=
=A0 =C2=A0/home/prashant/jailhouse/inmates/lib/x86/../setup.o<br>=C2=A0 CC =
=C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/inmates/lib/x86/../string.o<br=
>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/inmates/lib/x86/../=
test.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/inmates/li=
b/x86/../uart-8250.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/jailho=
use/inmates/lib/x86/cpu-features.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/p=
rashant/jailhouse/inmates/lib/x86/excp.o<br>=C2=A0 AS =C2=A0 =C2=A0 =C2=A0/=
home/prashant/jailhouse/inmates/lib/x86/header-64.o<br>=C2=A0 AS =C2=A0 =C2=
=A0 =C2=A0/home/prashant/jailhouse/inmates/lib/x86/header-common.o<br>=C2=
=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/inmates/lib/x86/ioapic.=
o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/inmates/lib/x86=
/irq.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/inmates/li=
b/x86/mem.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/inmat=
es/lib/x86/pci.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/=
inmates/lib/x86/printk.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/ja=
ilhouse/inmates/lib/x86/setup.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/pras=
hant/jailhouse/inmates/lib/x86/smp.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home=
/prashant/jailhouse/inmates/lib/x86/timing.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=
=A0/home/prashant/jailhouse/inmates/lib/x86/uart.o<br>=C2=A0 AR =C2=A0 =C2=
=A0 =C2=A0/home/prashant/jailhouse/inmates/lib/x86/lib.a<br>=C2=A0 CC =C2=
=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/inmates/lib/x86/cpu-features-32.o=
<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/inmates/lib/x86/=
excp-32.o<br>=C2=A0 AS =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/inmates=
/lib/x86/header-common-32.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant=
/jailhouse/inmates/lib/x86/irq-32.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/=
prashant/jailhouse/inmates/lib/x86/ioapic-32.o<br>=C2=A0 CC =C2=A0 =C2=A0 =
=C2=A0/home/prashant/jailhouse/inmates/lib/x86/printk-32.o<br>=C2=A0 CC =C2=
=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/inmates/lib/x86/setup-32.o<br>=C2=
=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/inmates/lib/x86/uart-32=
.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/inmates/lib/x8=
6/../alloc-32.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/i=
nmates/lib/x86/../pci-32.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/=
jailhouse/inmates/lib/x86/../string-32.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/=
home/prashant/jailhouse/inmates/lib/x86/../cmdline-32.o<br>=C2=A0 CC =C2=A0=
 =C2=A0 =C2=A0/home/prashant/jailhouse/inmates/lib/x86/../setup-32.o<br>=C2=
=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/inmates/lib/x86/../test=
-32.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/inmates/lib=
/x86/../uart-8250-32.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/jail=
house/inmates/lib/x86/../printk-32.o<br>=C2=A0 AS =C2=A0 =C2=A0 =C2=A0/home=
/prashant/jailhouse/inmates/lib/x86/header-32.o<br>=C2=A0 AR =C2=A0 =C2=A0 =
=C2=A0/home/prashant/jailhouse/inmates/lib/x86/lib32.a<br>=C2=A0 CC =C2=A0 =
=C2=A0 =C2=A0/home/prashant/jailhouse/inmates/demos/x86/tiny-demo.o<br>=C2=
=A0 LD =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/inmates/demos/x86/tiny-=
demo-linked.o<br>=C2=A0 OBJCOPY /home/prashant/jailhouse/inmates/demos/x86/=
tiny-demo.bin<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/inm=
ates/demos/x86/apic-demo.o<br>=C2=A0 LD =C2=A0 =C2=A0 =C2=A0/home/prashant/=
jailhouse/inmates/demos/x86/apic-demo-linked.o<br>=C2=A0 OBJCOPY /home/pras=
hant/jailhouse/inmates/demos/x86/apic-demo.bin<br>=C2=A0 CC =C2=A0 =C2=A0 =
=C2=A0/home/prashant/jailhouse/inmates/demos/x86/ioapic-demo.o<br>=C2=A0 LD=
 =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/inmates/demos/x86/ioapic-demo=
-linked.o<br>=C2=A0 OBJCOPY /home/prashant/jailhouse/inmates/demos/x86/ioap=
ic-demo.bin<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/inmat=
es/demos/x86/32-bit-demo.o<br>=C2=A0 LD =C2=A0 =C2=A0 =C2=A0/home/prashant/=
jailhouse/inmates/demos/x86/32-bit-demo-linked.o<br>=C2=A0 OBJCOPY /home/pr=
ashant/jailhouse/inmates/demos/x86/32-bit-demo.bin<br>=C2=A0 CC =C2=A0 =C2=
=A0 =C2=A0/home/prashant/jailhouse/inmates/demos/x86/pci-demo.o<br>=C2=A0 L=
D =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/inmates/demos/x86/pci-demo-l=
inked.o<br>=C2=A0 OBJCOPY /home/prashant/jailhouse/inmates/demos/x86/pci-de=
mo.bin<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/inmates/de=
mos/x86/e1000-demo.o<br>=C2=A0 LD =C2=A0 =C2=A0 =C2=A0/home/prashant/jailho=
use/inmates/demos/x86/e1000-demo-linked.o<br>=C2=A0 OBJCOPY /home/prashant/=
jailhouse/inmates/demos/x86/e1000-demo.bin<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=
=A0/home/prashant/jailhouse/inmates/demos/x86/../ivshmem-demo.o<br>=C2=A0 L=
D =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/inmates/demos/x86/ivshmem-de=
mo-linked.o<br>=C2=A0 OBJCOPY /home/prashant/jailhouse/inmates/demos/x86/iv=
shmem-demo.bin<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/in=
mates/demos/x86/smp-demo.o<br>=C2=A0 LD =C2=A0 =C2=A0 =C2=A0/home/prashant/=
jailhouse/inmates/demos/x86/smp-demo-linked.o<br>=C2=A0 OBJCOPY /home/prash=
ant/jailhouse/inmates/demos/x86/smp-demo.bin<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=
=A0/home/prashant/jailhouse/inmates/demos/x86/cache-timings.o<br>=C2=A0 LD =
=C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/inmates/demos/x86/cache-timing=
s-linked.o<br>=C2=A0 OBJCOPY /home/prashant/jailhouse/inmates/demos/x86/cac=
he-timings.bin<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/in=
mates/tests/x86/mmio-access.o<br>=C2=A0 LD =C2=A0 =C2=A0 =C2=A0/home/prasha=
nt/jailhouse/inmates/tests/x86/mmio-access-linked.o<br>=C2=A0 OBJCOPY /home=
/prashant/jailhouse/inmates/tests/x86/mmio-access.bin<br>=C2=A0 CC =C2=A0 =
=C2=A0 =C2=A0/home/prashant/jailhouse/inmates/tests/x86/mmio-access-32.o<br=
>=C2=A0 LD =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/inmates/tests/x86/m=
mio-access-32-linked.o<br>=C2=A0 OBJCOPY /home/prashant/jailhouse/inmates/t=
ests/x86/mmio-access-32.bin<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant=
/jailhouse/inmates/tests/x86/sse-demo.o<br>=C2=A0 LD =C2=A0 =C2=A0 =C2=A0/h=
ome/prashant/jailhouse/inmates/tests/x86/sse-demo-linked.o<br>=C2=A0 OBJCOP=
Y /home/prashant/jailhouse/inmates/tests/x86/sse-demo.bin<br>=C2=A0 CC =C2=
=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/inmates/tests/x86/sse-demo-32.o<b=
r>=C2=A0 LD =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/inmates/tests/x86/=
sse-demo-32-linked.o<br>=C2=A0 OBJCOPY /home/prashant/jailhouse/inmates/tes=
ts/x86/sse-demo-32.bin<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/jail=
house/inmates/tools/x86/linux-loader.o<br>=C2=A0 LD =C2=A0 =C2=A0 =C2=A0/ho=
me/prashant/jailhouse/inmates/tools/x86/linux-loader-linked.o<br>=C2=A0 OBJ=
COPY /home/prashant/jailhouse/inmates/tools/x86/linux-loader.bin<br>=C2=A0 =
GEN =C2=A0 =C2=A0 /home/prashant/jailhouse/pyjailhouse/pci_defs.py<br>=C2=
=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/tools/jailhouse.o<br>=
=C2=A0 LD =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/tools/jailhouse<br>=
=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/tools/demos/ivshmem-=
demo.o<br>=C2=A0 LD =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/tools/demo=
s/ivshmem-demo<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/to=
ols/demos/cache-timings.o<br>=C2=A0 LD =C2=A0 =C2=A0 =C2=A0/home/prashant/j=
ailhouse/tools/demos/cache-timings<br>=C2=A0 GEN =C2=A0 =C2=A0 /home/prasha=
nt/jailhouse/tools/jailhouse-config-collect<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=
=A0/home/prashant/jailhouse/tools/jailhouse-gcov-extract.o<br>=C2=A0 LD =C2=
=A0 =C2=A0 =C2=A0/home/prashant/jailhouse/tools/jailhouse-gcov-extract<br>=
=C2=A0 GEN =C2=A0 =C2=A0 /home/prashant/jailhouse/tools/jailhouse.8<br>=C2=
=A0 GEN =C2=A0 =C2=A0 /home/prashant/jailhouse/tools/jailhouse-cell.8<br>=
=C2=A0 GEN =C2=A0 =C2=A0 /home/prashant/jailhouse/tools/jailhouse-enable.8<=
br>=C2=A0 MODPOST /home/prashant/jailhouse/Module.symvers<br>ERROR: modpost=
: &quot;lapic_timer_period&quot; [/home/prashant/jailhouse/driver/jailhouse=
.ko] undefined!<br>ERROR: modpost: &quot;__get_vm_area_caller&quot; [/home/=
prashant/jailhouse/driver/jailhouse.ko] undefined!<br>ERROR: modpost: &quot=
;ioremap_page_range&quot; [/home/prashant/jailhouse/driver/jailhouse.ko] un=
defined!<br>make[2]: *** [scripts/Makefile.modpost:111: /home/prashant/jail=
house/Module.symvers] Error 1<br>make[2]: *** Deleting file &#39;/home/pras=
hant/jailhouse/Module.symvers&#39;<br>make[1]: *** [Makefile:1714: modules]=
 Error 2<br>make: *** [Makefile:40: modules] Error 2<br>[prashant@fedora ja=
ilhouse]$ <br><br></div><div>I could see the issue is with the kernel. Coul=
d I get necessary steps to fix this? How to apply patches if I have? Pointi=
ng to any resource also might be very helpful. <br></div><div>Thank you <br=
></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAEoyBwCDWM%3D%2BiUXzXtECTpugFprTkMSj-P%2BgoS0R8yO=
izZTYdg%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://gr=
oups.google.com/d/msgid/jailhouse-dev/CAEoyBwCDWM%3D%2BiUXzXtECTpugFprTkMSj=
-P%2BgoS0R8yOizZTYdg%40mail.gmail.com</a>.<br />

--0000000000009eeffa05c29620f0--
