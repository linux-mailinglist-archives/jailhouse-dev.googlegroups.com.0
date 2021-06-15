Return-Path: <jailhouse-dev+bncBC7PTOEB2ALRB4X4UGDAMGQE6ELS57I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x839.google.com (mail-qt1-x839.google.com [IPv6:2607:f8b0:4864:20::839])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0C73A7BA5
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Jun 2021 12:18:28 +0200 (CEST)
Received: by mail-qt1-x839.google.com with SMTP id z4-20020ac87f840000b02902488809b6d6sf9092240qtj.9
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Jun 2021 03:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=MCH9dYeqgeUZcuFTvuJc7sTQlzIrcAmFyX9cdxO2hvc=;
        b=NTpnNdnYKHsLKirvAFKWapBKFAuawb8TiJW/IoDPD5QNFZgqtwLKMcyk7j8CB1DnF6
         KipXZTPl+aysB3g4B2S+OcClLNACBcXo1hNm7YPRyXfttRQvhtrJesezQiWxnGcfiOiQ
         6QmjyA/ucZXzDiP7Xz7oNaAlPNpPkvdGOFq7yFWsu3Yufx4XrCeg5JoYEj03qq3NCmmN
         wV7y6Zz2OGPp/z1QoK19AFcyZLYHa45R3KWkQXxuRS8VgvODLDZtG2uriNUPlcd1bTjc
         mN3Fh7sAhwl8QlV13+fLUdp5UiaXBPRSAmPkjw9BUhaoBI8ecdNoCE3Ew553/vTL8Tnu
         fcgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=MCH9dYeqgeUZcuFTvuJc7sTQlzIrcAmFyX9cdxO2hvc=;
        b=n0Ypn1ZfH6IWI/dxieuju3NEDDdJi8Vturtw8N6+pkHOpIOEBer52UylKtcFawpgX+
         JXN9jopEBH3+lCBCkB9E9SbLqCBZF6ELzzuE798cgj9Y2q0vqNBQQVlymzv3mLQ4foba
         KquhqYiwqqeeWUOBSIpMokqBILVQqOz4zkiC3iZQNWPnayMBFQbvwfA80OUiF63mdB9y
         VL+fAGRTtU+CPNDlLU+UKX/5FlT60tL2f8PExR7+oYZLX9EacsKYemv5NdMXe2PZwlhP
         1G45teBqekHH5vzUiS9PEqLBNl6poc9F8D1MuilF4BLDWKTpvRmU1ZGHqEDI/LVPwWIf
         Lteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=MCH9dYeqgeUZcuFTvuJc7sTQlzIrcAmFyX9cdxO2hvc=;
        b=FsIX6juLCqRf7oQkcMxsNE8kwHetQRRmUjymnIst0Fsh76p8tNp7yDhMvlPR4CxPLI
         7N8z61UI/I+kDobn2QdK/m7UIpQqmjH7sszx+f+CbxgyS9KQ3QWOrAbcbf2rKRY4BnR2
         vbFVEUODMvlSx5bH7oCBAEKt5WBS4mEZ5B0nReLTDu9tQKQFPzclZtdwjuJMGEEDqK4p
         Zgy/NDxV7I0uQI94FuGxUUiH39cUsot+qjtpFgcCjEjriGWQk5zCZRYboHsuvdMLXjy/
         Qmh04qkpp5vpX5+fP+LqfBL13CMQFvWyCaSNr3nOJFgf/zFHArz7pG42Ud0VNJfgDwyK
         O6eA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530CO0KBuL2Z7/nWRbxWg0H6WrA/4wD0SX37y8T18XrczJ0Ytpdl
	wefPiLXO/9Ygb6XoYMfsMq0=
X-Google-Smtp-Source: ABdhPJwVId/gA7WydZDX6y1tYDnI0cw+NcuZVDqc1cVIc75RPdPjBslRiKuv0qrSSkXhY9U4Ak4RLw==
X-Received: by 2002:a05:6214:ccb:: with SMTP id 11mr4341864qvx.43.1623752306737;
        Tue, 15 Jun 2021 03:18:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:5ace:: with SMTP id d14ls8741575qtd.7.gmail; Tue, 15 Jun
 2021 03:18:26 -0700 (PDT)
X-Received: by 2002:aed:204c:: with SMTP id 70mr21356117qta.260.1623752306181;
        Tue, 15 Jun 2021 03:18:26 -0700 (PDT)
Date: Tue, 15 Jun 2021 03:18:25 -0700 (PDT)
From: along li <v6543210@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <d32f5f75-4790-423a-9b03-75b00fa48f6fn@googlegroups.com>
In-Reply-To: <db85b6dc-4d10-3e91-cf4b-4ea6d8e44b2d@siemens.com>
References: <09c2642b-ba89-4226-8452-534393dc6a33n@googlegroups.com>
 <d5e6079c-5cf5-ce18-45c0-d0eaa7d60350@siemens.com>
 <aa1b60e5-a823-4cb5-b36f-d0162bf0583en@googlegroups.com>
 <db85b6dc-4d10-3e91-cf4b-4ea6d8e44b2d@siemens.com>
Subject: Re: How to partition PCI devices to none-root cells in rpi4b?
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_752_563787244.1623752305618"
X-Original-Sender: v6543210@gmail.com
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

