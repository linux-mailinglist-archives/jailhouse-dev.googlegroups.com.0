Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBEWWVHUAKGQESRPLCRQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7C74BF3A
	for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Jun 2019 19:04:19 +0200 (CEST)
Received: by mail-ed1-x538.google.com with SMTP id b12sf248824eds.14
        for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Jun 2019 10:04:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560963858; cv=pass;
        d=google.com; s=arc-20160816;
        b=rmSHwm7saRS2qtGutwB2DwZOTiIyqU9/ynklYjuiyTlKUF3UARVPddCjNNsk2jziCd
         m03VJdjFWwm00lxe7aNAFEgyg9Ma7I5cUbcMdKx6fzd/x/d+KxlR5HkiZWz/kaO4xeRr
         jZ2tT1gw9rYdpnr+AnFBgPNA0kuGrXiGCOJ+6ImcDHib33YnoGGI0MUplf2KsJ7ikMc8
         4JHb4vIrI0lR5WY7oPOSY8Zdezh8bJkq5odw6lcfxiagCm9wqcM4fSSjwI3mS18sh5NA
         NYf2TpdmrJIqVAgtkwZvbi4aFLYnUf4rwaqwLgJARF3Nul2XD9huKuLKEtVsCl5g9wjQ
         Qtpg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:openpgp:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=k//QDBwxhTGg4QJ7pX5HZt1GUR7KLCT527SRYs4PNZM=;
        b=vHZV+4sEw/wFAnn1COUDx91dFQI/EoHZy7NiuSSdbfF8ZPni5Yl2SO4THnSBTJiL1p
         q05xO+uK4v1faOhbEZDGJFPljFwMF4RVmpxGAICwZCdgaH377NWI7D/jFjGfx6lr1Djc
         GEv2I/9uk5B18XsZ6HCUUgDXiEeO5w/aIWNTFdFXaClcnvehRUW/xYMxiE/S3BltETak
         nqUvHsM4pruHz6RUlhcUvFt1P3ZTwawoRMxYsc4vtfMHEEzWP4+5YOcmb+xsclLCU+9T
         E/trF8zhKl3/gZ1TyxH7ZBYhKuNc4jQGApd33QV4oCjVK4jezLPSO/21+Vu8TeVaeroQ
         gERw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=BUsIy0Ze;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=k//QDBwxhTGg4QJ7pX5HZt1GUR7KLCT527SRYs4PNZM=;
        b=VgZu92yBNm4Zxi9yBi7jyq8df6owWMBxTB3QiWJeHndtjoYujVpyEEBtinczTVbojt
         9ADqW/mcppiAEZ0SJCSvI5xhH4UKjwhHvS4YWQ/Ie00P2jIi4c32EHGbxndWBywlcPPO
         Mnrh2G2ej82TFMQNkESDXvg2uv5B+1dk704jADTbpNwEM4yFwnasP/F7sAkELJlvs6dE
         NPT+fTmEhuxF3XymdmVboF+ULCqon3FyaGuStpwhDCTh2SiioAH40sbTGpw7fzktbJnA
         SACZC4qE5dtJR0YaWT8SFEpUx3c+tW36BlATgH1We3iwtjw7akMDcm2jZWbBispA/mAO
         UzIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=k//QDBwxhTGg4QJ7pX5HZt1GUR7KLCT527SRYs4PNZM=;
        b=kc0py/9EBcN2pVW/kNej0XHi+4L/9FYib/Fs5YznbxdkIby/pgOzPI/EvskGLF+4s5
         uDTbNUm2STjX/uwq5IMuqdBWvh4S20q7fo8TAGiA/y9sDzd6+5nikbSaFhHjS0ARP4dP
         n3qJX1Qr75N6Hlfn+F8BShAs4cYAsXEm42NTHY56E7ocSPFTgZsdGfnELu9COPOfoptq
         RWZ8Hk4/T10XLRplDl8dccismCZxaEpqwRoimE/Zp4BpJTSzp98h2Rie/bqiNA0Sq5a6
         C+XdGIfK5FHT0Lpr/mgJa3t45LsPz14UkIzwT9J6ThEpMHNVswW2aDrOY4XeLKzgw3Q7
         e6rg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUEiv5xAv19KFIZnPdyHBWkmj90wt5CfLgoHDe/ud1OUyqG33Uj
	q6mwp8kDWxQWjl7qIpHcLoY=
