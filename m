Return-Path: <jailhouse-dev+bncBCW4LL4WQ4PBB2VX6P4QKGQEZZP4TUA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x637.google.com (mail-pl1-x637.google.com [IPv6:2607:f8b0:4864:20::637])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E97A2497DE
	for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Aug 2020 09:59:40 +0200 (CEST)
Received: by mail-pl1-x637.google.com with SMTP id q22sf13841309pls.13
        for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Aug 2020 00:59:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597823978; cv=pass;
        d=google.com; s=arc-20160816;
        b=Oa8PigTBZTR57JrD2jOEMq72epwHsESvhScEwHcBqO97UreiZNmQfgQcmeGdZ9CJBk
         ar7axnaMR0tL4ymbHLoX8Aj3iTj6PKpsIFfyAbxWLlNQggLfDbgvh5FAKpy/QEgEQUdu
         l6HuMgBUiGabdAZ0rimNylK1IgdGIovUNDg+IAvgdT/A0G7w+ONcMFVgbvbBjl890rF4
         I+npZhzuZFJRCCIE1Jzy/5oRqxhlHH+kMtl3ojPmHIt+gJAGPdl7jGFvcYUE0V7GamYw
         /y4G71gaoEAHttK5QtrXPxXPDbsHD9uWFQTFzHWakVQNqxBG1SwDC5uNJKThSWWSQoQV
         btQQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=xR6McE1W/JFkym8XyM7SMihJ16JINiFqgwoHz74kIeE=;
        b=uRioz29azMqdAe09OfPQg81kM9ZhxfNPje7//ZRERckSCRmSs16cbXBwaIpOUL9gT+
         4fe6vPq8uQVESx4wlbMkMAjX60zUixIwDWRXda1rizB9vPxMGovpZVUsCAbkDIVlOyic
         GUxLvXTda7qD3Oi6GgwOU0ysCpedI9m7zbDItkUfEuWll1sf+elI0nGy3XBhQNoN3lBb
         Q8J3RZtJijR7oy5Zd4QeU6nzYOxIULYXLjBPIxY6mEfUnOBh2kbpgxA/xPjwC8ymui9D
         RyZmNVNFoQUTNAn9obnjaCFR3SgHGal3gDE1PmExTuYEihdsKTtqPeKLu1WT63MpndoB
         khUg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="kJ/Dc9cA";
       spf=pass (google.com: domain of van.freenix@gmail.com designates 2607:f8b0:4864:20::230 as permitted sender) smtp.mailfrom=van.freenix@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xR6McE1W/JFkym8XyM7SMihJ16JINiFqgwoHz74kIeE=;
        b=p18IYLEhWCEf11LfKm9rIIvWSTJuWkV+fEZaZ5KgZ720e6+fzKVxpaSothp93utviH
         68i96idZfDU7JvDR1bSWd8bXf78+Z/acVwyk1mQNDK2oGEJXEL88EjZHlqEmuhjap7Wc
         a9OtTFpwVtz1J8kIq3s7Ytq8x4ZBNrBE1JZeBDFU7RuoNKiqoF4/ecxw9Zn8GtXftxDI
         JklbhAI49ZFrTfYC9b7+BMvspVxORIDA6N04QH+OKhqM7ZvSfs8yXZJcZpSZVfhuXJbe
         hUSk22Txk+B30GJJ41S6nk0rsqPnH14fonitc3aea0D6NysI+NSn29RtB4PM8oYd8O6S
         0qZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xR6McE1W/JFkym8XyM7SMihJ16JINiFqgwoHz74kIeE=;
        b=rpV9JEIrApACkDKmQDREVh31gDRs2M8hsJ0tjPzt+sEFkZ33FB4NFH6sUQOdxUACKA
         PUZbCQK5Q6hS3Q5SYAcvG1rW1uV4iNDr8k+lIELL+G7SGE/QwqBqlPALBVQSyOYCKHf+
         Z8tCRq1hp4EeHJG0G3BoBoip4wfeFnUbmJ6MyG0Vzs+Um0hnaPPP5DoFOaYBNVFOqZsm
         ZniQalsYsv02erDVnsgY1sjqHSpWmRi+CVIET9u0VqQunswwA18oh3Izq/cFGGuwgySI
         3og1oOk0LZNC5yNkUsybKnqbo1f8cFOfQ0Y9pT9FnIUhLICo1pzMyRQgGPJ8ji0Mgm7d
         hJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xR6McE1W/JFkym8XyM7SMihJ16JINiFqgwoHz74kIeE=;
        b=hccTEG6GXz6/bHj6+UAg3FRT5/a2sPHtnqzsmgZ48eT/XXs6ssErSXkDNrRqNf9j7z
         68iXCeJGgJHSCKxzXGGjNGminOCa7jqdpaDoAafFoZJFdwag8yozGNpZSNGc0lP9wf1D
         FFLUN8V6sHtKTHtOfjv2/BhLySo9Ue9Nc0CsPViwE2ma1ZvR+CQC9AsqhvrLzrktfdFt
         4LHOl2UrVFsb/UcHUZCelgPYGjwBIAHUmuz4VpizqYyjFlPEdA4Kgl+R77Cc05oAPp+U
         psX1KZKlvLF7ZypmvPKJfjOT2lICb1PnP3q28sg0zQyqaWBpppZW+qMJTTmGLMHaEUWm
         Hd4w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532sTAMuQ3i4gIOeFk4C7IoXiWAhnRK2l9SSLLDtx/i4HcjIBtIY
	bxgQl6CAG9XQi+iVXE4hNv0=
X-Google-Smtp-Source: ABdhPJz9QsVp7pfrxd1ASvXlXggKxg5dpuDoJDcZuN2L/9kbcB5vfX8prA+FMq85H9HXrK+3mHVhtw==
X-Received: by 2002:a17:90a:fe0c:: with SMTP id ck12mr3335163pjb.102.1597823978688;
        Wed, 19 Aug 2020 00:59:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:d303:: with SMTP id b3ls9875569plc.2.gmail; Wed, 19
 Aug 2020 00:59:38 -0700 (PDT)
X-Received: by 2002:a17:90b:2092:: with SMTP id hb18mr3306821pjb.118.1597823977869;
        Wed, 19 Aug 2020 00:59:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597823977; cv=none;
        d=google.com; s=arc-20160816;
        b=LFFPT6zi4xejrznxtAzEYMi43Iml6K1tjASxO/FXfpeENuZHgf7ezZxrQQ2wp6+E6d
         d5GKXQN7OzQevlKL5cMgyazrVEC3ooBPn2TTPzl3Jrn0HagHyYpG6Mneu7A0V7oKnxRq
         ookBNepevLReQufOYYA+ZDjDBZWk+J4pzZctNxNWlsWUdvuK7akxNSRB5ikfhrS037rw
         LwayyOPOj9ealscyw2OVbNkSd7Mwibqah+Xt5qKfAvkyjC5Rf5rf7xoVDzf84XI+vhui
         El9VdPddiFGZKMcq+IvxAUZujqCMFiGN4Rrynvc0eB8qoJtPYgLVfXv3iF+USy/D0JS/
         DRTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MTmQJq3tvJOK4fIfku69gEy88nvWlRpkqndDnAvhkJA=;
        b=oLxTnVuGEnc/HiitfzWPSiYGdINJ6cFBD6jBlQD8TGNXUg/BIqa/c4o6+UuxK8yplQ
         zcGtq7uP1Brj2pj7mfmnw/TEQUK8Kcx3YHrz4S6fqbxhJ/VzM9+MnJxYN6n0I6a3wOX0
         XLWnIg+9rtevcCfBgtB3w4Rodp29VFRA+y8ROMgwWEyJ9dot4xq3gzvF5P4aGnNPGO5x
         HHWNQqp9xVu4jvGzDDlkyA1HKu1sz02wbfPYkjHFV/zINfhaDZVVUYm6gCzVRstSooVj
         Jm0VGJuNCznMoEn7UPAw4MwKQRljFkwJoklbbhOVn8xBUHvr9PVxxTR9CpRQLFYL+Hle
         VtrQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="kJ/Dc9cA";
       spf=pass (google.com: domain of van.freenix@gmail.com designates 2607:f8b0:4864:20::230 as permitted sender) smtp.mailfrom=van.freenix@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com. [2607:f8b0:4864:20::230])
        by gmr-mx.google.com with ESMTPS id ls7si172612pjb.2.2020.08.19.00.59.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2020 00:59:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of van.freenix@gmail.com designates 2607:f8b0:4864:20::230 as permitted sender) client-ip=2607:f8b0:4864:20::230;
Received: by mail-oi1-x230.google.com with SMTP id b22so20253154oic.8
        for <jailhouse-dev@googlegroups.com>; Wed, 19 Aug 2020 00:59:37 -0700 (PDT)
X-Received: by 2002:a05:6808:2d4:: with SMTP id a20mr2364098oid.151.1597823977045;
 Wed, 19 Aug 2020 00:59:37 -0700 (PDT)
MIME-Version: 1.0
References: <a46f55d1-2b6f-485e-8eef-71aa5eb08d92o@googlegroups.com>
In-Reply-To: <a46f55d1-2b6f-485e-8eef-71aa5eb08d92o@googlegroups.com>
From: Peng Fan <van.freenix@gmail.com>
Date: Wed, 19 Aug 2020 15:59:25 +0800
Message-ID: <CAEfxd-8R-m4tpSBhyReThoXOoou740wsyi_+Uv6tUnwUjDO1=g@mail.gmail.com>
Subject: Re: imx8: issue with jailhouse on custom freescale image for imx8mq-evk
To: Vipul Suneja <vsuneja63@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="00000000000090c47605ad366291"
X-Original-Sender: Van.Freenix@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b="kJ/Dc9cA";       spf=pass
 (google.com: domain of van.freenix@gmail.com designates 2607:f8b0:4864:20::230
 as permitted sender) smtp.mailfrom=van.freenix@gmail.com;       dmarc=pass
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

--00000000000090c47605ad366291
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please change your bootargs root *mmcblk0p2 per your boot log.*

Vipul Suneja <vsuneja63@gmail.com> =E4=BA=8E2020=E5=B9=B48=E6=9C=8818=E6=97=
=A5=E5=91=A8=E4=BA=8C =E4=B8=8A=E5=8D=882:09=E5=86=99=E9=81=93=EF=BC=9A

> Hi Peng,
>
>
>
> Thanks!
>
>
>
> I could load NXP 5.4.24 bsp image as primary & secondary linux (in non
> root cell) in *imx8mq evk* target. I am trying to do the same in a custom
> freescale image bsp 5.4.46. I could successfully add & build jailhouse 0.=
12
> in the image, but the image boot up failed if i choose "run jh_mmcboot" i=
n
> u-boot. Image boots up fine if go normally without jh_mmcboot. Here are t=
he
> logs below, expecting some pointers from your end:
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
> *U-Boot SPL 2019.04-lf-5.4.y_v2019.04+g228843c (Jun 29 2020 - 03:06:40
> +0000)PMIC:  PFUZE100 ID=3D0x10DDRINFO: start DRAM initDDRINFO:ddrphy
> calibration doneDDRINFO: ddrmix config doneNormal BootTrying to boot from
> MMC2U-Boot 2019.04-lf-5.4.y_v2019.04+g228843c (Jun 29 2020 - 03:06:40
> +0000)CPU:   Freescale i.MX8MQ rev2.0 1500 MHz (running at 1000 MHz)CPU:
> Commercial temperature grade (0C to 95C) at 44CReset cause: PORModel:
> Freescale i.MX8MQ EVKDRAM:  3 GiBTCPC:  Vendor ID [0x1fc9], Product ID
> [0x5110], Addr [I2C0 0x50]MMC:   FSL_SDHC: 0, FSL_SDHC: 1Loading
> Environment from MMC... *** Warning - bad CRC, using default environmentN=
o
> panel detected: default to HDMIDisplay: HDMI (1280x720)In:    serialOut:
> serialErr:   serial BuildInfo:  - ATF 7b3389d  - U-Boot
> 2019.04-lf-5.4.y_v2019.04+g228843cswitch to partitions #0, OKmmc1 is
> current deviceflash target is MMC:1Net:Warning: ethernet@30be0000 using M=
AC
> address from ROMeth0: ethernet@30be0000Fastboot: NormalNormal BootHit any
> key to stop autoboot:  0u-boot=3D>
> printenvbaudrate=3D115200boot_fdt=3Dtrybootcmd=3Dmmc dev ${mmcdev}; if mm=
c
> rescan; then if run loadbootscript; then run bootscript; else if run
> loadimage; then run mmcboot; else run netboot; fi; fi; else booti
> ${loadaddr} - ${fdt_addr}; fibootcmd_mfg=3Drun mfgtool_args;if iminfo
> ${initrd_addr}; then if test ${tee} =3D yes; then bootm ${tee_addr}
> ${initrd_addr} ${fdt_addr}; else booti ${loadaddr} ${initrd_addr}
> ${fdt_addr}; fi; else echo "Run fastboot ..."; fastboot 0;
> fi;bootdelay=3D2bootscript=3Decho Running bootscript from mmc ...;
> sourceconsole=3Dttymxc0,115200
> earlycon=3Dec_imx6q,0x30860000,115200emmc_dev=3D0ethaddr=3D00:04:9f:05:a5=
:9cethprime=3DFECfastboot_dev=3Dmmc1fdt_addr=3D0x43000000fdt_file=3Dimx8mq-=
evk.dtbfdt_high=3D0xfffffffffffffffffdtcontroladdr=3Dfd919fe8image=3DImagei=
nitrd_addr=3D0x43800000initrd_high=3D0xffffffffffffffffjh_clk=3Djh_mmcboot=
=3Dsetenv
> fdt_file imx8mq-evk-root.dtb; setenv jh_clk clk_ignore_unused; if run
> loadimage; then run mmcboot; else run jh_netboot; fi;jh_netboot=3Dsetenv
> fdt_file imx8mq-evk-root.dtb; setenv jh_clk clk_ignore_unused; run
> netboot;kboot=3Dbootiloadaddr=3D0x40480000loadbootscript=3Dfatload mmc
> ${mmcdev}:${mmcpart} ${loadaddr} ${script};loadfdt=3Dfatload mmc
> ${mmcdev}:${mmcpart} ${fdt_addr} ${fdt_file}loadimage=3Dfatload mmc
> ${mmcdev}:${mmcpart} ${loadaddr} ${image}mfgtool_args=3Dsetenv bootargs
> console=3D${console},${baudrate} rdinit=3D/linuxrc
> clk_ignore_unusedmmcargs=3Dsetenv bootargs ${jh_clk} console=3D${console}
> root=3D${mmcroot}mmcautodetect=3Dyesmmcboot=3Decho Booting from mmc ...; =
run
> mmcargs; if test ${boot_fdt} =3D yes || test ${boot_fdt} =3D try; then if=
 run