------=_Part_752_563787244.1623752305618
Content-Type: multipart/alternative; 
	boundary="----=_Part_753_1042908208.1623752305618"

------=_Part_753_1042908208.1623752305618
Content-Type: text/plain; charset="UTF-8"

May I ask you  some questions?
 Is  .pci_caps section  needed  on arm64 platform(rpi4b)  to  partition pci 
devices into inmate?
How to write .pci_devices section for  devices on arm64 platform?
What is needed and what is  not needed ?

For example I want to partition PCI 01:00.0 into inmate, It is usb 
controller.
How to write  .pci_devices  section in  .c  configuration file ? 
/proc/iomem   and   lspci -vvv   output  is  in attatch files.
Can you  give some  advices.  I cann't find any  demo for partitioning pci 
on arm64.
I have sucessfully  partition  network card  into inmate on NUC6CAY. 


.pci_devices = {
{ /* IVSHMEM 00:01.0 (networking) */
.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
.bdf = 1 << 3,
.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
.shmem_regions_start = 5,
.shmem_dev_id = 1,
.shmem_peers = 2,
.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
},
/*pci  USB   01:00.0*/
{
.type = JAILHOUSE_PCI_TYPE_DEVICE,
.iommu = 1,
.domain = 0,
.bdf = 1 << 8,
.bar_mask = {
0xfffff000, 0xffffffff, 0x00000000,
0x00000000, 0x00000000, 0x00000000,
},
},
},


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d32f5f75-4790-423a-9b03-75b00fa48f6fn%40googlegroups.com.

------=_Part_753_1042908208.1623752305618
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>May I ask you&nbsp; some questions?</div><div>&nbsp;Is&nbsp; .pci_caps=
 section&nbsp; needed&nbsp; on arm64 platform(rpi4b)&nbsp; to&nbsp; partiti=
on pci devices into inmate?</div><div>How to write .pci_devices section for=
&nbsp; devices on arm64 platform?</div><div>What is needed and what is&nbsp=
; not needed ?</div><div><br></div><div>For example I want to partition PCI=
 01:00.0 into inmate, It is usb controller.</div><div>How to write&nbsp; .p=
ci_devices&nbsp; section in&nbsp; .c&nbsp; configuration file ?&nbsp;</div>=
<div>/proc/iomem&nbsp; &nbsp;and&nbsp; &nbsp;lspci -vvv&nbsp; &nbsp;output&=
nbsp; is&nbsp; in attatch files.</div><div>Can you&nbsp; give some&nbsp; ad=
vices.&nbsp; I cann't find any&nbsp; demo for partitioning pci on arm64.</d=
iv><div>I have sucessfully&nbsp; partition&nbsp; network card&nbsp; into in=
mate on NUC6CAY.&nbsp;</div><div><br></div><div><br></div><div><span style=
=3D"white-space:pre">	</span>.pci_devices =3D {</div><div><span style=3D"wh=
ite-space:pre">		</span>{ /* IVSHMEM 00:01.0 (networking) */</div><div><spa=
n style=3D"white-space:pre">			</span>.type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,=
</div><div><span style=3D"white-space:pre">			</span>.bdf =3D 1 &lt;&lt; 3,=
</div><div><span style=3D"white-space:pre">			</span>.bar_mask =3D JAILHOUS=
E_IVSHMEM_BAR_MASK_INTX,</div><div><span style=3D"white-space:pre">			</spa=
n>.shmem_regions_start =3D 5,</div><div><span style=3D"white-space:pre">			=
</span>.shmem_dev_id =3D 1,</div><div><span style=3D"white-space:pre">			</=
span>.shmem_peers =3D 2,</div><div><span style=3D"white-space:pre">			</spa=
n>.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_VETH,</div><div><span style=3D"=
white-space:pre">		</span>},</div><div><span style=3D"white-space:pre">		</=
span>/*pci&nbsp; USB&nbsp; &nbsp;01:00.0*/</div><div><span style=3D"white-s=
pace:pre">		</span>{</div><div><span style=3D"white-space:pre">			</span>.t=
ype =3D JAILHOUSE_PCI_TYPE_DEVICE,</div><div><span style=3D"white-space:pre=
">			</span>.iommu =3D 1,</div><div><span style=3D"white-space:pre">			</sp=
an>.domain =3D 0,</div><div><span style=3D"white-space:pre">			</span>.bdf =
=3D 1 &lt;&lt; 8,</div><div><span style=3D"white-space:pre">			</span>.bar_=
mask =3D {</div><div><span style=3D"white-space:pre">				</span>0xfffff000,=
 0xffffffff, 0x00000000,</div><div><span style=3D"white-space:pre">				</sp=
an>0x00000000, 0x00000000, 0x00000000,</div><div><span style=3D"white-space=
:pre">			</span>},</div><div><span style=3D"white-space:pre">		</span>},</d=
iv><div><span style=3D"white-space:pre">	</span>},</div><div><br></div><br>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/d32f5f75-4790-423a-9b03-75b00fa48f6fn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/d32f5f75-4790-423a-9b03-75b00fa48f6fn%40googlegroups.co=
m</a>.<br />

------=_Part_753_1042908208.1623752305618--

------=_Part_752_563787244.1623752305618--
