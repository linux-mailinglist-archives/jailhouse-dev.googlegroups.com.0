Return-Path: <jailhouse-dev+bncBCL6VUP7RYARBXUOVTTAKGQEFRCC3LI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x337.google.com (mail-ot1-x337.google.com [IPv6:2607:f8b0:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB1D11C25
	for <lists+jailhouse-dev@lfdr.de>; Thu,  2 May 2019 17:06:07 +0200 (CEST)
Received: by mail-ot1-x337.google.com with SMTP id h26sf1056849otm.19
        for <lists+jailhouse-dev@lfdr.de>; Thu, 02 May 2019 08:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=HrZvCx56qhkODTPYEiUVKtKLdhWcJX72fWmvdKNuAhs=;
        b=PrO28nXUKdEeHFgf3BsO3fyjl71J/Fxaj01eN1v4ZhFfvdvl3P5qQvGcnj52ODLECw
         BX8dBiSLKPQZeWb1dkhlPZYzY+cM5JDFZP6cGJiujCFdft6V2CD4Wdq5jZkPl3BOJ0Iz
         Ky+optI1QD2SNT1T3jGjC2jRsL9t5ss2si/5znpjgksSsYNZzvArtS5dP9e9JwQduvEM
         Sn7fPc8KKsBIGLdVlcRL01+xpIV1/VhZEoaERI2udGlIUEcM72pCXOzzKqkWm0Ox3/Ds
         JS+STXQsJHn7+vZ7WQ/vdxvy+cSvtoOiTUtMFA4gVAb2wSaSGP5jw0OHx07IhnrZYhd4
         aLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=HrZvCx56qhkODTPYEiUVKtKLdhWcJX72fWmvdKNuAhs=;
        b=WkaXAtD4B0ZDW7M8tFBNvETtUJtPQdEr2Wjp+N6WvJDXBk2GriAFXxX8sVeq3EA1H1
         nEgYfsv5n9OpBwdbBaahdDvuJuD7FRKfLbmz6B6uEj7HrCKp+AIjEYbMmd+8FV+ajlpY
         /yIB2EVd54C/KRG/fBIlbK9vKem/LQ+pE3SfAkvga3yTZunh+RWcip0z9myXI+ZLgVFO
         AgJ+xoDQWrlMs85VnR8QM1IGmC5es9Wc4elVKykmipIAKnZlUSh86VjiGNJ7sftdWKOQ
         qWbmOhHqUgeiG1FpR5JHn8JURhzXFwRGi85vVE5ZBB4FP9g9JjALekIDDSKhPO6rV92w
         Z52w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWpKAxR4KUVkj+In5wDKOiqKXPSiT8IiA36myCwPkScZEmYjUfM
	MMHWw3/IZrZGwgm5Jfxsa8k=
X-Google-Smtp-Source: APXvYqylh84D/M8dh3rY/7a8sxK1GP1AhAr9RsLDahbVwo8t+rd14oi9k77EVwn7i1jKrIFhlhkpIQ==
X-Received: by 2002:aca:f203:: with SMTP id q3mr2759580oih.25.1556809566393;
        Thu, 02 May 2019 08:06:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:76d2:: with SMTP id p18ls266694otl.13.gmail; Thu, 02 May
 2019 08:06:06 -0700 (PDT)
X-Received: by 2002:a05:6830:2003:: with SMTP id e3mr2977851otp.142.1556809565776;
        Thu, 02 May 2019 08:06:05 -0700 (PDT)
Date: Thu, 2 May 2019 08:06:04 -0700 (PDT)
From: =?UTF-8?Q?Hakk=C4=B1_Kurumahmut?= <hkurumahmut84@hotmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <6ca6fe6a-27b7-4110-884f-e3c5be79134c@googlegroups.com>
In-Reply-To: <26834bed-4a78-4bac-b093-d8f9e2646e72@googlegroups.com>
References: <16e3b6ef-37e1-4734-aba4-247bcbbc18e0@googlegroups.com>
 <6526d7d9-09fb-c25e-0037-628998267794@siemens.com>
 <81bb9c90-1557-47ae-990d-b1bf417a58b9@googlegroups.com>
 <63f974a9-5944-4f1f-77a2-4bd7393ff8a6@siemens.com>
 <05d90171-db1f-4031-a7b2-48570eb37847@googlegroups.com>
 <fdfcd6e7-e2a5-4187-b079-ca643fb281a1@googlegroups.com>
 <32bc2861-e11e-4ab0-bdcf-063e2c05318d@googlegroups.com>
 <f704088f-99c1-4ec0-bd5e-90e15874cc7d@googlegroups.com>
 <3e5ad4e4-abac-03f5-5402-661e62a83944@siemens.com>
 <7f55a310-7bb7-4a3f-b111-0c2a24939b7c@googlegroups.com>
 <1f880925-0420-7c15-1aa4-07d001a6efce@siemens.com>
 <bcd32c87-28e7-4747-b3ab-ebaedf160309@googlegroups.com>
 <32d0b346-10e4-de18-1d24-95e4e4cff977@web.de>
 <9732f874-1271-4296-b2ef-ededba614a87@googlegroups.com>
 <7deff203-cf29-6353-128a-8b40f8d42584@web.de>
 <cbeb1b02-5799-472c-bb5c-f6eb62a60305@googlegroups.com>
 <8ef112a9-2f0f-9205-3e67-f0c6fed498ba@siemens.com>
 <3cb885a7-8b66-42b4-adf2-6fc98375efa9@googlegroups.com>
 <26834bed-4a78-4bac-b093-d8f9e2646e72@googlegroups.com>
Subject: Re: JAILHOUSE hangs with exception when trying to enable the root
 cell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_526_1658872119.1556809565029"
X-Original-Sender: hkurumahmut84@hotmail.com
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

------=_Part_526_1658872119.1556809565029
Content-Type: text/plain; charset="UTF-8"

Hi again,

Is my last patch in my previous message correct, I am asking for my curiosity :)

Are you planning to support USB serial converters (/dev/ttyUSB0) for debug console?


I have started running inmate cell on "HP-800-G1 machine" with siemens/jailhouse->next branch.

On this machine Root Cell running very well. I have not seen any problem to running root cell. Then I try to start a inmate cell (tiny-demo) but terminal was hang. I have opened new terminal to collect some information.


Terminal Commands and console infos:

Page pool usage after late setup: mem 3884/32207, remap 16393/131072
Activating hypervisor

---sudo tools/jailhouse cell create configs/x86/tiny-demo.cell

Created cell "tiny-demo"
Page pool usage after cell creation: mem 3900/32207, remap 16393/131072

---sudo tools/jailhouse cell list

ID      Name                    State             Assigned CPUs           Failed CPUs             
0       RootCell                running           0-1,3                                           
1       tiny-demo               shut down         2 

---sudo tools/jailhouse cell load inmates/demos/x86/tiny-demo.bin

---sudo tools/jailhouse cell list

List Jailhouse Cells...
ID      Name                    State             Assigned CPUs           Failed CPUs             
0       RootCell                running           0-1,3                   1                       
1       tiny-demo               shut down         2


Is my command list correct? 

Is Loading *.bin file correct? or 

Does tiny-demo.c need any edit for specific hardware (currently HP-800-G1)?

Thanks.

HAKKI

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_526_1658872119.1556809565029--
