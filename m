Return-Path: <jailhouse-dev+bncBCMZLOEWZYNBBIXG5WWQMGQEY42UOAY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x1140.google.com (mail-yw1-x1140.google.com [IPv6:2607:f8b0:4864:20::1140])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BF4845566
	for <lists+jailhouse-dev@lfdr.de>; Thu,  1 Feb 2024 11:32:05 +0100 (CET)
Received: by mail-yw1-x1140.google.com with SMTP id 00721157ae682-60406626b50sf17363837b3.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 01 Feb 2024 02:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1706783524; x=1707388324; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFERc80fObKqFNgaG1k7KGpmMSHUC+ifArRfpHRo2OE=;
        b=XxLDtYOZ2T9HkyM1oA9HgHyMN5cXU+asvOZMYuzZEmKZS0LU5ezevJ0xjq6NR9v4MV
         gQtb1NfL6rCmfF2wS05FG2TaArjM5ydakBp+5Y+IOAeQz45acJ1+RGZSMFc33h6qgV0s
         bqDolRiTD7o8o9ZFxZE7q+7JBX6XkQzSK37QIvTY5FGiDk15Lv7ERE98nPjGXXQpVLi8
         T3bW9ePKhcuSenwqUFc8y7rFK0ViWAHJGPO98AEoVuRw67gK5iyPtsVc5JDTvdC6aNs2
         fc2sgkvJhLGDSGEi2CmeOvAz1FdQHHGehNcShmXMoTSWVDIW2YKSFU0necWPY3fn7GJR
         PuzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706783524; x=1707388324; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bFERc80fObKqFNgaG1k7KGpmMSHUC+ifArRfpHRo2OE=;
        b=Q9Slw8bQwc50P6QB64arlx/XSvns467kdSYReD7NcdHHL3Av+akdONZYudXfUCIXCe
         z9qqMUiKmWKfsZMZbTxq2ExlnkGL4/GDUew2XsR1Wp3vCk/XdEiXpA0N1oxqd+041bU5
         LuzD6/ugSN+iN3Ur7n818fvpy7RgMiBLrrsuQ4Oe5vIxexAjk2weqt9ey26Vnlt8+Xin
         syuM8xCfiLH/yCFZkpEJ8ck9gUMcdHbGLE/yo9wTXMUhTklMkIDq/N+Xmj6u+ww9Jgp/
         tcWGiEATcAfbEl/ene6NQbEYwNRkcTbZlV52ipSwh47v3+0+4CaRaMw0LOEqbxOTZxO3
         n6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706783524; x=1707388324;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFERc80fObKqFNgaG1k7KGpmMSHUC+ifArRfpHRo2OE=;
        b=C9mnTm1WW83QT+KcZ7LrfjdxYQbm/J7izQAn5sN7P/LwFT/OmWsTmE16EnMy4wbYX6
         0wim0WAt9PdOVaqnFJAqxpj24gcV7amRw8GfIPLHCa35vU1CQ5oX9OjHmB4eTRhsuMBa
         /fQdwaUmhYffZ2gqqqZTlLsoZ2ACXyCkxqp4NKewxXrAHP2jU6hVUJIdLFcKJilJG4S6
         CVdDQeZaCzNu9Ljj4OvFsOZEHPjuLxNFSdWwetSrbt7ikuBkJ4gqvZEyjEm/iXA2oCaF
         J8g48X9sDEE+bcLB0u6cCRT8ordY+COX5IWJQTXKJ5zamnF/o1T5oNOpeqldDyEk3nLN
         v7mA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0Yzu1ueU4VaOnVa1F8z1LaeocJU4sGWsWTs61I3uux8PTIdl/sWf
	eKejeU2hyOFJ7x5XdH43NTjfbu6RKcnf4AxHSTO06IhmSI5uxxcu
X-Google-Smtp-Source: AGHT+IHh1QB6P3SInL1RCk2G0miqCtANE3HDxaLL2i9LgJNOtHFAqemEztyg9Yb32ON+PDFo3FEbMQ==
X-Received: by 2002:a25:8702:0:b0:dc2:454b:5eb3 with SMTP id a2-20020a258702000000b00dc2454b5eb3mr4266729ybl.45.1706783523592;
        Thu, 01 Feb 2024 02:32:03 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:744c:0:b0:dc2:50de:4bb with SMTP id p73-20020a25744c000000b00dc250de04bbls179628ybc.1.-pod-prod-09-us;
 Thu, 01 Feb 2024 02:32:02 -0800 (PST)
X-Received: by 2002:a05:6902:2512:b0:dc2:1dd0:c517 with SMTP id dt18-20020a056902251200b00dc21dd0c517mr1165972ybb.7.1706783521937;
        Thu, 01 Feb 2024 02:32:01 -0800 (PST)
Date: Thu, 1 Feb 2024 02:32:01 -0800 (PST)
From: Syed Aftab Rashid <saftab.rashid@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <a2cf0e4d-925d-4d67-b619-c07c8bb42657n@googlegroups.com>
Subject: Problem installing Jailhouse on ubuntu VM running on X86
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_8094_471601838.1706783521188"
X-Original-Sender: saftab.rashid@gmail.com
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