X-Google-Smtp-Source: APXvYqwl6KXCEdC4JoHGqp3zNsvUQ8IR7uCJBjJEbgQLJos65NAZJv0yKYz+E/5/Qj8cp1YhPhkTrQ==
X-Received: by 2002:aa7:d5cf:: with SMTP id d15mr78271127eds.67.1560963858853;
        Wed, 19 Jun 2019 10:04:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:1ec5:: with SMTP id m5ls705992ejj.11.gmail; Wed, 19
 Jun 2019 10:04:18 -0700 (PDT)
X-Received: by 2002:a17:906:1c94:: with SMTP id g20mr22936011ejh.179.1560963858377;
        Wed, 19 Jun 2019 10:04:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560963858; cv=none;
        d=google.com; s=arc-20160816;
        b=NoWX6HhdG2ab82g5BbxnAZ4c8MK649dsoJld2I1lUyAx491CCV1A5f31/M7N/upOLq
         v9bwZie97Zmuys6rFKbIUDfMEs608czG6cgNXzj8Mc8e0LuYlV+NFbtjX4SgO7HpHYLS
         cvcrgUfN10uv0sjNI1B8MgZN8MC13xm+4zUE/vsGBdrdbWnrmA0lAh3qx2PwOqln7bv6
         goeevV1c4iwXLhU0DPmC/QEfNJE99c2o4HL68JwJsC6IBDlq/ibeWMV+k/9L0iFGSxYu
         amPU0XmLkeIBUtgxNQNoDeG1jv9mxHbTwkWT6R1O5ynxbEbPXpcl4FGKQJtNzpiPbWyF
         CGjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:cc:to
         :subject:dkim-signature;
        bh=YbyiXMgd6hhaLKg7X03bo9eZ9eMXcWXByjjOyn+CHhw=;
        b=XQdsSSwIRq9njmO8a7WusD3Ps7hFraMabL249D0dVD94+xkOrdLEvIlUFTF5McuHwE
         lsYJWVaNBrrqDNW4ktNLYitxFQhFrlOzluau5sEH6DGzAohNtlC+31a0DeYkF2SNskWh
         2eEUhHsGZTkzIkuZBenimMgOxVrPyDhQKXN22BVD/ewUjmcNbg6ru2Gse8ipl637tyyH
         bbRaGQ1npjZSX/Mf5Gn+fFIt4AnU8/NOMg3DBJA3rqeQaHpGKFqIeNXOxuM0LiB/FFr3
         dJw1YPEgogk/7xfp5NCzpi03M/dvTHuwdSSPruJnk74DIsBtY7C3UPcN86qAY0XM1HXD
         Utrg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=BUsIy0Ze;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id k51si1096496edd.0.2019.06.19.10.04.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Jun 2019 10:04:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 45TWWj6M4MzyKY;
	Wed, 19 Jun 2019 19:04:17 +0200 (CEST)
Received: from [172.16.2.24] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 19 Jun
 2019 19:04:17 +0200
Subject: Re: [PATCH] pci: Replace mmio_write64 with mmio_write64_split
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: <jeanne.romefort@gmail.com>, Mario Mintel
	<mario.mintel@st.oth-regensburg.de>, Andrej Utz
	<andrej.utz@st.oth-regensburg.de>, =?UTF-8?Q?Hakk=c4=b1_Kurumahmut?=
	<hkurumahmut84@hotmail.com>
References: <20190619165224.15322-1-ralf.ramsauer@oth-regensburg.de>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Message-ID: <02c8a219-4be2-fb4b-6a06-e30e726dfefb@oth-regensburg.de>
Date: Wed, 19 Jun 2019 19:04:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190619165224.15322-1-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=BUsIy0Ze;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Hi Hakk=C4=B1 and Jean,

could you please try this patch? It might probably fix your VT-d issues.

Thanks
  Ralf

On 6/19/19 6:52 PM, Ralf Ramsauer wrote:
> MSI-X vector tables hold 64-bit entries. So far, we used mmio_write64 to
> set them.
>=20
> This conforms the PCI specification: "For all accesses to MSI-X Table and=
 MSI-X