> loadfdt; then booti ${loadaddr} - ${fdt_addr}; else echo WARN: Cannot loa=
d
> the DT; fi; else echo wait for boot;
> fi;mmcdev=3D1mmcpart=3D1mmcroot=3D/dev/mmcblk1p2 rootwait rwnetargs=3Dset=
env
> bootargs ${jh_clk} console=3D${console} root=3D/dev/nfs ip=3Ddhcp
> nfsroot=3D${serverip}:${nfsroot},v3,tcpnetboot=3Decho Booting from net ..=
.; run
> netargs;  if test ${ip_dyn} =3D yes; then setenv get_cmd dhcp; else seten=
v
> get_cmd tftp; fi; ${get_cmd} ${loadaddr} ${image}; if test ${boot_fdt} =
=3D
> yes || test ${boot_fdt} =3D try; then if ${get_cmd} ${fdt_addr} ${fdt_fil=
e};
> then booti ${loadaddr} - ${fdt_addr}; else echo WARN: Cannot load the DT;
> fi; else booti;
> fi;script=3Dboot.scrsd_dev=3D1serial#=3D051a61d6f0609912soc_type=3Dimx8mq=
Environment
> size: 2298/4092 bytesu-boot=3D> run jh_mmcboot26708480 bytes read in 1145=
 ms
