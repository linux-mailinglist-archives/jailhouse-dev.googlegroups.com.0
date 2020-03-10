Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBEPHT3ZQKGQEGUE3DVQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id DC84A1801F1
	for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Mar 2020 16:34:41 +0100 (CET)
Received: by mail-wr1-x440.google.com with SMTP id q18sf6929728wrw.5
        for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Mar 2020 08:34:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1583854481; cv=pass;
        d=google.com; s=arc-20160816;
        b=hwA6PTJ92CRZB6rijD3Zq76FMbz53zHtP863vMvr1a25Dh9rfoSuXYv9nDyhl3FxtD
         QlAcZEetv9Y/x/cEPI7RKmonSBv0Ixy1xf9F4KwlseNnaJETqKL7qr3Uug8gqpw8INxq
         8vJWX/7SZyKxV166uC8n1+UlR8NNmQOBBmeL8smg++ICEo5+4hGpWMYmEWkjxGJpWz09
         uN1GBvmOnfP6IT8VLiWxjVYYJAw1VRopxIOwLToJ1uYkjyMvYZPxP4bEBySaEYeQHJE0
         tnfUmWKYaYTNWEfinzIQD6hldSwQyH5+gV6sJ81hNna10klFESIDlXn39jDppVlLT6cO
         ZrfA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:sender:dkim-signature;
        bh=Kr39KNUGye34vNh2TvOH8k1vsvj7iOl9kfDJxhCK+II=;
        b=ETJEGqwHgwIV/0oI1NmdFOhbKjAv/+7T9gIJoa3RtbOCPIzyjmWxSDS+egJXdNzE68
         pqLa9c5hLG3kJFUhGDOFBFxmoQF50mQ0J6Q1+GaxlV4ibF0NyDQJrlpWmlQ8zMLbwit/
         THH7GSkWxSiKN/Rf83+iMPohq9IeotWGzaNGoMW0ALJuHS2AuoqxAcKOt7dDD/rtn2Tl
         USIMsQ7/YjEpYJSpUBaQPyfAvBxORoKci0IVTlv/3mw7oj9KOYEJbVojTiuoiizkPHCF
         LC0bZMSQ9SabHn+pbO6w5EwWRsJtumMxifO83suKzARzxiy57fDidJC/e146pIfRPtUj
         MLEA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Kr39KNUGye34vNh2TvOH8k1vsvj7iOl9kfDJxhCK+II=;
        b=dzfQiCruRYOpVOVGofFY0S6TUDZGhZaneR+i5hhLXSDtM+7x/+LLnOp7AnsK2xHKX3
         6SNYH80ViiQ8Oa9Cx/2I7OhKrfp2V8Ol1Qu4QzkI+LrNRf968U9YGsgmx00BD3+BLlql
         rjOwJCOzMEYURd77epdC8EAjS1BZVbkz3sXk6QVfje2oxhkn+XsflOOMfzrmc68qzvAr
         EAr2qedE8eP3+scGvBaT1vEWAUfShRwSkop3NMvhOBknRa2TFEMt6p+xXGn0gq8LHCKi
         vaNFlEkimi6frQWXlRBtKxsnFcOrpvRdrYTkTt6CFZ0cgDdgZJNQEioLUzFvMEmAopZd
         2Jgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Kr39KNUGye34vNh2TvOH8k1vsvj7iOl9kfDJxhCK+II=;
        b=pLlxttU2W24Jhj64CPwP+D+vTcM6Wm9hFuKuNWDvjKsWskFV3yFpvPmj9VtWjXlE+6
         KyXzTXWBJYaGYUyE8eVI4NUIAmYPVYFcqlnCoVpNANt4VTOG6QwwjJysM1JzgwnaTfWP
         3oSDsMEzsGxg7sjg8ZSpIoMi09Qxdpkt2nO63rZ5EK23yjvxwpsys93kpUCLgkb4Wi8W
         guZDpWChXd8B6g11djDiQfhsUOH/L89zosT8TH1dHiUFwhVKXrXEKNJcVYCKXJq5DmDr
         D4FyeLmw/Bsof+PZpGbN72/UeCWX+7nXAseT/r2Yv4w5S70XIqQP64bKwqBDDrKscfaY
         P/2Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ2uKkTjXMV/HvQpYKK3DIkmL/TbTLMaBvBHRGa4YNBYKE3BFKtK
	11/XZLSuxordDsgznwwYHhc=
