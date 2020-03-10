Return-Path: <jailhouse-dev+bncBAABBZHOT3ZQKGQEBLHPPZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id 414FF180268
	for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Mar 2020 16:51:01 +0100 (CET)
Received: by mail-ed1-x537.google.com with SMTP id p17sf6034847edt.20
        for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Mar 2020 08:51:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1583855461; cv=pass;
        d=google.com; s=arc-20160816;
        b=FgB17C3pnJ7Yvvx5Hy9F3oFcsGYBkHV+pSyJ1fgtkEed+T5JY9aKcMMklG9t9NmuMd
         16NHLEgooCCRBbX9vapZwjpjtewAuYHl0c1rr3pge999zxg2b/0JTegdPvumHmMVIVFr
         M5eMokNv29b3qvHEKHZv8/bARz14gwMz33pf6NEVq9lNFLM3ZGtQWmMu/kfVTfVvACNj
         MRyrT8CAjxhcv3QwTHHByhoLoYz6iZD6JfWwsQuIWrTOVwUrhpx7RWZzQ64wgEr0eB55
         Tm+uWMUzkI007LIIFpcsP/VIWxSaRL4MU6TkUI2OIC6fkJsmT41wmQ+1Q4zmWZj3+OZH
         L76Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:autocrypt:from:references:to:subject:sender
         :dkim-signature;
        bh=UQRFyDCv0/eI6XgWta0vaE8nZt+mNcTUeRcZYZCNla4=;
        b=oJS5c1AFNOplQG9OHkXrziXMv+GhjBvyiHTeG6zRLjt1fV1m+qviAorkyDhkF0T74C
         31mgjgHm/j59+1MhbEvoNm575NzyoI2zhwFXaPSoKw29Yg1TWCiyaaEIoLBmQK5ye72U
         +OZBnc7fe9BfDFNXCRCnVVoVxr0VUfA/87rG8I1yQtIjOyKmm01IxBhO056XbjbW07pX
         4vLkLm2QCHvHgq6RfEgrPf9lOLmha+2KKhciWWlrxumBzYvDz56vGdHMVlocslSqUhHf
         kZOC7dh0GNq/NsJQIF4dAW9HIv9iCrOfiiGav8cVm/a01A6KFeTcPvBA5Nixh/GUnGHd
         tB8Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: best guess record for domain of p.rosenberger@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=p.rosenberger@linutronix.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:organization:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=UQRFyDCv0/eI6XgWta0vaE8nZt+mNcTUeRcZYZCNla4=;
        b=JI6cAwpDbVBWINmoj8rgPUo7mnGxj6pvLDOHZcJW4fQJcgrEtvP24HCBPFMtXN+REx
         wo323C2XFfMG4rnbIW5RliEK0lmhD7WzsQWMzy4jzCftnz58604WaOZ4a/NfGccFiU52
         sKyWcK0gvY9zQvd6+NYVgpXaY2lhhUivSv8Q6ArND73K1COcm1fdF2JSdAP9a4ZYGG0o
         h6fJ8n4cb6O8OHk0e8kjOD/2ddyZdwSbW2N9JAI+ioQejLfCdx+VJxl6slavIVN2Imbe
         Xoev5tJhxSrgnrRvrqha1+fUTCsJHNIVgrQ6LYwj0XgqPlC9mklPOfPNJkJLO4qnwacc
         gKGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UQRFyDCv0/eI6XgWta0vaE8nZt+mNcTUeRcZYZCNla4=;
        b=jTuZwAvbdZ3LQszR7rZgHtlOhGiop7j8PmcAvX0YS+W9kytUSHY06cXOxTIa2QSixO
         zFIlO0CB8jplzY5yvm5bzzEX/V+sbSbvAFXTTLETrwjL8PNWKVlOKTHN5CANDmTujmmb
         4zV1NqVvJf5fAzFyfuoXYjlmyumnWx4F/Dm9TrCHsob4rhLhEriX2nkDDQxBP6OS9jev
         BDuDq+Tiy2NUVjfugjPjgYV7xoway/gi8CM0IKE9pWhAnChSsr0ML6y7zZxCHGizQpjY
         d+qZolgRlv99sMpnpo0rDpSvv8AptXj+kwg/1xxjri2OCc3M13PXd5lKElb3dSgPpZAd
         9rTA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ3dgBTQ1Id+SdVyim9pm39JIVizPx7q10s0PypTxhcEEONnUECd
	RInru+Z9pRVH1XWaGTNEcmg=
X-Google-Smtp-Source: ADFU+vvb8oPU0o7UQUlMlFev+neQqz2deD1SofX+cV0V6ObsdvUXEFIdNWehzOZAOJMmLnvbyS+HFQ==
X-Received: by 2002:a50:9ee8:: with SMTP id a95mr21685302edf.86.1583855460922;
        Tue, 10 Mar 2020 08:51:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:416:: with SMTP id q22ls10022237edv.10.gmail; Tue,
 10 Mar 2020 08:51:00 -0700 (PDT)