> (22.2 MiB/s)Booting from mmc ...44274 bytes read in 8 ms (5.3 MiB/s)##
> Flattened Device Tree blob at 43000000   Booting using the fdt blob at
> 0x43000000   Using Device Tree in place at 0000000043000000, end
> 000000004300dcf1Starting kernel ...[    0.000000] Booting Linux on physic=
al
> CPU 0x0000000000 [0x410fd034][    0.000000] Linux version 5.4.46+g5376418
> (oe-user@oe-host) (gcc version 9.3.0 (GCC)) #1 SMP PREEMPT Mon Jun 29
> 03:06:40 UTC 2020[    0.000000] Machine model: NXP i.MX8MQ EVK[
> 0.000000] earlycon: ec_imx6q0 at MMIO 0x0000000030860000 (options
> '115200')[    0.000000] printk: bootconsole [ec_imx6q0] enabled[
> 0.000000] efi: Getting EFI parameters from FDT:[    0.000000] efi: UEFI n=
ot
> found.[    0.000000] Reserved memory: created CMA memory pool at
> 0x0000000044000000, size 960 MiB[    0.000000] OF: reserved mem:
> initialized node linux,cma, compatible id shared-dma-pool[    0.000000]
> NUMA: No NUMA configuration found[    0.000000] NUMA: Faking a node at [m=
em
> 0x0000000040000000-0x00000000bfafffff][    0.000000] NUMA: NODE_DATA [mem
> 0xbf6d0500-0xbf6d1fff][    0.000000] Zone ranges:[    0.000000]   DMA32
> [mem 0x0000000040000000-0x00000000bfafffff][    0.000000]   Normal
> empty[    0.000000] Movable zone start for each node[    0.000000] Early
> memory node ranges[    0.000000]   node   0: [mem
> 0x0000000040000000-0x00000000b7ffffff][    0.000000]   node   0: [mem
> 0x00000000b8400000-0x00000000bfafffff][    0.000000] Zeroed struct page i=
n
> unavailable ranges: 256 pages[    0.000000] Initmem setup node 0 [mem
> 0x0000000040000000-0x00000000bfafffff][    0.000000] psci: probing for
> conduit method from DT.[    0.000000] psci: PSCIv1.1 detected in
> firmware.[    0.000000] psci: Using standard PSCI v0.2 function IDs[
> 0.000000] psci: Trusted OS migration not required[    0.000000] psci: SMC
> Calling Convention v1.1[    0.000000] percpu: Embedded 24 pages/cpu s5884=
0
> r8192 d31272 u98304[    0.000000] Detected VIPT I-cache on CPU0[
> 0.000000] CPU features: detected: ARM erratum 845719[    0.000000] CPU
> features: detected: GIC system register CPU interface[    0.000000]
> Speculative Store Bypass Disable mitigation not required[    0.000000]
> Built 1 zonelists, mobility grouping on.  Total pages: 513812[    0.00000=
0]
> Policy zone: DMA32[    0.000000] Kernel command line: clk_ignore_unused
> console=3Dttymxc0,115200 earlycon=3Dec_imx6q,0x30860000,115200
> root=3D/dev/mmcblk1p2 rootwait rw[    0.000000] Dentry cache hash table
> entries: 262144 (order: 9, 2097152 bytes, linear)[    0.000000] Inode-cac=
he
> hash table entries: 131072 (order: 8, 1048576 bytes, linear)[    0.000000=
]
> mem auto-init: stack:off, heap alloc:off, heap free:off[    0.000000]
> Memory: 1037220K/2087936K available (15676K kernel code, 1186K rwdata,
> 6252K rodata, 2880K init, 1012K bss, 67676K reserved, 983040K
> cma-reserved)[    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=
=3D0,
> CPUs=3D4, Nodes=3D1[    0.000000] rcu: Preemptible hierarchical RCU
> implementation.[    0.000000] rcu:     RCU restricting CPUs from
> NR_CPUS=3D256 to nr_cpu_ids=3D4.[    0.000000]  Tasks RCU enabled.[
> 0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25
> jiffies.[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16,
> nr_cpu_ids=3D4[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs:
> 0[    0.000000] GICv3: GIC: Using split EOI/Deactivate mode[    0.000000]
> GICv3: 128 SPIs implemented[    0.000000] GICv3: 0 Extended SPIs
> implemented[    0.000000] GICv3: Distributor has no Range Selector
> support[    0.000000] GICv3: 16 PPIs implemented[    0.000000] GICv3: no
> VLPI support, no direct LPI support[    0.000000] GICv3: CPU0: found
> redistributor 0 region 0:0x0000000038880000[    0.000000] ITS: No ITS
> available, not enabling LPIs[    0.000000] random: get_random_bytes calle=
d
> from start_kernel+0x2b8/0x44c with crng_init=3D0[    0.000000] arch_timer=
:
> cp15 timer(s) running at 8.33MHz (phys).[    0.000000] clocksource:
> arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x1ec0311ec,
> max_idle_ns: 440795202152 ns[    0.000004] sched_clock: 56 bits at 8MHz,
> resolution 120ns, wraps every 2199023255541ns[    0.008522] Console: colo=
ur
> dummy device 80x25[    0.012540] Calibrating delay loop (skipped), value
> calculated using timer frequency.. 16.66 BogoMIPS (lpj=3D33333)[    0.022=
767]
> pid_max: default: 32768 minimum: 301[    0.027466] LSM: Security Framewor=
k
> initializing[    0.032057] Smack:  Initializing.[    0.035314] Smack:  IP=
v6
> port labeling enabled.[    0.039903] Mount-cache hash table entries: 4096
> (order: 3, 32768 bytes, linear)[    0.047278] Mountpoint-cache hash table
> entries: 4096 (order: 3, 32768 bytes, linear)[    0.079192] ASID allocato=
r
> initialised with 32768 entries[    0.087188] rcu: Hierarchical SRCU
> implementation.[    0.096133] EFI services will not be available.[
> 0.103219] smp: Bringing up secondary CPUs ...[    0.135392] Detected VIPT
> I-cache on CPU1[    0.135420] GICv3: CPU1: found redistributor 1 region
> 0:0x00000000388a0000[    0.135444] CPU1: Booted secondary processor
> 0x0000000001 [0x410fd034][    0.167418] Detected VIPT I-cache on CPU2[
> 0.167434] GICv3: CPU2: found redistributor 2 region
> 0:0x00000000388c0000[    0.167450] CPU2: Booted secondary processor
> 0x0000000002 [0x410fd034][    0.199475] Detected VIPT I-cache on CPU3[
> 0.199491] GICv3: CPU3: found redistributor 3 region
> 0:0x00000000388e0000[    0.199508] CPU3: Booted secondary processor
> 0x0000000003 [0x410fd034][    0.199574] smp: Brought up 1 node, 4 CPUs[
> 0.253145] SMP: Total of 4 processors activated.[    0.257849] CPU feature=
s:
> detected: 32-bit EL0 Support[    0.263005] CPU features: detected: CRC32
> instructions[    0.276060] CPU: All CPU(s) started at EL2[    0.277324]
> alternatives: patching kernel code[    0.283321] devtmpfs: initialized[
> 0.291775] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff,
> max_idle_ns: 7645041785100000 ns[    0.298700] futex hash table entries:
> 1024 (order: 4, 65536 bytes, linear)[    0.334050] pinctrl core:
> initialized pinctrl subsystem[    0.337229] DMI not present or invalid.[
> 0.340553] NET: Registered protocol family 16[    0.357311] DMA:
> preallocated 256 KiB pool for atomic allocations[    0.360565] audit:
> initializing netlink subsys (disabled)[    0.366096] audit: type=3D2000
> audit(0.316:1): state=3Dinitialized audit_enabled=3D0 res=3D1[    0.37375=
4]
> cpuidle: using governor menu[    0.378251] hw-breakpoint: found 6
> breakpoint and 4 watchpoint registers.[    0.385345] Serial: AMBA PL011
> UART driver[    0.388621] imx mu driver is registered.[    0.392485] imx
> rpmsg driver is registered.[    0.400586] imx8mq-pinctrl 30330000.iomuxc:
> initialized IMX pinctrl driver[    0.426581] HugeTLB registered 1.00 GiB
> page size, pre-allocated 0 pages[    0.430457] HugeTLB registered 32.0 Mi=
B
> page size, pre-allocated 0 pages[    0.437159] HugeTLB registered 2.00 Mi=
B
> page size, pre-allocated 0 pages[    0.443872] HugeTLB registered 64.0 Ki=
B
> page size, pre-allocated 0 pages[    0.452450] cryptd: max_cpu_qlen set t=
o
> 1000[    0.460740] ACPI: Interpreter disabled.[    0.466072] iommu: Defau=
lt
> domain type: Translated[    0.468237] vgaarb: loaded[    0.471117] SCSI
> subsystem initialized[    0.475173] usbcore: registered new interface
> driver usbfs[    0.480083] usbcore: registered new interface driver hub[
> 0.485433] usbcore: registered new device driver usb[    0.491493] mc: Lin=
ux
> media interface: v0.10[    0.494724] videodev: Linux video capture
> interface: v2.00[    0.500256] pps_core: LinuxPPS API ver. 1 registered[
> 0.505160] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo
> Giometti <giometti@linux.it <giometti@linux.it>>[    0.514325] PTP clock
> support registered[    0.518379] EDAC MC: Ver: 3.0.0[    0.522183] No BMa=
n
> portals available![    0.525459] QMan: Allocated lookup table at
> (____ptrval____), entry count 65537[    0.532766] No QMan portals
> available![    0.536666] No USDPAA memory, no 'fsl,usdpaa-mem' in
> device-tree[    0.542598] FPGA manager framework[    0.545690] Advanced
> Linux Sound Architecture Driver Initialized.[    0.552115] NetLabel:
> Initializing[    0.555118] NetLabel:  domain hash size =3D 128[    0.5594=
86]
> NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO[    0.565202] NetLabel=
:
> unlabeled traffic allowed by default[    0.571430] clocksource: Switched =
to
> clocksource arch_sys_counter[    0.577005] VFS: Disk quotas dquot_6.6.0[
> 0.580819] VFS: Dquot-cache hash table entries: 512 (order 0, 4096
> bytes)[    0.587831] pnp: PnP ACPI: disabled[    0.597738] thermal_sys:
> Registered thermal governor 'step_wise'[    0.597741] thermal_sys:
> Registered thermal governor 'power_allocator'[    0.601226] NET: Register=
ed
> protocol family 2[    0.612156] tcp_listen_portaddr_hash hash table
> entries: 1024 (order: 2, 16384 bytes, linear)[    0.620396] TCP establish=
ed
> hash table entries: 16384 (order: 5, 131072 bytes, linear)[    0.628412]
> TCP bind hash table entries: 16384 (order: 6, 262144 bytes, linear)[
> 0.635849] TCP: Hash tables configured (established 16384 bind 16384)[
> 0.642240] UDP hash table entries: 1024 (order: 3, 32768 bytes, linear)[
> 0.648911] UDP-Lite hash table entries: 1024 (order: 3, 32768 bytes,
> linear)[    0.656160] NET: Registered protocol family 1[    0.660772] RPC=
:
> Registered named UNIX socket transport module.[    0.666312] RPC:
> Registered udp transport module.[    0.671012] RPC: Registered tcp
> transport module.[    0.675722] RPC: Registered tcp NFSv4.1 backchannel
> transport module.[    0.682555] PCI: CLS 0 bytes, default 64[    0.686877=
]
> hw perfevents: enabled with armv8_cortex_a53 PMU driver, 7 counters
> available[    0.694656] kvm [1]: IPA Size Limit: 40bits[    0.699184] kvm
> [1]: vgic-v2@31020000[    0.702163] kvm [1]: GIC system register CPU
> interface enabled[    0.708049] kvm [1]: vgic interrupt IRQ1[    0.712020=
]
> kvm [1]: Hyp mode initialized successfully[    0.722834] Initialise syste=
m
> trusted keyrings[    0.724541] workingset: timestamp_bits=3D44 max_order=
=3D19
> bucket_order=3D0[    0.737258] squashfs: version 4.0 (2009/01/31) Phillip
> Lougher[    0.740896] NFS: Registering the id_resolver key type[
> 0.745333] Key type id_resolver registered[    0.749491] Key type id_legac=
y
> registered[    0.753510] nfs4filelayout_init: NFSv4 File Layout Driver
> Registering...[    0.760234] jffs2: version 2.2. (NAND) =C2=A9 2001-2006 =
Red
> Hat, Inc.[    0.766703] 9p: Installing v9fs 9p2000 file system support[
> 0.787998] Key type asymmetric registered[    0.789236] Asymmetric key
> parser 'x509' registered[    0.794162] Block layer SCSI generic (bsg)
> driver version 0.4 loaded (major 244)[    0.801543] io scheduler
> mq-deadline registered[    0.806072] io scheduler kyber registered[
> 0.814902] EINJ: ACPI disabled.[    0.823000] imx-sdma 302c0000.sdma: Dire=
ct
> firmware load for imx/sdma/sdma-imx7d.bin failed with error -2[
> 0.829836] imx-sdma 302c0000.sdma: Direct firmware load for
> imx/sdma/sdma-imx7d.bin failed with error -2[    0.834079] mxs-dma
> 33000000.dma-apbh: initialized[    0.839348] imx-sdma 302c0000.sdma:
> external firmware not found, using ROM firmware[    0.844225] imx-sdma
> 30bd0000.sdma: Direct firmware load for imx/sdma/sdma-imx7d.bin failed wi=
th
> error -2[    0.854814] Bus freq driver module loaded[    0.861404] imx-sd=
ma
> 30bd0000.sdma: external firmware not found, using ROM firmware[
> 0.877597] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled[
> 0.883159] 30860000.serial: ttymxc0 at MMIO 0x30860000 (irq =3D 30, base_b=
aud
> =3D 1562500) is a IMX[    0.889886] printk: console [ttymxc0] enabled[
> 0.889886] printk: console [ttymxc0] enabled[    0.898532] printk:
> bootconsole [ec_imx6q0] disabled[    0.898532] printk: bootconsole
> [ec_imx6q0] disabled[    0.908931] 30880000.serial: ttymxc2 at MMIO
> 0x30880000 (irq =3D 31, base_baud =3D 5000000) is a IMX[    0.928199] imx=
-dcss
> 32e00000.display-controller: ctxld: can't get irq number[    0.935434]
> imx-dcss 32e00000.display-controller: submodules initialization failed[
> 0.953837] loop: module loaded[    0.959117] imx ahci driver is
> registered.[    0.966058] spi-nor spi3.0: n25q256a (32768 Kbytes)[
> 0.977852] libphy: Fixed MDIO Bus: probed[    0.982771] tun: Universal
> TUN/TAP device driver, 1.6[    0.988585] thunder_xcv, ver 1.0[    0.99185=
7]
> thunder_bgx, ver 1.0[    0.995114] nicpf, ver 1.0[    0.998573] pps pps0:
> new PPS source ptp0[    1.008325] libphy: fec_enet_mii_bus: probed[
> 1.013751] fec 30be0000.ethernet eth0: registered PHC device 0[    1.02032=
5]
> Freescale FM module, FMD API version 21.1.0[    1.025834] Freescale FM
> Ports module[    1.029506] fsl_mac: fsl_mac: FSL FMan MAC API based
> driver[    1.035250] fsl_dpa: FSL DPAA Ethernet driver[    1.039728]
> fsl_advanced: FSL DPAA Advanced drivers:[    1.044701] fsl_proxy: FSL DPA=
A
> Proxy initialization driver[    1.050388] fsl_oh: FSL FMan Offline Parsin=
g
> port driver[    1.056656] hclge is initializing[    1.059982] hns3:
> Hisilicon Ethernet Network Driver for Hip08 Family - version[    1.067209=
]
> hns3: Copyright (c) 2017 Huawei Corporation.[    1.072568] e1000: Intel(R=
)
> PRO/1000 Network Driver - version 7.3.21-k8-NAPI[    1.079623] e1000:
> Copyright (c) 1999-2006 Intel Corporation.[    1.085406] e1000e: Intel(R)
> PRO/1000 Network Driver - 3.2.6-k[    1.091244] e1000e: Copyright(c) 1999=
 -
> 2015 Intel Corporation.[    1.097209] igb: Intel(R) Gigabit Ethernet
> Network Driver - version 5.6.0-k[    1.104182] igb: Copyright (c) 2007-20=
14
> Intel Corporation.[    1.109793] igbvf: Intel(R) Gigabit Virtual Function
> Network Driver - version 2.4.0-k[    1.117629] igbvf: Copyright (c) 2009 =
-
> 2012 Intel Corporation.[    1.123712] sky2: driver version 1.30[
> 1.127882] VFIO - User Level meta-driver version: 0.3[    1.135376]
> ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver[    1.141924]
> ehci-pci: EHCI PCI platform driver[    1.146429] ehci-platform: EHCI
> generic platform driver[    1.151848] ohci_hcd: USB 1.1 'Open' Host
> Controller (OHCI) Driver[    1.158049] ohci-pci: OHCI PCI platform
> driver[    1.162530] ohci-platform: OHCI generic platform driver[
> 1.168360] usbcore: registered new interface driver usb-storage[
> 1.174444] usbcore: registered new interface driver usbserial_generic[
> 1.180996] usbserial: USB Serial support registered for generic[
> 1.189781] input: 30370000.snvs:snvs-powerkey as
> /devices/platform/soc@0/soc@0:bus@30000000/30370000.snvs/30370000.snvs:sn=
vs-powerkey/input/input0[
> 1.205063] snvs_rtc 30370000.snvs:snvs-rtc-lp: registered as rtc0[
> 1.211353] i2c /dev entries driver[    1.215126] usbcore: registered new
> interface driver i2c-tiny-usb[    1.221581] mxc-mipi-csi2_yav
> 30a70000.mipi_csi1: mipi_csi2_probe[    1.227739] mxc-mipi-csi2_yav
> 30a70000.mipi_csi: Remote device at endpoint@0 XXX found[    1.235677]
> mxc-mipi-csi2_yav 30a70000.mipi_csi1: lanes: 2, name: mxc-mipi-csi2.0[
> 1.243361] mxc-mipi-csi2_yav 30b60000.mipi_csi2: mipi_csi2_probe[
> 1.249505] mxc-mipi-csi2_yav 30b60000.mipi_csi: Remote device at endpoint@=
0
> XXX found[    1.257441] mxc-mipi-csi2_yav 30b60000.mipi_csi2: lanes: 2,
> name: mxc-mipi-csi2.1[    1.265159] mx6s-csi 30a90000.csi1_bridge:
> initialising[    1.270589] CSI: Registered sensor subdevice:
> mxc-mipi-csi2.0[    1.276411] mx6s-csi 30b80000.csi2_bridge:
> initialising[    1.281826] CSI: Registered sensor subdevice:
> mxc-mipi-csi2.1[    1.289998] imx2-wdt 30280000.watchdog: timeout 60 sec
> (nowayout=3D0)[    1.298423] sdhci: Secure Digital Host Controller Interf=
ace
> driver[    1.304616] sdhci: Copyright(c) Pierre Ossman[    1.309175]
> Synopsys Designware Multimedia Card Interface Driver[    1.315843]
> sdhci-pltfm: SDHCI platform and OF driver helper[    1.323883] ledtrig-cp=
u:
> registered to indicate activity on CPUs[    1.330891] caam 30900000.crypt=
o:
> device ID =3D 0x0a16040100000000 (Era 9)[    1.337606] caam 30900000.cryp=
to:
> job rings =3D 3, qi =3D 0[    1.360416] caam algorithms registered in
> /proc/crypto[    1.367539] caam 30900000.crypto: caam pkc algorithms
> registered in /proc/crypto[    1.377087] caam_jr 30901000.jr: registering
> rng-caam[    1.387843] caam-snvs 30370000.caam-snvs: can't get snvs
> clock[    1.393752] caam-snvs 30370000.caam-snvs: violation handlers arme=
d
> - non-secure state[    1.402639] usbcore: registered new interface driver
> usbhid[    1.408224] usbhid: USB HID core driver[    1.413532] No fsl,qma=
n
> node[    1.416435] Freescale USDPAA process driver[    1.420626]
> fsl-usdpaa: no region found[    1.424469] Freescale USDPAA process IRQ
> driver[    1.430987] optee: probing for conduit method from DT.[
> 1.436166] optee: revision 3.2 (6d99b525)[    1.436539] optee: initialized
> driver[    1.445920] usbcore: registered new interface driver
> snd-usb-audio[    1.453063] wm8524-codec audio-codec: Failed to get mute
> line: -517[    1.486304] imx-spdif sound-spdif: snd-soc-dummy-dai <->
> 30810000.spdif mapping ok[    1.493915] imx-spdif sound-spdif: ASoC: no D=
MI
> vendor name![    1.501906] imx-spdif sound-hdmi-arc: snd-soc-dummy-dai <-=
>
> 308a0000.spdif mapping ok[    1.509762] imx-spdif sound-hdmi-arc: ASoC: n=
o
> DMI vendor name![    1.516844] imx-ak4458 sound-ak4458: ASoC: failed to
> init link ak4458: -517[    1.523828] imx-ak4458 sound-ak4458:
> snd_soc_register_card failed (-517)[    1.530748] imx-ak5558 sound-ak5558=
:
> ASoC: failed to init link ak5558: -517[    1.537723] imx-ak5558
> sound-ak5558: snd_soc_register_card failed (-517)[    1.545045] imx-cdnhd=
mi
> sound-hdmi: ASoC: failed to init link imx8 hdmi: -517[    1.552197]
> imx-cdnhdmi sound-hdmi: snd_soc_register_card failed (-517)[    1.559023]
> NET: Registered protocol family 26[    1.564089] NET: Registered protocol
> family 10[    1.569318] Segment Routing with IPv6[    1.573059] NET:
> Registered protocol family 17[    1.577557] 8021q: 802.1Q VLAN Support
> v1.8[    1.581766] lib80211: common routines for IEEE802.11 drivers[
> 1.587538] 9pnet: Installing 9P2000 support[    1.591848] tsn generic
> netlink module v1 init...[    1.596616] Key type dns_resolver
> registered[    1.601386] registered taskstats version 1[    1.605502]
> Loading compiled-in X.509 certificates[    1.633069] GPIO line 157
> (wl-reg-on) hogged as output/high[    1.640962] ov5640_mipi 0-003c: No
> sensor reset pin available[    1.646750] ov5640_mipi 0-003c: 0-003c suppl=
y
> DOVDD not found, using dummy regulator[    1.654559] ov5640_mipi 0-003c:
> 0-003c supply DVDD not found, using dummy regulator[    1.662275]
> ov5640_mipi 0-003c: 0-003c supply AVDD not found, using dummy regulator[
> 1.679749] ov5640_mipi 0-003c: Read reg error: reg=3D300a[    1.685074]
> ov5640_mipi 0-003c: Camera is not found[    1.691643] pfuze100-regulator
> 0-0008: Full layer: 2, Metal layer: 1[    1.698651] pfuze100-regulator
> 0-0008: FAB: 0, FIN: 0[    1.703724] pfuze100-regulator 0-0008: pfuze100
> found.[    1.726433] i2c i2c-0: IMX I2C adapter registered[    1.731962]
> ov5640_mipi 1-003c: No sensor reset pin available[    1.737751] ov5640_mi=
pi
> 1-003c: 1-003c supply DOVDD not found, using dummy regulator[    1.745564=
]
> ov5640_mipi 1-003c: 1-003c supply DVDD not found, using dummy regulator[
> 1.753279] ov5640_mipi 1-003c: 1-003c supply AVDD not found, using dummy
> regulator[    1.806172] random: fast init done[    2.923484]
> mxc-mipi-csi2_yav 30a70000.mipi_csi: Registered sensor subdevice:
> ov5640_mipi 1-003c[    2.933515] ov5640_mipi 1-003c: Camera is found[
> 2.938098] i2c i2c-1: IMX I2C adapter registered[    2.943625] ak4458
> 2-0010: 2-0010 supply DVDD not found, using dummy regulator[    2.950922]
> ak4458 2-0010: 2-0010 supply AVDD not found, using dummy regulator[
> 2.958539] ak4458 2-0012: 2-0012 supply DVDD not found, using dummy
> regulator[    2.965819] ak4458 2-0012: 2-0012 supply AVDD not found, usin=
g
> dummy regulator[    2.973434] ak5558 2-0013: 2-0013 supply DVDD not found=
,
> using dummy regulator[    2.980712] ak5558 2-0013: 2-0013 supply AVDD not
> found, using dummy regulator[    2.988334] ak4458 2-0011: 2-0011 supply
> DVDD not found, using dummy regulator[    2.995613] ak4458 2-0011: 2-0011
> supply AVDD not found, using dummy regulator[    3.002965] i2c i2c-2: IMX
> I2C adapter registered[    3.008171] imx8mq-usb-phy 381f0040.usb-phy:
> 381f0040.usb-phy supply vbus not found, using dummy regulator[    3.01810=
6]
> imx8mq-usb-phy 382f0040.usb-phy: 382f0040.usb-phy supply vbus not found,
> using dummy regulator[    3.029780] imx6q-pcie 33c00000.pcie: 33c00000.pc=
ie
> supply epdev_on not found, using dummy regulator[    3.039413] imx6q-pcie
> 33c00000.pcie: host bridge /soc@0/pcie@33c00000 ranges:[    3.044136] [dr=
m]
> Supports vblank timestamp caching Rev 2 (21.10.2013).[    3.046671]
> imx6q-pcie 33c00000.pcie:   No bus range found for /soc@0/pcie@33c00000,
> using [bus 00-ff][    3.053283] [drm] No driver support for vblank
> timestamp query.[    3.062595] imx6q-pcie 33c00000.pcie:    IO
> 0x27f80000..0x27f8ffff -> 0x00000000[    3.069011] cdns-mhdp-imx
> 32c00000.hdmi: lane-mapping 0xe4[    3.075912] imx6q-pcie 33c00000.pcie:
> MEM 0x20000000..0x27efffff -> 0x20000000[    3.083339] imx-dcss
> 32e00000.display-controller: bound 32c00000.hdmi (ops
> cdns_mhdp_imx_ops)[    3.097656] [drm] Initialized imx-dcss 1.0.0 2019091=
7
> for 32e00000.display-controller on minor 0[    3.132030] cdns-mhdp-imx
> 32c00000.hdmi: 0,ff,ff,ff,ff,ff,ff,0[    3.169065] cdns-mhdp-imx
> 32c00000.hdmi: 0,ff,ff,ff,ff,ff,ff,0[    3.169698] [drm] Mode:
> 1920x1080p148500[    3.195465] [drm] Pixel clock: 148500 KHz, character
> clock: 222750, bpc is 12-bit.[    3.195469] [drm] VCO frequency is 445500=
0
> KHz[    3.272634] [drm] Sink Not Support SCDC[    3.273850] [drm] No vend=
or
> infoframe[    3.370041] Console: switching to colour frame buffer device
> 240x67[    3.437224] imx-dcss 32e00000.display-controller: fb0:
> imx-dcssdrmfb frame buffer device[    3.446394] OF: graph: no port node
> found in /soc@0/usb-phy@381f0040[    3.453792] xhci-hcd xhci-hcd.1.auto:
> xHCI Host Controller[    3.459305] xhci-hcd xhci-hcd.1.auto: new USB bus
> registered, assigned bus number 1[    3.467089] xhci-hcd xhci-hcd.1.auto:
> hcc params 0x0220fe6c hci version 0x110 quirks 0x0000000001010010[
> 3.476536] xhci-hcd xhci-hcd.1.auto: irq 53, io mem 0x38200000[    3.48322=
2]
> hub 1-0:1.0: USB hub found[    3.487007] hub 1-0:1.0: 1 port detected[
> 3.491188] xhci-hcd xhci-hcd.1.auto: xHCI Host Controller[    3.496691]
> xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned bus number 2[
> 3.504364] xhci-hcd xhci-hcd.1.auto: Host supports USB 3.0 SuperSpeed[
> 3.510941] usb usb2: We don't know the algorithms for LPM for this host,
> disabling LPM.[    3.519499] hub 2-0:1.0: USB hub found[    3.523268] hub
> 2-0:1.0: 1 port detected[    3.528323] imx-cpufreq-dt imx-cpufreq-dt: cpu
> speed grade 3 mkt segment 0 supported-hw 0x8 0x1[    3.539043]
> sdhci-esdhc-imx 30b50000.mmc: Got CD GPIO[    3.575349] mmc0: SDHCI
> controller on 30b50000.mmc [30b50000.mmc] using ADMA[    3.585291]
> hantrodec: module inserted. Major =3D 236[    3.591996] debugfs: Director=
y
> '308b0000.sai' with parent 'wm8524-audio' already present![    3.600264]
> asoc-simple-card sound-wm8524: wm8524-hifi <-> 308b0000.sai mapping ok[
> 3.607858] asoc-simple-card sound-wm8524: ASoC: no DMI vendor name![
> 3.617751] ak4458 2-0010: ASoC: failed to probe component -6[    3.623573]
> imx-ak4458 sound-ak4458: ASoC: failed to instantiate card -6[    3.630361=
]
> imx-ak4458 sound-ak4458: snd_soc_register_card failed (-6)[    3.637686]
> ak5558 2-0013: ASoC: failed to probe component -6[    3.643461] imx-ak555=
8
> sound-ak5558: ASoC: failed to instantiate card -6[    3.650216] imx-ak555=
8
> sound-ak5558: snd_soc_register_card failed (-6)[    3.657254] debugfs:
> Directory '30050000.sai' with parent 'imx-audio-hdmi' already present![
> 3.665679] imx-cdnhdmi sound-hdmi: i2s-hifi <-> 30050000.sai mapping ok[
> 3.672416] imx-cdnhdmi sound-hdmi: ASoC: no DMI vendor name![    3.678210]
> debugfs: File 'Capture' in directory 'dapm' already present![    3.698013=
]
> imx6q-pcie 33800000.pcie: 33800000.pcie supply epdev_on not found, using
> dummy regulator[    3.707158] snvs_rtc 30370000.snvs:snvs-rtc-lp: setting
> system clock to 1970-01-01T00:00:02 UTC (2)[    3.707407] imx6q-pcie
> 33800000.pcie: host bridge /soc@0/pcie@33800000 ranges:[    3.716550]
> cfg80211: Loading compiled-in X.509 certificates for regulatory
> database[    3.723475] imx6q-pcie 33800000.pcie:    IO
> 0x1ff80000..0x1ff8ffff -> 0x00000000[    3.733066] cfg80211: Loaded X.509
> cert 'sforshee: 00b28ddf47aef9cea7'[    3.738615] imx6q-pcie
> 33800000.pcie:   MEM 0x18000000..0x1fefffff -> 0x18000000[    3.745173]
> platform regulatory.0: Direct firmware load for regulatory.db failed with
> error -2[    3.752535] clk: Not disabling unused clocks[    3.761138]
> cfg80211: failed to load regulatory.db[    3.770254] ALSA device list:[
> 3.773235]   #0: imx-spdif[    3.776064]   #1: imx-hdmi-arc[    3.779128]
> #2: wm8524-audio[    3.782202]   #3: imx-audio-hdmi[    3.823443] usb 1-1=
:
> new high-speed USB device number 2 using xhci-hcd[    3.828497] mmc0: hos=
t
> does not support reading read-only switch, assuming write-enable[
> 3.840091] mmc0: new high speed SDHC card at address 59b4[    3.846085]
> mmcblk0: mmc0:59b4 SMI   29.5 GiB[    3.855880]  mmcblk0: p1 p2[
> 3.959531] imx6q-pcie 33800000.pcie: Link up[    3.963910] imx6q-pcie
> 33800000.pcie: Link up[    3.968286] imx6q-pcie 33800000.pcie: Link up,
> Gen1[    3.973386] imx6q-pcie 33800000.pcie: PCI host bridge to bus
> 0000:00[    3.979750] pci_bus 0000:00: root bus resource [bus 00-ff][
> 3.985243] pci_bus 0000:00: root bus resource [io  0x10000-0x1ffff] (bus
> address [0x0000-0xffff])[    3.994209] pci_bus 0000:00: root bus resource
> [mem 0x18000000-0x1fefffff][    4.001119] pci 0000:00:00.0: [16c3:abcd]
> type 01 class 0x060400[    4.007146] pci 0000:00:00.0: reg 0x10: [mem
> 0x00000000-0x000fffff][    4.013435] pci 0000:00:00.0: reg 0x38: [mem
> 0x00000000-0x0000ffff pref][    4.020179] pci 0000:00:00.0: supports D1[
> 4.023054] hub 1-1:1.0: USB hub found[    4.024204] pci 0000:00:00.0: PME#
> supported from D0 D1 D3hot D3cold[    4.027986] hub 1-1:1.0: 4 ports
> detected[    4.036217] pci 0000:01:00.0: [168c:003e] type 00 class
> 0x028000[    4.044416] pci 0000:01:00.0: reg 0x10: [mem
> 0x00000000-0x001fffff 64bit][    4.051511] pci 0000:01:00.0: PME# support=
ed
> from D0 D3hot D3cold[    4.069887] pci 0000:00:00.0: BAR 14: assigned [me=
m
> 0x18000000-0x181fffff][    4.076778] pci 0000:00:00.0: BAR 0: assigned [m=
em
> 0x18200000-0x182fffff][    4.083700] pci 0000:00:00.0: BAR 6: assigned [m=
em
> 0x18300000-0x1830ffff pref][    4.090930] pci 0000:01:00.0: BAR 0: assign=
ed
> [mem 0x18000000-0x181fffff 64bit][    4.098269] pci 0000:00:00.0: PCI
> bridge to [bus 01-ff][    4.103502] pci 0000:00:00.0:   bridge window [me=
m
> 0x18000000-0x181fffff][    4.110584] pcieport 0000:00:00.0: PME: Signalin=
g
> with IRQ 232[    4.116617] pcieport 0000:00:00.0: AER: enabled with IRQ
> 232[    4.194272] imx6q-pcie 33c00000.pcie: Phy link never came up[
> 4.199975] imx6q-pcie 33c00000.pcie: failed to initialize host[    4.20591=
6]
> imx6q-pcie 33c00000.pcie: unable to add pcie port.[    4.212755] Waiting
> for root device /dev/mmcblk1p2...[    4.423473] usb 1-1.2: new high-speed
> USB device number 3 using xhci-hcd*
>
> --
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/a46f55d1-2b6f-485e-8eef-7=
1aa5eb08d92o%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/a46f55d1-2b6f-485e-8eef-=
71aa5eb08d92o%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>
> .
>


--

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CAEfxd-8R-m4tpSBhyReThoXOoou740wsyi_%2BUv6tUnwUjDO1%3Dg%40mai=
l.gmail.com.

--00000000000090c47605ad366291
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Please change your bootargs root=C2=A0<b>mmcblk0p2 pe=
r your boot log.</b></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">Vipul Suneja &lt;<a href=3D"mailto:vsuneja63@gmail.com"=
>vsuneja63@gmail.com</a>&gt; =E4=BA=8E2020=E5=B9=B48=E6=9C=8818=E6=97=A5=E5=
=91=A8=E4=BA=8C =E4=B8=8A=E5=8D=882:09=E5=86=99=E9=81=93=EF=BC=9A<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><p>Hi Pe=
ng,</p><p style=3D"min-height:8pt;padding:0px">=C2=A0</p><p>Thanks!</p><p s=
tyle=3D"min-height:8pt;padding:0px">=C2=A0</p><p>I could load NXP 5.4.24 bs=
p image as primary &amp; secondary linux (in non root cell) in <strong>imx8=
mq evk</strong>
 target. I am trying to do the same in a custom freescale image bsp=20
5.4.46. I could successfully add &amp; build jailhouse 0.12 in the=20
image, but the image boot up failed if i choose &quot;run jh_mmcboot&quot; =
in=20
u-boot. Image boots up fine if go normally without jh_mmcboot. Here are=20
the logs below, expecting some pointers from your end:</p><p><br></p><p><b>=
U-Boot SPL 2019.04-lf-5.4.y_v2019.04+g228843c (Jun 29 2020 - 03:06:40 +0000=
)<br>PMIC:=C2=A0 PFUZE100 ID=3D0x10<br>DDRINFO: start DRAM init<br>DDRINFO:=
ddrphy calibration done<br>DDRINFO: ddrmix config done<br>Normal Boot<br>Tr=
ying to boot from MMC2<br><br><br>U-Boot 2019.04-lf-5.4.y_v2019.04+g228843c=
 (Jun 29 2020 - 03:06:40 +0000)<br><br>CPU:=C2=A0=C2=A0 Freescale i.MX8MQ r=
ev2.0 1500 MHz (running at 1000 MHz)<br>CPU:=C2=A0=C2=A0 Commercial tempera=
ture grade (0C to 95C) at 44C<br>Reset cause: POR<br>Model: Freescale i.MX8=
MQ EVK<br>DRAM:=C2=A0 3 GiB<br>TCPC:=C2=A0 Vendor ID [0x1fc9], Product ID [=
0x5110], Addr [I2C0 0x50]<br>MMC:=C2=A0=C2=A0 FSL_SDHC: 0, FSL_SDHC: 1<br>L=
oading Environment from MMC... *** Warning - bad CRC, using default environ=
ment<br><br>No panel detected: default to HDMI<br>Display: HDMI (1280x720)<=
br>In:=C2=A0=C2=A0=C2=A0 serial<br>Out:=C2=A0=C2=A0 serial<br>Err:=C2=A0=C2=
=A0 serial<br><br>=C2=A0BuildInfo:<br>=C2=A0 - ATF 7b3389d<br>=C2=A0 - U-Bo=
ot 2019.04-lf-5.4.y_v2019.04+g228843c<br><br>switch to partitions #0, OK<br=
>mmc1 is current device<br>flash target is MMC:1<br>Net:<br>Warning: ethern=
et@30be0000 using MAC address from ROM<br>eth0: ethernet@30be0000<br>Fastbo=
ot: Normal<br>Normal Boot<br>Hit any key to stop autoboot:=C2=A0 0<br>u-boo=
t=3D&gt; printenv<br>baudrate=3D115200<br>boot_fdt=3Dtry<br>bootcmd=3Dmmc d=
ev ${mmcdev}; if mmc rescan; then if run loadbootscript; then run bootscrip=
t; else if run loadimage; then run mmcboot; else run netboot; fi; fi; else =
booti ${loadaddr} - ${fdt_addr}; fi<br>bootcmd_mfg=3Drun mfgtool_args;if im=
info ${initrd_addr}; then if test ${tee} =3D yes; then bootm ${tee_addr} ${=
initrd_addr} ${fdt_addr}; else booti ${loadaddr} ${initrd_addr} ${fdt_addr}=
; fi; else echo &quot;Run fastboot ...&quot;; fastboot 0; fi;<br>bootdelay=
=3D2<br>bootscript=3Decho Running bootscript from mmc ...; source<br>consol=
e=3Dttymxc0,115200 earlycon=3Dec_imx6q,0x30860000,115200<br>emmc_dev=3D0<br=
>ethaddr=3D00:04:9f:05:a5:9c<br>ethprime=3DFEC<br>fastboot_dev=3Dmmc1<br>fd=
t_addr=3D0x43000000<br>fdt_file=3Dimx8mq-evk.dtb<br>fdt_high=3D0xffffffffff=
ffffff<br>fdtcontroladdr=3Dfd919fe8<br>image=3DImage<br>initrd_addr=3D0x438=
00000<br>initrd_high=3D0xffffffffffffffff<br>jh_clk=3D<br>jh_mmcboot=3Dsete=
nv fdt_file imx8mq-evk-root.dtb; setenv jh_clk clk_ignore_unused; if run lo=
adimage; then run mmcboot; else run jh_netboot; fi;<br>jh_netboot=3Dsetenv =
fdt_file imx8mq-evk-root.dtb; setenv jh_clk clk_ignore_unused; run netboot;=
<br>kboot=3Dbooti<br>loadaddr=3D0x40480000<br>loadbootscript=3Dfatload mmc =
${mmcdev}:${mmcpart} ${loadaddr} ${script};<br>loadfdt=3Dfatload mmc ${mmcd=
ev}:${mmcpart} ${fdt_addr} ${fdt_file}<br>loadimage=3Dfatload mmc ${mmcdev}=
:${mmcpart} ${loadaddr} ${image}<br>mfgtool_args=3Dsetenv bootargs console=
=3D${console},${baudrate} rdinit=3D/linuxrc clk_ignore_unused<br>mmcargs=3D=
setenv bootargs ${jh_clk} console=3D${console} root=3D${mmcroot}<br>mmcauto=
detect=3Dyes<br>mmcboot=3Decho Booting from mmc ...; run mmcargs; if test $=
{boot_fdt} =3D yes || test ${boot_fdt} =3D try; then if run loadfdt; then b=
ooti ${loadaddr} - ${fdt_addr}; else echo WARN: Cannot load the DT; fi; els=
e echo wait for boot; fi;<br>mmcdev=3D1<br>mmcpart=3D1<br>mmcroot=3D/dev/mm=
cblk1p2 rootwait rw<br>netargs=3Dsetenv bootargs ${jh_clk} console=3D${cons=
ole} root=3D/dev/nfs ip=3Ddhcp nfsroot=3D${serverip}:${nfsroot},v3,tcp<br>n=
etboot=3Decho Booting from net ...; run netargs;=C2=A0 if test ${ip_dyn} =
=3D yes; then setenv get_cmd dhcp; else setenv get_cmd tftp; fi; ${get_cmd}=
 ${loadaddr} ${image}; if test ${boot_fdt} =3D yes || test ${boot_fdt} =3D =
try; then if ${get_cmd} ${fdt_addr} ${fdt_file}; then booti ${loadaddr} - $=
{fdt_addr}; else echo WARN: Cannot load the DT; fi; else booti; fi;<br>scri=
pt=3Dboot.scr<br>sd_dev=3D1<br>serial#=3D051a61d6f0609912<br>soc_type=3Dimx=
8mq<br><br>Environment size: 2298/4092 bytes<br>u-boot=3D&gt; run jh_mmcboo=
t<br>26708480 bytes read in 1145 ms (22.2 MiB/s)<br>Booting from mmc ...<br=
>44274 bytes read in 8 ms (5.3 MiB/s)<br>## Flattened Device Tree blob at 4=
3000000<br>=C2=A0=C2=A0 Booting using the fdt blob at 0x43000000<br>=C2=A0=
=C2=A0 Using Device Tree in place at 0000000043000000, end 000000004300dcf1=
<br><br>Starting kernel ...<br><br>[=C2=A0=C2=A0=C2=A0 0.000000] Booting Li=
nux on physical CPU 0x0000000000 [0x410fd034]<br>[=C2=A0=C2=A0=C2=A0 0.0000=
00] Linux version 5.4.46+g5376418 (oe-user@oe-host) (gcc version 9.3.0 (GCC=
)) #1 SMP PREEMPT Mon Jun 29 03:06:40 UTC 2020<br>[=C2=A0=C2=A0=C2=A0 0.000=
000] Machine model: NXP i.MX8MQ EVK<br>[=C2=A0=C2=A0=C2=A0 0.000000] earlyc=
on: ec_imx6q0 at MMIO 0x0000000030860000 (options &#39;115200&#39;)<br>[=C2=
=A0=C2=A0=C2=A0 0.000000] printk: bootconsole [ec_imx6q0] enabled<br>[=C2=
=A0=C2=A0=C2=A0 0.000000] efi: Getting EFI parameters from FDT:<br>[=C2=A0=
=C2=A0=C2=A0 0.000000] efi: UEFI not found.<br>[=C2=A0=C2=A0=C2=A0 0.000000=
] Reserved memory: created CMA memory pool at 0x0000000044000000, size 960 =
MiB<br>[=C2=A0=C2=A0=C2=A0 0.000000] OF: reserved mem: initialized node lin=
ux,cma, compatible id shared-dma-pool<br>[=C2=A0=C2=A0=C2=A0 0.000000] NUMA=
: No NUMA configuration found<br>[=C2=A0=C2=A0=C2=A0 0.000000] NUMA: Faking=
 a node at [mem 0x0000000040000000-0x00000000bfafffff]<br>[=C2=A0=C2=A0=C2=
=A0 0.000000] NUMA: NODE_DATA [mem 0xbf6d0500-0xbf6d1fff]<br>[=C2=A0=C2=A0=
=C2=A0 0.000000] Zone ranges:<br>[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 =
DMA32=C2=A0=C2=A0=C2=A0 [mem 0x0000000040000000-0x00000000bfafffff]<br>[=C2=
=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 Normal=C2=A0=C2=A0 empty<br>[=C2=A0=
=C2=A0=C2=A0 0.000000] Movable zone start for each node<br>[=C2=A0=C2=A0=C2=
=A0 0.000000] Early memory node ranges<br>[=C2=A0=C2=A0=C2=A0 0.000000]=C2=
=A0=C2=A0 node=C2=A0=C2=A0 0: [mem 0x0000000040000000-0x00000000b7ffffff]<b=
r>[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 node=C2=A0=C2=A0 0: [mem 0x0000=
0000b8400000-0x00000000bfafffff]<br>[=C2=A0=C2=A0=C2=A0 0.000000] Zeroed st=
ruct page in unavailable ranges: 256 pages<br>[=C2=A0=C2=A0=C2=A0 0.000000]=
 Initmem setup node 0 [mem 0x0000000040000000-0x00000000bfafffff]<br>[=C2=
=A0=C2=A0=C2=A0 0.000000] psci: probing for conduit method from DT.<br>[=C2=
=A0=C2=A0=C2=A0 0.000000] psci: PSCIv1.1 detected in firmware.<br>[=C2=A0=
=C2=A0=C2=A0 0.000000] psci: Using standard PSCI v0.2 function IDs<br>[=C2=
=A0=C2=A0=C2=A0 0.000000] psci: Trusted OS migration not required<br>[=C2=
=A0=C2=A0=C2=A0 0.000000] psci: SMC Calling Convention v1.1<br>[=C2=A0=C2=
=A0=C2=A0 0.000000] percpu: Embedded 24 pages/cpu s58840 r8192 d31272 u9830=
4<br>[=C2=A0=C2=A0=C2=A0 0.000000] Detected VIPT I-cache on CPU0<br>[=C2=A0=
=C2=A0=C2=A0 0.000000] CPU features: detected: ARM erratum 845719<br>[=C2=
=A0=C2=A0=C2=A0 0.000000] CPU features: detected: GIC system register CPU i=
nterface<br>[=C2=A0=C2=A0=C2=A0 0.000000] Speculative Store Bypass Disable =
mitigation not required<br>[=C2=A0=C2=A0=C2=A0 0.000000] Built 1 zonelists,=
 mobility grouping on.=C2=A0 Total pages: 513812<br>[=C2=A0=C2=A0=C2=A0 0.0=
00000] Policy zone: DMA32<br>[=C2=A0=C2=A0=C2=A0 0.000000] Kernel command l=
ine: clk_ignore_unused console=3Dttymxc0,115200 earlycon=3Dec_imx6q,0x30860=
000,115200 root=3D/dev/mmcblk1p2 rootwait rw<br>[=C2=A0=C2=A0=C2=A0 0.00000=
0] Dentry cache hash table entries: 262144 (order: 9, 2097152 bytes, linear=
)<br>[=C2=A0=C2=A0=C2=A0 0.000000] Inode-cache hash table entries: 131072 (=
order: 8, 1048576 bytes, linear)<br>[=C2=A0=C2=A0=C2=A0 0.000000] mem auto-=
init: stack:off, heap alloc:off, heap free:off<br>[=C2=A0=C2=A0=C2=A0 0.000=
000] Memory: 1037220K/2087936K available (15676K kernel code, 1186K rwdata,=
 6252K rodata, 2880K init, 1012K bss, 67676K reserved, 983040K cma-reserved=
)<br>[=C2=A0=C2=A0=C2=A0 0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObje=
cts=3D0, CPUs=3D4, Nodes=3D1<br>[=C2=A0=C2=A0=C2=A0 0.000000] rcu: Preempti=
ble hierarchical RCU implementation.<br>[=C2=A0=C2=A0=C2=A0 0.000000] rcu:=
=C2=A0=C2=A0=C2=A0=C2=A0 RCU restricting CPUs from NR_CPUS=3D256 to nr_cpu_=
ids=3D4.<br>[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0 Tasks RCU enabled.<br>[=C2=
=A0=C2=A0=C2=A0 0.000000] rcu: RCU calculated value of scheduler-enlistment=
 delay is 25 jiffies.<br>[=C2=A0=C2=A0=C2=A0 0.000000] rcu: Adjusting geome=
try for rcu_fanout_leaf=3D16, nr_cpu_ids=3D4<br>[=C2=A0=C2=A0=C2=A0 0.00000=
0] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0<br>[=C2=A0=C2=A0=C2=A0 0.=
000000] GICv3: GIC: Using split EOI/Deactivate mode<br>[=C2=A0=C2=A0=C2=A0 =
0.000000] GICv3: 128 SPIs implemented<br>[=C2=A0=C2=A0=C2=A0 0.000000] GICv=
3: 0 Extended SPIs implemented<br>[=C2=A0=C2=A0=C2=A0 0.000000] GICv3: Dist=
ributor has no Range Selector support<br>[=C2=A0=C2=A0=C2=A0 0.000000] GICv=
3: 16 PPIs implemented<br>[=C2=A0=C2=A0=C2=A0 0.000000] GICv3: no VLPI supp=
ort, no direct LPI support<br>[=C2=A0=C2=A0=C2=A0 0.000000] GICv3: CPU0: fo=
und redistributor 0 region 0:0x0000000038880000<br>[=C2=A0=C2=A0=C2=A0 0.00=
0000] ITS: No ITS available, not enabling LPIs<br>[=C2=A0=C2=A0=C2=A0 0.000=
000] random: get_random_bytes called from start_kernel+0x2b8/0x44c with crn=
g_init=3D0<br>[=C2=A0=C2=A0=C2=A0 0.000000] arch_timer: cp15 timer(s) runni=
ng at 8.33MHz (phys).<br>[=C2=A0=C2=A0=C2=A0 0.000000] clocksource: arch_sy=
s_counter: mask: 0xffffffffffffff max_cycles: 0x1ec0311ec, max_idle_ns: 440=
795202152 ns<br>[=C2=A0=C2=A0=C2=A0 0.000004] sched_clock: 56 bits at 8MHz,=
 resolution 120ns, wraps every 2199023255541ns<br>[=C2=A0=C2=A0=C2=A0 0.008=
522] Console: colour dummy device 80x25<br>[=C2=A0=C2=A0=C2=A0 0.012540] Ca=
librating delay loop (skipped), value calculated using timer frequency.. 16=
.66 BogoMIPS (lpj=3D33333)<br>[=C2=A0=C2=A0=C2=A0 0.022767] pid_max: defaul=
t: 32768 minimum: 301<br>[=C2=A0=C2=A0=C2=A0 0.027466] LSM: Security Framew=
ork initializing<br>[=C2=A0=C2=A0=C2=A0 0.032057] Smack:=C2=A0 Initializing=
.<br>[=C2=A0=C2=A0=C2=A0 0.035314] Smack:=C2=A0 IPv6 port labeling enabled.=
<br>[=C2=A0=C2=A0=C2=A0 0.039903] Mount-cache hash table entries: 4096 (ord=
er: 3, 32768 bytes, linear)<br>[=C2=A0=C2=A0=C2=A0 0.047278] Mountpoint-cac=
he hash table entries: 4096 (order: 3, 32768 bytes, linear)<br>[=C2=A0=C2=
=A0=C2=A0 0.079192] ASID allocator initialised with 32768 entries<br>[=C2=
=A0=C2=A0=C2=A0 0.087188] rcu: Hierarchical SRCU implementation.<br>[=C2=A0=
=C2=A0=C2=A0 0.096133] EFI services will not be available.<br>[=C2=A0=C2=A0=
=C2=A0 0.103219] smp: Bringing up secondary CPUs ...<br>[=C2=A0=C2=A0=C2=A0=
 0.135392] Detected VIPT I-cache on CPU1<br>[=C2=A0=C2=A0=C2=A0 0.135420] G=
ICv3: CPU1: found redistributor 1 region 0:0x00000000388a0000<br>[=C2=A0=C2=
=A0=C2=A0 0.135444] CPU1: Booted secondary processor 0x0000000001 [0x410fd0=
34]<br>[=C2=A0=C2=A0=C2=A0 0.167418] Detected VIPT I-cache on CPU2<br>[=C2=
=A0=C2=A0=C2=A0 0.167434] GICv3: CPU2: found redistributor 2 region 0:0x000=
00000388c0000<br>[=C2=A0=C2=A0=C2=A0 0.167450] CPU2: Booted secondary proce=
ssor 0x0000000002 [0x410fd034]<br>[=C2=A0=C2=A0=C2=A0 0.199475] Detected VI=
PT I-cache on CPU3<br>[=C2=A0=C2=A0=C2=A0 0.199491] GICv3: CPU3: found redi=
stributor 3 region 0:0x00000000388e0000<br>[=C2=A0=C2=A0=C2=A0 0.199508] CP=
U3: Booted secondary processor 0x0000000003 [0x410fd034]<br>[=C2=A0=C2=A0=
=C2=A0 0.199574] smp: Brought up 1 node, 4 CPUs<br>[=C2=A0=C2=A0=C2=A0 0.25=
3145] SMP: Total of 4 processors activated.<br>[=C2=A0=C2=A0=C2=A0 0.257849=
] CPU features: detected: 32-bit EL0 Support<br>[=C2=A0=C2=A0=C2=A0 0.26300=
5] CPU features: detected: CRC32 instructions<br>[=C2=A0=C2=A0=C2=A0 0.2760=
60] CPU: All CPU(s) started at EL2<br>[=C2=A0=C2=A0=C2=A0 0.277324] alterna=
tives: patching kernel code<br>[=C2=A0=C2=A0=C2=A0 0.283321] devtmpfs: init=
ialized<br>[=C2=A0=C2=A0=C2=A0 0.291775] clocksource: jiffies: mask: 0xffff=
ffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns<br>[=C2=A0=C2=
=A0=C2=A0 0.298700] futex hash table entries: 1024 (order: 4, 65536 bytes, =
linear)<br>[=C2=A0=C2=A0=C2=A0 0.334050] pinctrl core: initialized pinctrl =
subsystem<br>[=C2=A0=C2=A0=C2=A0 0.337229] DMI not present or invalid.<br>[=
=C2=A0=C2=A0=C2=A0 0.340553] NET: Registered protocol family 16<br>[=C2=A0=
=C2=A0=C2=A0 0.357311] DMA: preallocated 256 KiB pool for atomic allocation=
s<br>[=C2=A0=C2=A0=C2=A0 0.360565] audit: initializing netlink subsys (disa=
bled)<br>[=C2=A0=C2=A0=C2=A0 0.366096] audit: type=3D2000 audit(0.316:1): s=
tate=3Dinitialized audit_enabled=3D0 res=3D1<br>[=C2=A0=C2=A0=C2=A0 0.37375=
4] cpuidle: using governor menu<br>[=C2=A0=C2=A0=C2=A0 0.378251] hw-breakpo=
int: found 6 breakpoint and 4 watchpoint registers.<br>[=C2=A0=C2=A0=C2=A0 =
0.385345] Serial: AMBA PL011 UART driver<br>[=C2=A0=C2=A0=C2=A0 0.388621] i=
mx mu driver is registered.<br>[=C2=A0=C2=A0=C2=A0 0.392485] imx rpmsg driv=
er is registered.<br>[=C2=A0=C2=A0=C2=A0 0.400586] imx8mq-pinctrl 30330000.=
iomuxc: initialized IMX pinctrl driver<br>[=C2=A0=C2=A0=C2=A0 0.426581] Hug=
eTLB registered 1.00 GiB page size, pre-allocated 0 pages<br>[=C2=A0=C2=A0=
=C2=A0 0.430457] HugeTLB registered 32.0 MiB page size, pre-allocated 0 pag=
es<br>[=C2=A0=C2=A0=C2=A0 0.437159] HugeTLB registered 2.00 MiB page size, =
pre-allocated 0 pages<br>[=C2=A0=C2=A0=C2=A0 0.443872] HugeTLB registered 6=
4.0 KiB page size, pre-allocated 0 pages<br>[=C2=A0=C2=A0=C2=A0 0.452450] c=
ryptd: max_cpu_qlen set to 1000<br>[=C2=A0=C2=A0=C2=A0 0.460740] ACPI: Inte=
rpreter disabled.<br>[=C2=A0=C2=A0=C2=A0 0.466072] iommu: Default domain ty=
pe: Translated<br>[=C2=A0=C2=A0=C2=A0 0.468237] vgaarb: loaded<br>[=C2=A0=
=C2=A0=C2=A0 0.471117] SCSI subsystem initialized<br>[=C2=A0=C2=A0=C2=A0 0.=
475173] usbcore: registered new interface driver usbfs<br>[=C2=A0=C2=A0=C2=
=A0 0.480083] usbcore: registered new interface driver hub<br>[=C2=A0=C2=A0=
=C2=A0 0.485433] usbcore: registered new device driver usb<br>[=C2=A0=C2=A0=
=C2=A0 0.491493] mc: Linux media interface: v0.10<br>[=C2=A0=C2=A0=C2=A0 0.=
494724] videodev: Linux video capture interface: v2.00<br>[=C2=A0=C2=A0=C2=
=A0 0.500256] pps_core: LinuxPPS API ver. 1 registered<br>[=C2=A0=C2=A0=C2=
=A0 0.505160] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo G=
iometti &lt;<a href=3D"mailto:giometti@linux.it" target=3D"_blank">giometti=
@linux.it</a>&gt;<br>[=C2=A0=C2=A0=C2=A0 0.514325] PTP clock support regist=
ered<br>[=C2=A0=C2=A0=C2=A0 0.518379] EDAC MC: Ver: 3.0.0<br>[=C2=A0=C2=A0=
=C2=A0 0.522183] No BMan portals available!<br>[=C2=A0=C2=A0=C2=A0 0.525459=
] QMan: Allocated lookup table at (____ptrval____), entry count 65537<br>[=
=C2=A0=C2=A0=C2=A0 0.532766] No QMan portals available!<br>[=C2=A0=C2=A0=C2=
=A0 0.536666] No USDPAA memory, no &#39;fsl,usdpaa-mem&#39; in device-tree<=
br>[=C2=A0=C2=A0=C2=A0 0.542598] FPGA manager framework<br>[=C2=A0=C2=A0=C2=
=A0 0.545690] Advanced Linux Sound Architecture Driver Initialized.<br>[=C2=
=A0=C2=A0=C2=A0 0.552115] NetLabel: Initializing<br>[=C2=A0=C2=A0=C2=A0 0.5=
55118] NetLabel:=C2=A0 domain hash size =3D 128<br>[=C2=A0=C2=A0=C2=A0 0.55=
9486] NetLabel:=C2=A0 protocols =3D UNLABELED CIPSOv4 CALIPSO<br>[=C2=A0=C2=
=A0=C2=A0 0.565202] NetLabel:=C2=A0 unlabeled traffic allowed by default<br=
>[=C2=A0=C2=A0=C2=A0 0.571430] clocksource: Switched to clocksource arch_sy=
s_counter<br>[=C2=A0=C2=A0=C2=A0 0.577005] VFS: Disk quotas dquot_6.6.0<br>=
[=C2=A0=C2=A0=C2=A0 0.580819] VFS: Dquot-cache hash table entries: 512 (ord=
er 0, 4096 bytes)<br>[=C2=A0=C2=A0=C2=A0 0.587831] pnp: PnP ACPI: disabled<=
br>[=C2=A0=C2=A0=C2=A0 0.597738] thermal_sys: Registered thermal governor &=
#39;step_wise&#39;<br>[=C2=A0=C2=A0=C2=A0 0.597741] thermal_sys: Registered=
 thermal governor &#39;power_allocator&#39;<br>[=C2=A0=C2=A0=C2=A0 0.601226=
] NET: Registered protocol family 2<br>[=C2=A0=C2=A0=C2=A0 0.612156] tcp_li=
sten_portaddr_hash hash table entries: 1024 (order: 2, 16384 bytes, linear)=
<br>[=C2=A0=C2=A0=C2=A0 0.620396] TCP established hash table entries: 16384=
 (order: 5, 131072 bytes, linear)<br>[=C2=A0=C2=A0=C2=A0 0.628412] TCP bind=
 hash table entries: 16384 (order: 6, 262144 bytes, linear)<br>[=C2=A0=C2=
=A0=C2=A0 0.635849] TCP: Hash tables configured (established 16384 bind 163=
84)<br>[=C2=A0=C2=A0=C2=A0 0.642240] UDP hash table entries: 1024 (order: 3=
, 32768 bytes, linear)<br>[=C2=A0=C2=A0=C2=A0 0.648911] UDP-Lite hash table=
 entries: 1024 (order: 3, 32768 bytes, linear)<br>[=C2=A0=C2=A0=C2=A0 0.656=
160] NET: Registered protocol family 1<br>[=C2=A0=C2=A0=C2=A0 0.660772] RPC=
: Registered named UNIX socket transport module.<br>[=C2=A0=C2=A0=C2=A0 0.6=
66312] RPC: Registered udp transport module.<br>[=C2=A0=C2=A0=C2=A0 0.67101=
2] RPC: Registered tcp transport module.<br>[=C2=A0=C2=A0=C2=A0 0.675722] R=
PC: Registered tcp NFSv4.1 backchannel transport module.<br>[=C2=A0=C2=A0=
=C2=A0 0.682555] PCI: CLS 0 bytes, default 64<br>[=C2=A0=C2=A0=C2=A0 0.6868=
77] hw perfevents: enabled with armv8_cortex_a53 PMU driver, 7 counters ava=
ilable<br>[=C2=A0=C2=A0=C2=A0 0.694656] kvm [1]: IPA Size Limit: 40bits<br>=
[=C2=A0=C2=A0=C2=A0 0.699184] kvm [1]: vgic-v2@31020000<br>[=C2=A0=C2=A0=C2=
=A0 0.702163] kvm [1]: GIC system register CPU interface enabled<br>[=C2=A0=
=C2=A0=C2=A0 0.708049] kvm [1]: vgic interrupt IRQ1<br>[=C2=A0=C2=A0=C2=A0 =
0.712020] kvm [1]: Hyp mode initialized successfully<br>[=C2=A0=C2=A0=C2=A0=
 0.722834] Initialise system trusted keyrings<br>[=C2=A0=C2=A0=C2=A0 0.7245=
41] workingset: timestamp_bits=3D44 max_order=3D19 bucket_order=3D0<br>[=C2=
=A0=C2=A0=C2=A0 0.737258] squashfs: version 4.0 (2009/01/31) Phillip Loughe=
r<br>[=C2=A0=C2=A0=C2=A0 0.740896] NFS: Registering the id_resolver key typ=
e<br>[=C2=A0=C2=A0=C2=A0 0.745333] Key type id_resolver registered<br>[=C2=
=A0=C2=A0=C2=A0 0.749491] Key type id_legacy registered<br>[=C2=A0=C2=A0=C2=
=A0 0.753510] nfs4filelayout_init: NFSv4 File Layout Driver Registering...<=
br>[=C2=A0=C2=A0=C2=A0 0.760234] jffs2: version 2.2. (NAND) =C2=A9 2001-200=
6 Red Hat, Inc.<br>[=C2=A0=C2=A0=C2=A0 0.766703] 9p: Installing v9fs 9p2000=
 file system support<br>[=C2=A0=C2=A0=C2=A0 0.787998] Key type asymmetric r=
egistered<br>[=C2=A0=C2=A0=C2=A0 0.789236] Asymmetric key parser &#39;x509&=
#39; registered<br>[=C2=A0=C2=A0=C2=A0 0.794162] Block layer SCSI generic (=
bsg) driver version 0.4 loaded (major 244)<br>[=C2=A0=C2=A0=C2=A0 0.801543]=
 io scheduler mq-deadline registered<br>[=C2=A0=C2=A0=C2=A0 0.806072] io sc=
heduler kyber registered<br>[=C2=A0=C2=A0=C2=A0 0.814902] EINJ: ACPI disabl=
ed.<br>[=C2=A0=C2=A0=C2=A0 0.823000] imx-sdma 302c0000.sdma: Direct firmwar=
e load for imx/sdma/sdma-imx7d.bin failed with error -2<br>[=C2=A0=C2=A0=C2=
=A0 0.829836] imx-sdma 302c0000.sdma: Direct firmware load for imx/sdma/sdm=
a-imx7d.bin failed with error -2<br>[=C2=A0=C2=A0=C2=A0 0.834079] mxs-dma 3=
3000000.dma-apbh: initialized<br>[=C2=A0=C2=A0=C2=A0 0.839348] imx-sdma 302=
c0000.sdma: external firmware not found, using ROM firmware<br>[=C2=A0=C2=
=A0=C2=A0 0.844225] imx-sdma 30bd0000.sdma: Direct firmware load for imx/sd=
ma/sdma-imx7d.bin failed with error -2<br>[=C2=A0=C2=A0=C2=A0 0.854814] Bus=
 freq driver module loaded<br>[=C2=A0=C2=A0=C2=A0 0.861404] imx-sdma 30bd00=
00.sdma: external firmware not found, using ROM firmware<br>[=C2=A0=C2=A0=
=C2=A0 0.877597] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled<br=
>[=C2=A0=C2=A0=C2=A0 0.883159] 30860000.serial: ttymxc0 at MMIO 0x30860000 =
(irq =3D 30, base_baud =3D 1562500) is a IMX<br>[=C2=A0=C2=A0=C2=A0 0.88988=
6] printk: console [ttymxc0] enabled<br>[=C2=A0=C2=A0=C2=A0 0.889886] print=
k: console [ttymxc0] enabled<br>[=C2=A0=C2=A0=C2=A0 0.898532] printk: bootc=
onsole [ec_imx6q0] disabled<br>[=C2=A0=C2=A0=C2=A0 0.898532] printk: bootco=
nsole [ec_imx6q0] disabled<br>[=C2=A0=C2=A0=C2=A0 0.908931] 30880000.serial=
: ttymxc2 at MMIO 0x30880000 (irq =3D 31, base_baud =3D 5000000) is a IMX<b=
r>[=C2=A0=C2=A0=C2=A0 0.928199] imx-dcss 32e00000.display-controller: ctxld=
: can&#39;t get irq number<br>[=C2=A0=C2=A0=C2=A0 0.935434] imx-dcss 32e000=
00.display-controller: submodules initialization failed<br>[=C2=A0=C2=A0=C2=
=A0 0.953837] loop: module loaded<br>[=C2=A0=C2=A0=C2=A0 0.959117] imx ahci=
 driver is registered.<br>[=C2=A0=C2=A0=C2=A0 0.966058] spi-nor spi3.0: n25=
q256a (32768 Kbytes)<br>[=C2=A0=C2=A0=C2=A0 0.977852] libphy: Fixed MDIO Bu=
s: probed<br>[=C2=A0=C2=A0=C2=A0 0.982771] tun: Universal TUN/TAP device dr=
iver, 1.6<br>[=C2=A0=C2=A0=C2=A0 0.988585] thunder_xcv, ver 1.0<br>[=C2=A0=
=C2=A0=C2=A0 0.991857] thunder_bgx, ver 1.0<br>[=C2=A0=C2=A0=C2=A0 0.995114=
] nicpf, ver 1.0<br>[=C2=A0=C2=A0=C2=A0 0.998573] pps pps0: new PPS source =
ptp0<br>[=C2=A0=C2=A0=C2=A0 1.008325] libphy: fec_enet_mii_bus: probed<br>[=
=C2=A0=C2=A0=C2=A0 1.013751] fec 30be0000.ethernet eth0: registered PHC dev=
ice 0<br>[=C2=A0=C2=A0=C2=A0 1.020325] Freescale FM module, FMD API version=
 21.1.0<br>[=C2=A0=C2=A0=C2=A0 1.025834] Freescale FM Ports module<br>[=C2=
=A0=C2=A0=C2=A0 1.029506] fsl_mac: fsl_mac: FSL FMan MAC API based driver<b=
r>[=C2=A0=C2=A0=C2=A0 1.035250] fsl_dpa: FSL DPAA Ethernet driver<br>[=C2=
=A0=C2=A0=C2=A0 1.039728] fsl_advanced: FSL DPAA Advanced drivers:<br>[=C2=
=A0=C2=A0=C2=A0 1.044701] fsl_proxy: FSL DPAA Proxy initialization driver<b=
r>[=C2=A0=C2=A0=C2=A0 1.050388] fsl_oh: FSL FMan Offline Parsing port drive=
r<br>[=C2=A0=C2=A0=C2=A0 1.056656] hclge is initializing<br>[=C2=A0=C2=A0=
=C2=A0 1.059982] hns3: Hisilicon Ethernet Network Driver for Hip08 Family -=
 version<br>[=C2=A0=C2=A0=C2=A0 1.067209] hns3: Copyright (c) 2017 Huawei C=
orporation.<br>[=C2=A0=C2=A0=C2=A0 1.072568] e1000: Intel(R) PRO/1000 Netwo=
rk Driver - version 7.3.21-k8-NAPI<br>[=C2=A0=C2=A0=C2=A0 1.079623] e1000: =
Copyright (c) 1999-2006 Intel Corporation.<br>[=C2=A0=C2=A0=C2=A0 1.085406]=
 e1000e: Intel(R) PRO/1000 Network Driver - 3.2.6-k<br>[=C2=A0=C2=A0=C2=A0 =
1.091244] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.<br>[=C2=A0=C2=
=A0=C2=A0 1.097209] igb: Intel(R) Gigabit Ethernet Network Driver - version=
 5.6.0-k<br>[=C2=A0=C2=A0=C2=A0 1.104182] igb: Copyright (c) 2007-2014 Inte=
l Corporation.<br>[=C2=A0=C2=A0=C2=A0 1.109793] igbvf: Intel(R) Gigabit Vir=
tual Function Network Driver - version 2.4.0-k<br>[=C2=A0=C2=A0=C2=A0 1.117=
629] igbvf: Copyright (c) 2009 - 2012 Intel Corporation.<br>[=C2=A0=C2=A0=
=C2=A0 1.123712] sky2: driver version 1.30<br>[=C2=A0=C2=A0=C2=A0 1.127882]=
 VFIO - User Level meta-driver version: 0.3<br>[=C2=A0=C2=A0=C2=A0 1.135376=
] ehci_hcd: USB 2.0 &#39;Enhanced&#39; Host Controller (EHCI) Driver<br>[=
=C2=A0=C2=A0=C2=A0 1.141924] ehci-pci: EHCI PCI platform driver<br>[=C2=A0=
=C2=A0=C2=A0 1.146429] ehci-platform: EHCI generic platform driver<br>[=C2=
=A0=C2=A0=C2=A0 1.151848] ohci_hcd: USB 1.1 &#39;Open&#39; Host Controller =
(OHCI) Driver<br>[=C2=A0=C2=A0=C2=A0 1.158049] ohci-pci: OHCI PCI platform =
driver<br>[=C2=A0=C2=A0=C2=A0 1.162530] ohci-platform: OHCI generic platfor=
m driver<br>[=C2=A0=C2=A0=C2=A0 1.168360] usbcore: registered new interface=
 driver usb-storage<br>[=C2=A0=C2=A0=C2=A0 1.174444] usbcore: registered ne=
w interface driver usbserial_generic<br>[=C2=A0=C2=A0=C2=A0 1.180996] usbse=
rial: USB Serial support registered for generic<br>[=C2=A0=C2=A0=C2=A0 1.18=
9781] input: 30370000.snvs:snvs-powerkey as /devices/platform/soc@0/soc@0:b=
us@30000000/30370000.snvs/30370000.snvs:snvs-powerkey/input/input0<br>[=C2=
=A0=C2=A0=C2=A0 1.205063] snvs_rtc 30370000.snvs:snvs-rtc-lp: registered as=
 rtc0<br>[=C2=A0=C2=A0=C2=A0 1.211353] i2c /dev entries driver<br>[=C2=A0=
=C2=A0=C2=A0 1.215126] usbcore: registered new interface driver i2c-tiny-us=
b<br>[=C2=A0=C2=A0=C2=A0 1.221581] mxc-mipi-csi2_yav 30a70000.mipi_csi1: mi=
pi_csi2_probe<br>[=C2=A0=C2=A0=C2=A0 1.227739] mxc-mipi-csi2_yav 30a70000.m=
ipi_csi: Remote device at endpoint@0 XXX found<br>[=C2=A0=C2=A0=C2=A0 1.235=
677] mxc-mipi-csi2_yav 30a70000.mipi_csi1: lanes: 2, name: mxc-mipi-csi2.0<=
br>[=C2=A0=C2=A0=C2=A0 1.243361] mxc-mipi-csi2_yav 30b60000.mipi_csi2: mipi=
_csi2_probe<br>[=C2=A0=C2=A0=C2=A0 1.249505] mxc-mipi-csi2_yav 30b60000.mip=
i_csi: Remote device at endpoint@0 XXX found<br>[=C2=A0=C2=A0=C2=A0 1.25744=
1] mxc-mipi-csi2_yav 30b60000.mipi_csi2: lanes: 2, name: mxc-mipi-csi2.1<br=
>[=C2=A0=C2=A0=C2=A0 1.265159] mx6s-csi 30a90000.csi1_bridge: initialising<=
br>[=C2=A0=C2=A0=C2=A0 1.270589] CSI: Registered sensor subdevice: mxc-mipi=
-csi2.0<br>[=C2=A0=C2=A0=C2=A0 1.276411] mx6s-csi 30b80000.csi2_bridge: ini=
tialising<br>[=C2=A0=C2=A0=C2=A0 1.281826] CSI: Registered sensor subdevice=
: mxc-mipi-csi2.1<br>[=C2=A0=C2=A0=C2=A0 1.289998] imx2-wdt 30280000.watchd=
og: timeout 60 sec (nowayout=3D0)<br>[=C2=A0=C2=A0=C2=A0 1.298423] sdhci: S=
ecure Digital Host Controller Interface driver<br>[=C2=A0=C2=A0=C2=A0 1.304=
616] sdhci: Copyright(c) Pierre Ossman<br>[=C2=A0=C2=A0=C2=A0 1.309175] Syn=
opsys Designware Multimedia Card Interface Driver<br>[=C2=A0=C2=A0=C2=A0 1.=
315843] sdhci-pltfm: SDHCI platform and OF driver helper<br>[=C2=A0=C2=A0=
=C2=A0 1.323883] ledtrig-cpu: registered to indicate activity on CPUs<br>[=
=C2=A0=C2=A0=C2=A0 1.330891] caam 30900000.crypto: device ID =3D 0x0a160401=
00000000 (Era 9)<br>[=C2=A0=C2=A0=C2=A0 1.337606] caam 30900000.crypto: job=
 rings =3D 3, qi =3D 0<br>[=C2=A0=C2=A0=C2=A0 1.360416] caam algorithms reg=
istered in /proc/crypto<br>[=C2=A0=C2=A0=C2=A0 1.367539] caam 30900000.cryp=
to: caam pkc algorithms registered in /proc/crypto<br>[=C2=A0=C2=A0=C2=A0 1=
.377087] caam_jr 30901000.jr: registering rng-caam<br>[=C2=A0=C2=A0=C2=A0 1=
.387843] caam-snvs 30370000.caam-snvs: can&#39;t get snvs clock<br>[=C2=A0=
=C2=A0=C2=A0 1.393752] caam-snvs 30370000.caam-snvs: violation handlers arm=
ed - non-secure state<br>[=C2=A0=C2=A0=C2=A0 1.402639] usbcore: registered =
new interface driver usbhid<br>[=C2=A0=C2=A0=C2=A0 1.408224] usbhid: USB HI=
D core driver<br>[=C2=A0=C2=A0=C2=A0 1.413532] No fsl,qman node<br>[=C2=A0=
=C2=A0=C2=A0 1.416435] Freescale USDPAA process driver<br>[=C2=A0=C2=A0=C2=
=A0 1.420626] fsl-usdpaa: no region found<br>[=C2=A0=C2=A0=C2=A0 1.424469] =
Freescale USDPAA process IRQ driver<br>[=C2=A0=C2=A0=C2=A0 1.430987] optee:=
 probing for conduit method from DT.<br>[=C2=A0=C2=A0=C2=A0 1.436166] optee=
: revision 3.2 (6d99b525)<br>[=C2=A0=C2=A0=C2=A0 1.436539] optee: initializ=
ed driver<br>[=C2=A0=C2=A0=C2=A0 1.445920] usbcore: registered new interfac=
e driver snd-usb-audio<br>[=C2=A0=C2=A0=C2=A0 1.453063] wm8524-codec audio-=
codec: Failed to get mute line: -517<br>[=C2=A0=C2=A0=C2=A0 1.486304] imx-s=
pdif sound-spdif: snd-soc-dummy-dai &lt;-&gt; 30810000.spdif mapping ok<br>=
[=C2=A0=C2=A0=C2=A0 1.493915] imx-spdif sound-spdif: ASoC: no DMI vendor na=
me!<br>[=C2=A0=C2=A0=C2=A0 1.501906] imx-spdif sound-hdmi-arc: snd-soc-dumm=
y-dai &lt;-&gt; 308a0000.spdif mapping ok<br>[=C2=A0=C2=A0=C2=A0 1.509762] =
imx-spdif sound-hdmi-arc: ASoC: no DMI vendor name!<br>[=C2=A0=C2=A0=C2=A0 =
1.516844] imx-ak4458 sound-ak4458: ASoC: failed to init link ak4458: -517<b=
r>[=C2=A0=C2=A0=C2=A0 1.523828] imx-ak4458 sound-ak4458: snd_soc_register_c=
ard failed (-517)<br>[=C2=A0=C2=A0=C2=A0 1.530748] imx-ak5558 sound-ak5558:=
 ASoC: failed to init link ak5558: -517<br>[=C2=A0=C2=A0=C2=A0 1.537723] im=
x-ak5558 sound-ak5558: snd_soc_register_card failed (-517)<br>[=C2=A0=C2=A0=
=C2=A0 1.545045] imx-cdnhdmi sound-hdmi: ASoC: failed to init link imx8 hdm=
i: -517<br>[=C2=A0=C2=A0=C2=A0 1.552197] imx-cdnhdmi sound-hdmi: snd_soc_re=
gister_card failed (-517)<br>[=C2=A0=C2=A0=C2=A0 1.559023] NET: Registered =
protocol family 26<br>[=C2=A0=C2=A0=C2=A0 1.564089] NET: Registered protoco=
l family 10<br>[=C2=A0=C2=A0=C2=A0 1.569318] Segment Routing with IPv6<br>[=
=C2=A0=C2=A0=C2=A0 1.573059] NET: Registered protocol family 17<br>[=C2=A0=
=C2=A0=C2=A0 1.577557] 8021q: 802.1Q VLAN Support v1.8<br>[=C2=A0=C2=A0=C2=
=A0 1.581766] lib80211: common routines for IEEE802.11 drivers<br>[=C2=A0=
=C2=A0=C2=A0 1.587538] 9pnet: Installing 9P2000 support<br>[=C2=A0=C2=A0=C2=
=A0 1.591848] tsn generic netlink module v1 init...<br>[=C2=A0=C2=A0=C2=A0 =
1.596616] Key type dns_resolver registered<br>[=C2=A0=C2=A0=C2=A0 1.601386]=
 registered taskstats version 1<br>[=C2=A0=C2=A0=C2=A0 1.605502] Loading co=
mpiled-in X.509 certificates<br>[=C2=A0=C2=A0=C2=A0 1.633069] GPIO line 157=
 (wl-reg-on) hogged as output/high<br>[=C2=A0=C2=A0=C2=A0 1.640962] ov5640_=
mipi 0-003c: No sensor reset pin available<br>[=C2=A0=C2=A0=C2=A0 1.646750]=
 ov5640_mipi 0-003c: 0-003c supply DOVDD not found, using dummy regulator<b=
r>[=C2=A0=C2=A0=C2=A0 1.654559] ov5640_mipi 0-003c: 0-003c supply DVDD not =
found, using dummy regulator<br>[=C2=A0=C2=A0=C2=A0 1.662275] ov5640_mipi 0=
-003c: 0-003c supply AVDD not found, using dummy regulator<br>[=C2=A0=C2=A0=
=C2=A0 1.679749] ov5640_mipi 0-003c: Read reg error: reg=3D300a<br>[=C2=A0=
=C2=A0=C2=A0 1.685074] ov5640_mipi 0-003c: Camera is not found<br>[=C2=A0=
=C2=A0=C2=A0 1.691643] pfuze100-regulator 0-0008: Full layer: 2, Metal laye=
r: 1<br>[=C2=A0=C2=A0=C2=A0 1.698651] pfuze100-regulator 0-0008: FAB: 0, FI=
N: 0<br>[=C2=A0=C2=A0=C2=A0 1.703724] pfuze100-regulator 0-0008: pfuze100 f=
ound.<br>[=C2=A0=C2=A0=C2=A0 1.726433] i2c i2c-0: IMX I2C adapter registere=
d<br>[=C2=A0=C2=A0=C2=A0 1.731962] ov5640_mipi 1-003c: No sensor reset pin =
available<br>[=C2=A0=C2=A0=C2=A0 1.737751] ov5640_mipi 1-003c: 1-003c suppl=
y DOVDD not found, using dummy regulator<br>[=C2=A0=C2=A0=C2=A0 1.745564] o=
v5640_mipi 1-003c: 1-003c supply DVDD not found, using dummy regulator<br>[=
=C2=A0=C2=A0=C2=A0 1.753279] ov5640_mipi 1-003c: 1-003c supply AVDD not fou=
nd, using dummy regulator<br>[=C2=A0=C2=A0=C2=A0 1.806172] random: fast ini=
t done<br>[=C2=A0=C2=A0=C2=A0 2.923484] mxc-mipi-csi2_yav 30a70000.mipi_csi=
: Registered sensor subdevice: ov5640_mipi 1-003c<br>[=C2=A0=C2=A0=C2=A0 2.=
933515] ov5640_mipi 1-003c: Camera is found<br>[=C2=A0=C2=A0=C2=A0 2.938098=
] i2c i2c-1: IMX I2C adapter registered<br>[=C2=A0=C2=A0=C2=A0 2.943625] ak=
4458 2-0010: 2-0010 supply DVDD not found, using dummy regulator<br>[=C2=A0=
=C2=A0=C2=A0 2.950922] ak4458 2-0010: 2-0010 supply AVDD not found, using d=
ummy regulator<br>[=C2=A0=C2=A0=C2=A0 2.958539] ak4458 2-0012: 2-0012 suppl=
y DVDD not found, using dummy regulator<br>[=C2=A0=C2=A0=C2=A0 2.965819] ak=
4458 2-0012: 2-0012 supply AVDD not found, using dummy regulator<br>[=C2=A0=
=C2=A0=C2=A0 2.973434] ak5558 2-0013: 2-0013 supply DVDD not found, using d=
ummy regulator<br>[=C2=A0=C2=A0=C2=A0 2.980712] ak5558 2-0013: 2-0013 suppl=
y AVDD not found, using dummy regulator<br>[=C2=A0=C2=A0=C2=A0 2.988334] ak=
4458 2-0011: 2-0011 supply DVDD not found, using dummy regulator<br>[=C2=A0=
=C2=A0=C2=A0 2.995613] ak4458 2-0011: 2-0011 supply AVDD not found, using d=
ummy regulator<br>[=C2=A0=C2=A0=C2=A0 3.002965] i2c i2c-2: IMX I2C adapter =
registered<br>[=C2=A0=C2=A0=C2=A0 3.008171] imx8mq-usb-phy 381f0040.usb-phy=
: 381f0040.usb-phy supply vbus not found, using dummy regulator<br>[=C2=A0=
=C2=A0=C2=A0 3.018106] imx8mq-usb-phy 382f0040.usb-phy: 382f0040.usb-phy su=
pply vbus not found, using dummy regulator<br>[=C2=A0=C2=A0=C2=A0 3.029780]=
 imx6q-pcie 33c00000.pcie: 33c00000.pcie supply epdev_on not found, using d=
ummy regulator<br>[=C2=A0=C2=A0=C2=A0 3.039413] imx6q-pcie 33c00000.pcie: h=
ost bridge /soc@0/pcie@33c00000 ranges:<br>[=C2=A0=C2=A0=C2=A0 3.044136] [d=
rm] Supports vblank timestamp caching Rev 2 (21.10.2013).<br>[=C2=A0=C2=A0=
=C2=A0 3.046671] imx6q-pcie 33c00000.pcie:=C2=A0=C2=A0 No bus range found f=
or /soc@0/pcie@33c00000, using [bus 00-ff]<br>[=C2=A0=C2=A0=C2=A0 3.053283]=
 [drm] No driver support for vblank timestamp query.<br>[=C2=A0=C2=A0=C2=A0=
 3.062595] imx6q-pcie 33c00000.pcie:=C2=A0=C2=A0=C2=A0 IO 0x27f80000..0x27f=
8ffff -&gt; 0x00000000<br>[=C2=A0=C2=A0=C2=A0 3.069011] cdns-mhdp-imx 32c00=
000.hdmi: lane-mapping 0xe4<br>[=C2=A0=C2=A0=C2=A0 3.075912] imx6q-pcie 33c=
00000.pcie:=C2=A0=C2=A0 MEM 0x20000000..0x27efffff -&gt; 0x20000000<br>[=C2=
=A0=C2=A0=C2=A0 3.083339] imx-dcss 32e00000.display-controller: bound 32c00=
000.hdmi (ops cdns_mhdp_imx_ops)<br>[=C2=A0=C2=A0=C2=A0 3.097656] [drm] Ini=
tialized imx-dcss 1.0.0 20190917 for 32e00000.display-controller on minor 0=
<br>[=C2=A0=C2=A0=C2=A0 3.132030] cdns-mhdp-imx 32c00000.hdmi: 0,ff,ff,ff,f=
f,ff,ff,0<br>[=C2=A0=C2=A0=C2=A0 3.169065] cdns-mhdp-imx 32c00000.hdmi: 0,f=
f,ff,ff,ff,ff,ff,0<br>[=C2=A0=C2=A0=C2=A0 3.169698] [drm] Mode: 1920x1080p1=
48500<br>[=C2=A0=C2=A0=C2=A0 3.195465] [drm] Pixel clock: 148500 KHz, chara=
cter clock: 222750, bpc is 12-bit.<br>[=C2=A0=C2=A0=C2=A0 3.195469] [drm] V=
CO frequency is 4455000 KHz<br>[=C2=A0=C2=A0=C2=A0 3.272634] [drm] Sink Not=
 Support SCDC<br>[=C2=A0=C2=A0=C2=A0 3.273850] [drm] No vendor infoframe<br=
>[=C2=A0=C2=A0=C2=A0 3.370041] Console: switching to colour frame buffer de=
vice 240x67<br>[=C2=A0=C2=A0=C2=A0 3.437224] imx-dcss 32e00000.display-cont=
roller: fb0: imx-dcssdrmfb frame buffer device<br>[=C2=A0=C2=A0=C2=A0 3.446=
394] OF: graph: no port node found in /soc@0/usb-phy@381f0040<br>[=C2=A0=C2=
=A0=C2=A0 3.453792] xhci-hcd xhci-hcd.1.auto: xHCI Host Controller<br>[=C2=
=A0=C2=A0=C2=A0 3.459305] xhci-hcd xhci-hcd.1.auto: new USB bus registered,=
 assigned bus number 1<br>[=C2=A0=C2=A0=C2=A0 3.467089] xhci-hcd xhci-hcd.1=
.auto: hcc params 0x0220fe6c hci version 0x110 quirks 0x0000000001010010<br=
>[=C2=A0=C2=A0=C2=A0 3.476536] xhci-hcd xhci-hcd.1.auto: irq 53, io mem 0x3=
8200000<br>[=C2=A0=C2=A0=C2=A0 3.483222] hub 1-0:1.0: USB hub found<br>[=C2=
=A0=C2=A0=C2=A0 3.487007] hub 1-0:1.0: 1 port detected<br>[=C2=A0=C2=A0=C2=
=A0 3.491188] xhci-hcd xhci-hcd.1.auto: xHCI Host Controller<br>[=C2=A0=C2=
=A0=C2=A0 3.496691] xhci-hcd xhci-hcd.1.auto: new USB bus registered, assig=
ned bus number 2<br>[=C2=A0=C2=A0=C2=A0 3.504364] xhci-hcd xhci-hcd.1.auto:=
 Host supports USB 3.0 SuperSpeed<br>[=C2=A0=C2=A0=C2=A0 3.510941] usb usb2=
: We don&#39;t know the algorithms for LPM for this host, disabling LPM.<br=
>[=C2=A0=C2=A0=C2=A0 3.519499] hub 2-0:1.0: USB hub found<br>[=C2=A0=C2=A0=
=C2=A0 3.523268] hub 2-0:1.0: 1 port detected<br>[=C2=A0=C2=A0=C2=A0 3.5283=
23] imx-cpufreq-dt imx-cpufreq-dt: cpu speed grade 3 mkt segment 0 supporte=
d-hw 0x8 0x1<br>[=C2=A0=C2=A0=C2=A0 3.539043] sdhci-esdhc-imx 30b50000.mmc:=
 Got CD GPIO<br>[=C2=A0=C2=A0=C2=A0 3.575349] mmc0: SDHCI controller on 30b=
50000.mmc [30b50000.mmc] using ADMA<br>[=C2=A0=C2=A0=C2=A0 3.585291] hantro=
dec: module inserted. Major =3D 236<br>[=C2=A0=C2=A0=C2=A0 3.591996] debugf=
s: Directory &#39;308b0000.sai&#39; with parent &#39;wm8524-audio&#39; alre=
ady present!<br>[=C2=A0=C2=A0=C2=A0 3.600264] asoc-simple-card sound-wm8524=
: wm8524-hifi &lt;-&gt; 308b0000.sai mapping ok<br>[=C2=A0=C2=A0=C2=A0 3.60=
7858] asoc-simple-card sound-wm8524: ASoC: no DMI vendor name!<br>[=C2=A0=
=C2=A0=C2=A0 3.617751] ak4458 2-0010: ASoC: failed to probe component -6<br=
>[=C2=A0=C2=A0=C2=A0 3.623573] imx-ak4458 sound-ak4458: ASoC: failed to ins=
tantiate card -6<br>[=C2=A0=C2=A0=C2=A0 3.630361] imx-ak4458 sound-ak4458: =
snd_soc_register_card failed (-6)<br>[=C2=A0=C2=A0=C2=A0 3.637686] ak5558 2=
-0013: ASoC: failed to probe component -6<br>[=C2=A0=C2=A0=C2=A0 3.643461] =
imx-ak5558 sound-ak5558: ASoC: failed to instantiate card -6<br>[=C2=A0=C2=
=A0=C2=A0 3.650216] imx-ak5558 sound-ak5558: snd_soc_register_card failed (=
-6)<br>[=C2=A0=C2=A0=C2=A0 3.657254] debugfs: Directory &#39;30050000.sai&#=
39; with parent &#39;imx-audio-hdmi&#39; already present!<br>[=C2=A0=C2=A0=
=C2=A0 3.665679] imx-cdnhdmi sound-hdmi: i2s-hifi &lt;-&gt; 30050000.sai ma=
pping ok<br>[=C2=A0=C2=A0=C2=A0 3.672416] imx-cdnhdmi sound-hdmi: ASoC: no =
DMI vendor name!<br>[=C2=A0=C2=A0=C2=A0 3.678210] debugfs: File &#39;Captur=
e&#39; in directory &#39;dapm&#39; already present!<br>[=C2=A0=C2=A0=C2=A0 =
3.698013] imx6q-pcie 33800000.pcie: 33800000.pcie supply epdev_on not found=
, using dummy regulator<br>[=C2=A0=C2=A0=C2=A0 3.707158] snvs_rtc 30370000.=
snvs:snvs-rtc-lp: setting system clock to 1970-01-01T00:00:02 UTC (2)<br>[=
=C2=A0=C2=A0=C2=A0 3.707407] imx6q-pcie 33800000.pcie: host bridge /soc@0/p=
cie@33800000 ranges:<br>[=C2=A0=C2=A0=C2=A0 3.716550] cfg80211: Loading com=
piled-in X.509 certificates for regulatory database<br>[=C2=A0=C2=A0=C2=A0 =
3.723475] imx6q-pcie 33800000.pcie:=C2=A0=C2=A0=C2=A0 IO 0x1ff80000..0x1ff8=
ffff -&gt; 0x00000000<br>[=C2=A0=C2=A0=C2=A0 3.733066] cfg80211: Loaded X.5=
09 cert &#39;sforshee: 00b28ddf47aef9cea7&#39;<br>[=C2=A0=C2=A0=C2=A0 3.738=
615] imx6q-pcie 33800000.pcie:=C2=A0=C2=A0 MEM 0x18000000..0x1fefffff -&gt;=
 0x18000000<br>[=C2=A0=C2=A0=C2=A0 3.745173] platform regulatory.0: Direct =
firmware load for regulatory.db failed with error -2<br>[=C2=A0=C2=A0=C2=A0=
 3.752535] clk: Not disabling unused clocks<br>[=C2=A0=C2=A0=C2=A0 3.761138=
] cfg80211: failed to load regulatory.db<br>[=C2=A0=C2=A0=C2=A0 3.770254] A=
LSA device list:<br>[=C2=A0=C2=A0=C2=A0 3.773235]=C2=A0=C2=A0 #0: imx-spdif=
<br>[=C2=A0=C2=A0=C2=A0 3.776064]=C2=A0=C2=A0 #1: imx-hdmi-arc<br>[=C2=A0=
=C2=A0=C2=A0 3.779128]=C2=A0=C2=A0 #2: wm8524-audio<br>[=C2=A0=C2=A0=C2=A0 =
3.782202]=C2=A0=C2=A0 #3: imx-audio-hdmi<br>[=C2=A0=C2=A0=C2=A0 3.823443] u=
sb 1-1: new high-speed USB device number 2 using xhci-hcd<br>[=C2=A0=C2=A0=
=C2=A0 3.828497] mmc0: host does not support reading read-only switch, assu=
ming write-enable<br>[=C2=A0=C2=A0=C2=A0 3.840091] mmc0: new high speed SDH=
C card at address 59b4<br>[=C2=A0=C2=A0=C2=A0 3.846085] mmcblk0: mmc0:59b4 =
SMI=C2=A0=C2=A0 29.5 GiB<br>[=C2=A0=C2=A0=C2=A0 3.855880]=C2=A0 mmcblk0: p1=
 p2<br>[=C2=A0=C2=A0=C2=A0 3.959531] imx6q-pcie 33800000.pcie: Link up<br>[=
=C2=A0=C2=A0=C2=A0 3.963910] imx6q-pcie 33800000.pcie: Link up<br>[=C2=A0=
=C2=A0=C2=A0 3.968286] imx6q-pcie 33800000.pcie: Link up, Gen1<br>[=C2=A0=
=C2=A0=C2=A0 3.973386] imx6q-pcie 33800000.pcie: PCI host bridge to bus 000=
0:00<br>[=C2=A0=C2=A0=C2=A0 3.979750] pci_bus 0000:00: root bus resource [b=
us 00-ff]<br>[=C2=A0=C2=A0=C2=A0 3.985243] pci_bus 0000:00: root bus resour=
ce [io=C2=A0 0x10000-0x1ffff] (bus address [0x0000-0xffff])<br>[=C2=A0=C2=
=A0=C2=A0 3.994209] pci_bus 0000:00: root bus resource [mem 0x18000000-0x1f=
efffff]<br>[=C2=A0=C2=A0=C2=A0 4.001119] pci 0000:00:00.0: [16c3:abcd] type=
 01 class 0x060400<br>[=C2=A0=C2=A0=C2=A0 4.007146] pci 0000:00:00.0: reg 0=