X-Google-Smtp-Source: ADFU+vvXBTYpVX4FnSHoKiqE2VKcU+RgFTKWE2vmiPYgS2meE2fHu/J3IYorVIOPu9vJTrdUfeUy/w==
X-Received: by 2002:a1c:20c6:: with SMTP id g189mr2813424wmg.163.1583854481535;
        Tue, 10 Mar 2020 08:34:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c4c6:: with SMTP id g6ls516863wmk.0.canary-gmail; Tue,
 10 Mar 2020 08:34:40 -0700 (PDT)
X-Received: by 2002:a05:600c:20c9:: with SMTP id y9mr2866858wmm.83.1583854480785;
        Tue, 10 Mar 2020 08:34:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583854480; cv=none;
        d=google.com; s=arc-20160816;
        b=RTYIG2MopBaun/9mnwj+3r1JO8MHaxNSe6urMuQY8YFwN3mmlqXxPD9u3uaqyI85Zq
         kHkVI/mmVRoPiI97+3dnbGLa/xF5pFm0gclzYwUcslHEvqczXWTbfyziEPVT/NRjfFGA
         EWYvUlrMmJSExpN6Hke3AAALTIMBsOqXxu7REug/WBHjeFdJn/+EBalrTMg+1vENUwUF
         1T4+Lu2QgKxW1CYK+qp7rvJ7I5ZUoimMg+cOoX3IXIgyr7wdOu9003S6T+z03+1AmQ22
         Q763gji4Rrfhlmcodh34NbSnOa0xPipxiLfDri0rkG1LyaBFCB1v0871ZUln/MoHyfJ6
         GGOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject;
        bh=AoUwkKO44Qx5UhM4UoV5f1onKIO7SvOiq6Ii7aKJNnU=;
        b=uEF7vG5j+bjiOfAckrMC2DAQQD6vkutRfY6Glh6veaHIoDPdGw5bilNBL3VGscM4HK
         ZaCCYSy5UptzCtqSXwN0Gxsfg/1V7BxXRl8wSX/LaMDBIsqMrMrS6Hmbm5mGjzwTLCIR
         0myyHlS3Qjlwt7YJ4MMvwXpm3VIRfQGLqUx75F9WynPM/VuRyRJibZheY7/1IhleL7BD
         R/G7Xz5y92XyE6ht2K0DEjoPEBPuuziR35X2FnYe354IB0fNqIcdSRX4DBUuTQ1hfR/w
         mAiipzaG3YQhB3fZCCJP6DOrS+mPBOLS6hGPCuCVVAbz9OYmNGRHCrZV1iaYBfCA0ZFv
         7jew==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id n3si357802wrs.3.2020.03.10.08.34.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Mar 2020 08:34:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 02AFYeOB030820
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Mar 2020 16:34:40 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 02AFYepp030507;
	Tue, 10 Mar 2020 16:34:40 +0100
Subject: Re: virtio-ivshmem-*: only works on the 2nd try
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Philipp Rosenberger <p.rosenberger@linutronix.de>,
        jailhouse-dev <jailhouse-dev@googlegroups.com>
References: <0203ac1b-87f4-177c-1fcd-c6e10d3d5dfd@linutronix.de>
 <8823c273-a3b9-4719-caa9-6791dd6a01a7@siemens.com>