------=_Part_8094_471601838.1706783521188
Content-Type: multipart/alternative; 
	boundary="----=_Part_8095_777070657.1706783521188"

------=_Part_8095_777070657.1706783521188
Content-Type: text/plain; charset="UTF-8"

Hi all, 

I am trying to install Jailhouse on a Ubuntu VM running using VMware inside 
a Windows 10 host system. I am following the instruction provided here 

GitHub - siemens/jailhouse: Linux-based partitioning hypervisor 
<https://github.com/siemens/jailhouse>

However, I am getting the following error when I run "make" in the 
jailhouse folder. 

ERROR: modpost: "ioremap_page_range" 
[/home/ubuntu/jailhouse/driver/jailhouse.ko] undefined!
ERROR: modpost: "__get_vm_area_caller" 
[/home/ubuntu/jailhouse/driver/jailhouse.ko] undefined!
ERROR: modpost: "lapic_timer_period" 
[/home/ubuntu/jailhouse/driver/jailhouse.ko] undefined!
make[2]: *** [scripts/Makefile.modpost:144: 
/home/ubuntu/jailhouse/Module.symvers] Error 1
make[1]: *** [Makefile:1989: modpost] Error 2
make: *** [Makefile:40: modules] Error 2

I have modified the /etc/default/grub as follows

GRUB_DEFAULT=0
GRUB_TIMEOUT_STYLE=hidden
GRUB_TIMEOUT=0
GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
GRUB_CMDLINE_LINUX_DEFAULT="memmap=82M\\\$0x3a000000"
GRUB_CMDLINE_LINUX="intel_iommu=off"
GRUB_CMDLINE_LINUX="find_preseed=/preseed.cfg auto noprompt 
priority=critical l

What am I missing here. Unfortunately, I am a bit new to this so I might be 
making a basic mistake. However, I couldn't find any proper installation 
guide. 

Any help in this regard is much appreciated. 

Thank you

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a2cf0e4d-925d-4d67-b619-c07c8bb42657n%40googlegroups.com.

------=_Part_8095_777070657.1706783521188
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,=C2=A0<div><br /></div><div>I am trying to install Jailhouse on a Ub=
untu VM running using VMware inside a Windows 10 host system. I am followin=
g the instruction provided here=C2=A0</div><div><br /></div><div><a href=3D=
"https://github.com/siemens/jailhouse">GitHub - siemens/jailhouse: Linux-ba=
sed partitioning hypervisor</a><br /></div><div><br /></div><div>However, I=
 am getting the following error when I run "make" in the jailhouse folder.=
=C2=A0</div><div><br /></div><div>ERROR: modpost: "ioremap_page_range" [/ho=
me/ubuntu/jailhouse/driver/jailhouse.ko] undefined!<br />ERROR: modpost: "_=
_get_vm_area_caller" [/home/ubuntu/jailhouse/driver/jailhouse.ko] undefined=
!<br />ERROR: modpost: "lapic_timer_period" [/home/ubuntu/jailhouse/driver/=
jailhouse.ko] undefined!<br />make[2]: *** [scripts/Makefile.modpost:144: /=
home/ubuntu/jailhouse/Module.symvers] Error 1<br />make[1]: *** [Makefile:1=
989: modpost] Error 2<br />make: *** [Makefile:40: modules] Error 2<br /></=
div><div><br /></div><div>I have modified the /etc/default/grub as follows<=
/div><div><br /></div><div>GRUB_DEFAULT=3D0<br />GRUB_TIMEOUT_STYLE=3Dhidde=
n<br />GRUB_TIMEOUT=3D0<br />GRUB_DISTRIBUTOR=3D`lsb_release -i -s 2&gt; /d=
ev/null || echo Debian`<br />GRUB_CMDLINE_LINUX_DEFAULT=3D"quiet splash"<br=
 />GRUB_CMDLINE_LINUX_DEFAULT=3D"memmap=3D82M\\\$0x3a000000"<br />GRUB_CMDL=
INE_LINUX=3D"intel_iommu=3Doff"<br />GRUB_CMDLINE_LINUX=3D"find_preseed=3D/=
preseed.cfg auto noprompt priority=3Dcritical l<br /></div><div><br /></div=
><div>What am I missing here. Unfortunately, I am a bit new to this so I mi=
ght be making a basic mistake. However, I couldn't find any proper installa=
tion guide.=C2=A0</div><div><br /></div><div>Any help in this regard is muc=
h appreciated.=C2=A0</div><div><br /></div><div>Thank you</div><div><br /><=
/div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/a2cf0e4d-925d-4d67-b619-c07c8bb42657n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/a2cf0e4d-925d-4d67-b619-c07c8bb42657n%40googlegroups.co=
m</a>.<br />

------=_Part_8095_777070657.1706783521188--

------=_Part_8094_471601838.1706783521188--