x10: [mem 0x00000000-0x000fffff]<br>[=C2=A0=C2=A0=C2=A0 4.013435] pci 0000:=
00:00.0: reg 0x38: [mem 0x00000000-0x0000ffff pref]<br>[=C2=A0=C2=A0=C2=A0 =
4.020179] pci 0000:00:00.0: supports D1<br>[=C2=A0=C2=A0=C2=A0 4.023054] hu=
b 1-1:1.0: USB hub found<br>[=C2=A0=C2=A0=C2=A0 4.024204] pci 0000:00:00.0:=
 PME# supported from D0 D1 D3hot D3cold<br>[=C2=A0=C2=A0=C2=A0 4.027986] hu=
b 1-1:1.0: 4 ports detected<br>[=C2=A0=C2=A0=C2=A0 4.036217] pci 0000:01:00=
.0: [168c:003e] type 00 class 0x028000<br>[=C2=A0=C2=A0=C2=A0 4.044416] pci=
 0000:01:00.0: reg 0x10: [mem 0x00000000-0x001fffff 64bit]<br>[=C2=A0=C2=A0=
=C2=A0 4.051511] pci 0000:01:00.0: PME# supported from D0 D3hot D3cold<br>[=
=C2=A0=C2=A0=C2=A0 4.069887] pci 0000:00:00.0: BAR 14: assigned [mem 0x1800=
0000-0x181fffff]<br>[=C2=A0=C2=A0=C2=A0 4.076778] pci 0000:00:00.0: BAR 0: =
assigned [mem 0x18200000-0x182fffff]<br>[=C2=A0=C2=A0=C2=A0 4.083700] pci 0=
000:00:00.0: BAR 6: assigned [mem 0x18300000-0x1830ffff pref]<br>[=C2=A0=C2=
=A0=C2=A0 4.090930] pci 0000:01:00.0: BAR 0: assigned [mem 0x18000000-0x181=
fffff 64bit]<br>[=C2=A0=C2=A0=C2=A0 4.098269] pci 0000:00:00.0: PCI bridge =
to [bus 01-ff]<br>[=C2=A0=C2=A0=C2=A0 4.103502] pci 0000:00:00.0:=C2=A0=C2=
=A0 bridge window [mem 0x18000000-0x181fffff]<br>[=C2=A0=C2=A0=C2=A0 4.1105=
84] pcieport 0000:00:00.0: PME: Signaling with IRQ 232<br>[=C2=A0=C2=A0=C2=
=A0 4.116617] pcieport 0000:00:00.0: AER: enabled with IRQ 232<br>[=C2=A0=
=C2=A0=C2=A0 4.194272] imx6q-pcie 33c00000.pcie: Phy link never came up<br>=
[=C2=A0=C2=A0=C2=A0 4.199975] imx6q-pcie 33c00000.pcie: failed to initializ=
e host<br>[=C2=A0=C2=A0=C2=A0 4.205916] imx6q-pcie 33c00000.pcie: unable to=
 add pcie port.<br>[=C2=A0=C2=A0=C2=A0 4.212755] Waiting for root device /d=
ev/mmcblk1p2...<br>[=C2=A0=C2=A0=C2=A0 4.423473] usb 1-1.2: new high-speed =
USB device number 3 using xhci-hcd</b><br><br></p></div>

<p></p>

-- <br>
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br>
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com" targe=
t=3D"_blank">jailhouse-dev+unsubscribe@googlegroups.com</a>.<br>
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/a46f55d1-2b6f-485e-8eef-71aa5eb08d92o%40googlegrou=
ps.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"_blank">https:=
//groups.google.com/d/msgid/jailhouse-dev/a46f55d1-2b6f-485e-8eef-71aa5eb08=
d92o%40googlegroups.com</a>.<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><br></div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAEfxd-8R-m4tpSBhyReThoXOoou740wsyi_%2BUv6tUnwUjDO=
1%3Dg%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://grou=
ps.google.com/d/msgid/jailhouse-dev/CAEfxd-8R-m4tpSBhyReThoXOoou740wsyi_%2B=
Uv6tUnwUjDO1%3Dg%40mail.gmail.com</a>.<br />

--00000000000090c47605ad366291--