Message-ID: <5f6ae796-572a-9dbd-93b3-223fbcf7d3a6@siemens.com>
Date: Tue, 10 Mar 2020 16:34:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <8823c273-a3b9-4719-caa9-6791dd6a01a7@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 10.03.20 16:08, Jan Kiszka wrote:
> On 10.03.20 15:41, Philipp Rosenberger wrote:
>> Hi,
>>
>> I have managed to get virtio-ivshmem console and block running. But I
>> observed a strange behavior. I do the following:
>>
>> 1. Boot up the board.
>> 2. Enable the rootcell.
>> 3. echo "110a 4106 110a 4106 ffc002 ffffff" > \
>> =C2=A0=C2=A0 /sys/bus/pci/drivers/uio_ivshmem/new_id
>> 4. virtio-ivshmem-block /dev/uio0 /path/to/disk.image
>> 5. boot linux-inmate
>> 6. virtio-ivshmem 0000:00:0f.0: backend not ready
>> 7. kernel panic
>>
>> If I redo the sets 4 and 5 the inmates starts as expected and I can
>> access the disk.image via /dev/vda.
>>
>> I found, the the virtio-ivshmem-block tool waits for an interrupt if
>> 'state[peer_id] !=3D VIRTIO_STATE_RESET'. But there is no interrupt.
>=20
> The state memory should be zeroed, provided the peer is not running. You=
=20
> will only get an interrupt during the peer setup when it switches it=20
> state from (expected) RESET to READY. Maybe we miss some proper=20
> initialization of the shared state memory in Jailhouse.
>=20
> Can you confirm that the state memory is in a random state on first=20
> startup? And that it changes as expected for the peer to READY once the=
=20
> non-root Linux boots?

Does this help?

diff --git a/hypervisor/ivshmem.c b/hypervisor/ivshmem.c
index 22283a85..a5cdcf93 100644
--- a/hypervisor/ivshmem.c
+++ b/hypervisor/ivshmem.c
@@ -101,13 +101,8 @@ static void ivshmem_trigger_interrupt(struct ivshmem_e=
ndpoint *ive,
 	spin_unlock(&ive->irq_lock);
 }
=20
-static void ivshmem_write_state(struct ivshmem_endpoint *ive, u32 new_stat=
e)
+static u32 *ivshmem_map_state_table(struct ivshmem_endpoint *ive)
 {
-	const struct jailhouse_pci_device *dev_info =3D ive->device->info;
-	u32 *state_table =3D (u32 *)TEMPORARY_MAPPING_BASE;
-	struct ivshmem_endpoint *target_ive;
-	unsigned int id;
-
 	/*
 	 * Cannot fail: upper levels of page table were already created by
 	 * paging_init, and we always map single pages, thus only update the
@@ -115,9 +110,20 @@ static void ivshmem_write_state(struct ivshmem_endpoin=
t *ive, u32 new_state)
 	 */
 	paging_create(&this_cpu_data()->pg_structs,
 		      ive->shmem[0].phys_start, PAGE_SIZE,
-		      (unsigned long)state_table, PAGE_DEFAULT_FLAGS,
+		      TEMPORARY_MAPPING_BASE, PAGE_DEFAULT_FLAGS,
 		      PAGING_NON_COHERENT | PAGING_NO_HUGE);
=20
+	return (u32 *)TEMPORARY_MAPPING_BASE;
+}
+
+
+static void ivshmem_write_state(struct ivshmem_endpoint *ive, u32 new_stat=
e)
+{
+	const struct jailhouse_pci_device *dev_info =3D ive->device->info;
+	u32 *state_table =3D ivshmem_map_state_table(ive);
+	struct ivshmem_endpoint *target_ive;
+	unsigned int id;
+
 	state_table[dev_info->shmem_dev_id] =3D new_state;
 	memory_barrier();
=20
@@ -435,12 +441,15 @@ int ivshmem_init(struct cell *cell, struct pci_device=
 *device)
 	}
=20
 	link->peers++;
-	ive =3D &link->eps[dev_info->shmem_dev_id];
+	ive =3D &link->eps[id];
=20
 	ive->device =3D device;
 	ive->link =3D link;
 	ive->shmem =3D jailhouse_cell_mem_regions(cell->config) +
 		dev_info->shmem_regions_start;
+	if (link->peers =3D=3D 1)
+		memset(ivshmem_map_state_table(ive), 0,
+		       dev_info->shmem_peers * sizeof(u32));
 	device->ivshmem_endpoint =3D ive;
=20
 	device->cell =3D cell;

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/5f6ae796-572a-9dbd-93b3-223fbcf7d3a6%40siemens.com.