X-Received: by 2002:a05:6402:180e:: with SMTP id g14mr5857181edy.66.1583855460377;
        Tue, 10 Mar 2020 08:51:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583855460; cv=none;
        d=google.com; s=arc-20160816;
        b=u6WZBb9KrczDvmr7mSZXBUKyE8CIDwPzlu4RkkRCtshJa7L8H6Vp6AkozMusW8kaJA
         UiFYyH9EcK9qtytkmW+KtieqGeg6gPZtmRYZTeOYSGz6FKsKUJMAc0+89BBtLVhcgUCk
         Cm+BeMis7P4BjzacrSScMuuRh14QCKbBe1e4juFeatSEuto6oAj23Y6syS4KNSjHBzxP
         OolhxVxNx8O00wUaar7E2Y5HumyW8BpLHRbSCjoseZbdITUI/aOW3KMvRvAxpv6KIpsX
         OPCnM6PUQH4EQ/bLRXpIIY55xyVLmo/0PDB89YqnBnK7TXBokPDyktYIvjGyhIvI8ADI
         rWdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:from:references
         :to:subject;
        bh=Nrcd7XveAZ4gkAcI9PY4CsOvGk53udWn7/2hThtQJAQ=;
        b=kHyb4RzXJ7kbq38Yi4CC43U70QAjwaAt27ZSGQSj5zKV/m3MNGj1U1E7ylEdD4jpI/
         wJ+ptj7S+Q74lUuJ8HPh605d+k81nuOmY12acCbFBnqUaLoSOT2xNVEooHA3xitPhFYW
         Oq88t1JXPkdfkrSBg9eNpwU5ylK6HsjrMYyEAuitcG8vmyqVLqdqJAOGqS1Ti+NjUMhB
         q0599j2E2t4/DfHiAAiG6NlxllS58CpMbDCGjR+OTLF3DL5bvvuo1ZdLbno+t36Hf1Qj
         oeJcHVUYQA751gIH4thkHC5u6Z0uhxg7MCDFuU8wdqfV+WUCc4KEgski2UfksHs6FTPo
         99iw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: best guess record for domain of p.rosenberger@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=p.rosenberger@linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de. [2a0a:51c0:0:12e:550::1])
        by gmr-mx.google.com with ESMTPS id l35si520046ede.3.2020.03.10.08.51.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 10 Mar 2020 08:51:00 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of p.rosenberger@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) client-ip=2a0a:51c0:0:12e:550::1;
Received: from b2b-130-180-90-162.unitymedia.biz ([130.180.90.162] helo=[10.23.2.107])
	by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80)
	(envelope-from <p.rosenberger@linutronix.de>)
	id 1jBh9n-0006BA-Du; Tue, 10 Mar 2020 16:50:59 +0100
Subject: Re: virtio-ivshmem-*: only works on the 2nd try
To: Jan Kiszka <jan.kiszka@siemens.com>,
 jailhouse-dev <jailhouse-dev@googlegroups.com>
References: <0203ac1b-87f4-177c-1fcd-c6e10d3d5dfd@linutronix.de>
 <8823c273-a3b9-4719-caa9-6791dd6a01a7@siemens.com>
 <5f6ae796-572a-9dbd-93b3-223fbcf7d3a6@siemens.com>
From: Philipp Rosenberger <p.rosenberger@linutronix.de>
Autocrypt: addr=p.rosenberger@linutronix.de; prefer-encrypt=mutual; keydata=
 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
 c7AAe3l97AutscBJpp+BBQBj4nPXfw==
Organization: linutronix GmbH
Message-ID: <a7fddcbd-97ff-79dd-a80f-43bb703dceb5@linutronix.de>
Date: Tue, 10 Mar 2020 16:50:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <5f6ae796-572a-9dbd-93b3-223fbcf7d3a6@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
X-Original-Sender: p.rosenberger@linutronix.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: best guess record for domain of p.rosenberger@linutronix.de
 designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=p.rosenberger@linutronix.de
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