> PBA fields, software must use aligned full DWORD or aligned full QWORD
> transactions; otherwise the result is undefined" (PCI Local Bus Specifica=
tion
> Rev 3.0, chapter 8.1.2).
>=20
> Nevertheless, some vendors don't support 64-bit writes, e.g., Broadcom et=
hernet
> cards (BCM5720). mmio_write64 stalls, and the transfer won't happen.
>=20
> Replace mmio_write64 with a wrapper mmio_write64_split that substitutes t=
he
> 64-bit write with two 32-bit write operations. This accessor first writes=
 the
> upper 32 bits and then the lower 32 bits.
>=20
> Credits go to Jan, the root cause of this bug was found in a private off-=
list
> discussion.
>=20
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>=20
> Only tested on x86, untested on ARM. I lack PCI devices with MSI-X
> suppport.
>=20
>  hypervisor/arch/arm-common/pci.c    |  4 ++--
>  hypervisor/arch/x86/pci.c           |  8 ++++----
>  hypervisor/include/jailhouse/mmio.h | 15 +++++++++++++++
>  3 files changed, 21 insertions(+), 6 deletions(-)
>=20
> diff --git a/hypervisor/arch/arm-common/pci.c b/hypervisor/arch/arm-commo=
n/pci.c
> index 60ffabb8..4f35175f 100644
> --- a/hypervisor/arch/arm-common/pci.c
> +++ b/hypervisor/arch/arm-common/pci.c
> @@ -58,8 +58,8 @@ int arch_pci_update_msi(struct pci_device *device,
>  int arch_pci_update_msix_vector(struct pci_device *device, unsigned int =
index)
>  {
>  	/* NOTE: See arch_pci_update_msi. */
> -	mmio_write64(&device->msix_table[index].address,
> -		     device->msix_vectors[index].address);
> +	mmio_write64_split(&device->msix_table[index].address,
> +			   device->msix_vectors[index].address);
>  	mmio_write32(&device->msix_table[index].data,
>  		     device->msix_vectors[index].data);
>  	return 0;
> diff --git a/hypervisor/arch/x86/pci.c b/hypervisor/arch/x86/pci.c
> index 492e9859..560c5697 100644
> --- a/hypervisor/arch/x86/pci.c
> +++ b/hypervisor/arch/x86/pci.c
> @@ -393,8 +393,8 @@ int arch_pci_update_msix_vector(struct pci_device *de=
vice, unsigned int index)
>  				     irq_msg);
>  	// HACK for QEMU
>  	if (result =3D=3D -ENOSYS) {
> -		mmio_write64(&device->msix_table[index].address,
> -			     device->msix_vectors[index].address);
> +		mmio_write64_split(&device->msix_table[index].address,
> +				   device->msix_vectors[index].address);
>  		mmio_write32(&device->msix_table[index].data,
>  			     device->msix_vectors[index].data);
>  		return 0;
> @@ -402,8 +402,8 @@ int arch_pci_update_msix_vector(struct pci_device *de=
vice, unsigned int index)
>  	if (result < 0)
>  		return result;
> =20
> -	mmio_write64(&device->msix_table[index].address,
> -		     pci_get_x86_msi_remap_address(result));
> +	mmio_write64_split(&device->msix_table[index].address,
> +			   pci_get_x86_msi_remap_address(result));
>  	mmio_write32(&device->msix_table[index].data, 0);
> =20
>  	return 0;
> diff --git a/hypervisor/include/jailhouse/mmio.h b/hypervisor/include/jai=
lhouse/mmio.h
> index 61b4647e..567901d0 100644
> --- a/hypervisor/include/jailhouse/mmio.h
> +++ b/hypervisor/include/jailhouse/mmio.h
> @@ -73,6 +73,21 @@ DEFINE_MMIO_WRITE(32)
>  DEFINE_MMIO_WRITE(64)
>  /** @} */
> =20
> +/**
> + * Write a 64-bit value to a memory-mapper I/O register. Perform two 32-=
bit
> + * write operations instead of one 64-bit write operation.
> + *
> + * @param address	Virtual address of the register.
> + * @param value		Value to write.
> + * @{
> + */
> +static inline void mmio_write64_split(void *address, u64 value)
> +{
> +	mmio_write32(address + sizeof(u32), (u32)(value >> (sizeof(u32) * 8)));
> +	mmio_write32(address, (u32)value);
> +}
> +/** @} */
> +
>  /**
>   * Read value from 32 or 64-bit MMIO register field.
>   * @param address	Virtual address of the register.
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/02c8a219-4be2-fb4b-6a06-e30e726dfefb%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