On 10.03.20 16:34, Jan Kiszka wrote:
> On 10.03.20 16:08, Jan Kiszka wrote:
>> On 10.03.20 15:41, Philipp Rosenberger wrote:
>>> Hi,
>>>
>>> I have managed to get virtio-ivshmem console and block running. But I
>>> observed a strange behavior. I do the following:
>>>
>>> 1. Boot up the board.
>>> 2. Enable the rootcell.
>>> 3. echo "110a 4106 110a 4106 ffc002 ffffff" > \
>>> =C2=A0=C2=A0 /sys/bus/pci/drivers/uio_ivshmem/new_id
>>> 4. virtio-ivshmem-block /dev/uio0 /path/to/disk.image
>>> 5. boot linux-inmate
>>> 6. virtio-ivshmem 0000:00:0f.0: backend not ready
>>> 7. kernel panic
>>>
>>> If I redo the sets 4 and 5 the inmates starts as expected and I can
>>> access the disk.image via /dev/vda.
>>>
>>> I found, the the virtio-ivshmem-block tool waits for an interrupt if
>>> 'state[peer_id] !=3D VIRTIO_STATE_RESET'. But there is no interrupt.
>>
>> The state memory should be zeroed, provided the peer is not running. You=
=20
>> will only get an interrupt during the peer setup when it switches it=20
>> state from (expected) RESET to READY. Maybe we miss some proper=20
>> initialization of the shared state memory in Jailhouse.
>>
>> Can you confirm that the state memory is in a random state on first=20
>> startup? And that it changes as expected for the peer to READY once the=
=20
>> non-root Linux boots?
>=20
> Does this help?

Yeah, this works nicely.
Thank you!

Best regards,
Philipp

> diff --git a/hypervisor/ivshmem.c b/hypervisor/ivshmem.c
> index 22283a85..a5cdcf93 100644
> --- a/hypervisor/ivshmem.c
> +++ b/hypervisor/ivshmem.c
> @@ -101,13 +101,8 @@ static void ivshmem_trigger_interrupt(struct ivshmem=
_endpoint *ive,
>  	spin_unlock(&ive->irq_lock);
>  }
> =20
> -static void ivshmem_write_state(struct ivshmem_endpoint *ive, u32 new_st=
ate)
> +static u32 *ivshmem_map_state_table(struct ivshmem_endpoint *ive)
>  {
> -	const struct jailhouse_pci_device *dev_info =3D ive->device->info;
> -	u32 *state_table =3D (u32 *)TEMPORARY_MAPPING_BASE;
> -	struct ivshmem_endpoint *target_ive;
> -	unsigned int id;
> -
>  	/*
>  	 * Cannot fail: upper levels of page table were already created by
>  	 * paging_init, and we always map single pages, thus only update the
> @@ -115,9 +110,20 @@ static void ivshmem_write_state(struct ivshmem_endpo=
int *ive, u32 new_state)
>  	 */
>  	paging_create(&this_cpu_data()->pg_structs,
>  		      ive->shmem[0].phys_start, PAGE_SIZE,
> -		      (unsigned long)state_table, PAGE_DEFAULT_FLAGS,
> +		      TEMPORARY_MAPPING_BASE, PAGE_DEFAULT_FLAGS,
>  		      PAGING_NON_COHERENT | PAGING_NO_HUGE);
> =20
> +	return (u32 *)TEMPORARY_MAPPING_BASE;
> +}
> +
> +
> +static void ivshmem_write_state(struct ivshmem_endpoint *ive, u32 new_st=
ate)
> +{
> +	const struct jailhouse_pci_device *dev_info =3D ive->device->info;
> +	u32 *state_table =3D ivshmem_map_state_table(ive);
> +	struct ivshmem_endpoint *target_ive;
> +	unsigned int id;
> +
>  	state_table[dev_info->shmem_dev_id] =3D new_state;
>  	memory_barrier();
> =20
> @@ -435,12 +441,15 @@ int ivshmem_init(struct cell *cell, struct pci_devi=
ce *device)
>  	}
> =20
>  	link->peers++;
> -	ive =3D &link->eps[dev_info->shmem_dev_id];
> +	ive =3D &link->eps[id];
> =20
>  	ive->device =3D device;
>  	ive->link =3D link;
>  	ive->shmem =3D jailhouse_cell_mem_regions(cell->config) +
>  		dev_info->shmem_regions_start;
> +	if (link->peers =3D=3D 1)
> +		memset(ivshmem_map_state_table(ive), 0,
> +		       dev_info->shmem_peers * sizeof(u32));
>  	device->ivshmem_endpoint =3D ive;
> =20
>  	device->cell =3D cell;
>=20
> Jan
>=20

--=20
Linutronix GmbH | Bahnhofstrasse 3 | D-88690 Uhldingen-M=C3=BChlhofen
Phone: +49 7556 25 999 0; Fax.: +49 7556 25 999 99

Hinweise zum Datenschutz finden Sie hier (Informations on data privacy
can be found here):
https://linutronix.de/kontakt/Datenschutz.php

Linutronix GmbH
Firmensitz (Registered Office): Uhldingen-M=C3=BChlhofen
Registergericht (Registration Court): Amtsgericht Freiburg i.Br., HRB700 80=
6
Gesch=C3=A4ftsf=C3=BChrer (Managing Directors): Heinz Egger, Thomas Gleixne=
r

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/a7fddcbd-97ff-79dd-a80f-43bb703dceb5%40linutronix.de.
