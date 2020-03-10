Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBJPPT3ZQKGQEJUQXMSI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BFC180271
	for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Mar 2020 16:52:06 +0100 (CET)
Received: by mail-wm1-x33c.google.com with SMTP id a23sf544089wmm.8
        for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Mar 2020 08:52:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1583855526; cv=pass;
        d=google.com; s=arc-20160816;
        b=hCwOtq7ssQw0R7S907TX9z8rIgJi8tSHJghDeyvXJsC+x+thA1z/iPa63eWlxdvBH+
         r24wyvX4B0c4S/x8x2J6F9t2WLqAP5JDoKKhPh4dZq2ou8gMwjN0ENMqHcyM/mifrtAV
         q29PgcS8ImIcgnEM15G5eSyVTUgF+wp9/QJ9k9vYu0zarigJw45+K09+AxBfZWnuMfg0
         rGgTIVG/O3Vjb602N6h8HWGZAHEPzF1vv61OkDd3ofMNddTQH+a7YCJeABFeE7BRz73y
         XZ6ca5JxLY1GQ9qamMRfUpnfTaecuVOl9FbmbdIKj4VHvvxnwKsse9bhU8276iiOkJH6
         49pw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=oxkSVU0+yPQtfWSdnJz/WvfqjmNXyG0Hr05hjtJD0Y0=;
        b=vOPV74mB3++MbomKoxIjEl4JLysAj6b8viKUlzR7jMcXYw3qy3Qr02eq9ET/cSbv6p
         a7ZDlRm57YHnoREQhFoH951zptyqwHKlTZsq8gmHYhsA/pFf06AxazHEP9M5n7LLxLMZ
         AuV40df4o0GCdP6h9iaf7Q9rYwBpUWD5gqKTS0Uz5K8oWKbIinKmvo1wvWImXCPAy91U
         BIOrTQR3rf0JUUSihhLq9c/KlggyeTMAhota3gIJv18ekYTaVEejiNxjAwnijhXFhNK/
         qOloukNBET/qsguRrg4VhhA13c4Lo2l7kvUGTrM5WCs6Dw1trxbXuoEmMqwKYGkyWsdR
         a0OQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=oxkSVU0+yPQtfWSdnJz/WvfqjmNXyG0Hr05hjtJD0Y0=;
        b=ULT4QcZJ/Pv+m2As93+RZGufwHR4LJFbzAeBNR4secSuzwBeuD0CDsWIaaWBjTdRdI
         Zhzt6/OO/+NdI8CclasIzUd5sB/ypgonmjBihDrzXUK+EECDQ9ogpPIqaZH2sMAbSzmz
         lgXlqqEy/uI9hxr5bPUKPozMf2CGJuLXK3F347FAwWMlDzkwlBa5W1+ix5oTMX8pW+vQ
         PJRq7QEW7/oerxX7dLjlzwSXpNp5S4c49BKe8cXKpr6nOlV/tSVXTEV5JKusTa/A0W9x
         X2Ava/wFy0AXJ0UR9nKdxB/iMBLnJEX0XT/hjzMqPRIEOhA51Gnnbi7qctNAcn+uGYvh
         7T1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=oxkSVU0+yPQtfWSdnJz/WvfqjmNXyG0Hr05hjtJD0Y0=;
        b=ZRaqdS1jUWZDISRLkpfdDCIBzrXdg1UIUaDXBTrKP5Zb8zq/QShzqQ8eQ74V27N8Ly
         U227vBni3u4jOJTQFv1h50WQx7yC4nlL0a9V2AbouKOXuxHULHIO4EjjQldjx4wA5xF0
         Zis/KKpE6LVMqDv2uTsu84nOoGqGaW3/evM4kCJW0uXbt33vH+Tvpow4L93TwHzUUn8Q
         1BGbJ7n4+B1SEeyQRJFNjbI92QpTRJ0zmlI5DYxX7MzLefYAWlHDAY56asKH6zhEx78I
         xucTT2RoWWcEgn3u6WZjKmN0YvojpReEkANixhJ1V88ulF5jpYf8m1Ne1rzmHQRozQEZ
         yWkw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ2mgVMqdeZW8pfGSp6rbdo1mp2wQuoVs9AiYpOtdz6dfdf9ZkXW
	nzS3NL8y2pCU45IdDhKVslU=
X-Google-Smtp-Source: ADFU+vuzE54iWQ498WGitz7kXYeyzajryj75ZscI4EUBlxwMFoa5Xg02WT5TwPsnk0PXuMXSTOdrGw==
X-Received: by 2002:a1c:5452:: with SMTP id p18mr2878498wmi.102.1583855525920;
        Tue, 10 Mar 2020 08:52:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:508e:: with SMTP id a14ls8119304wrt.2.gmail; Tue, 10 Mar
 2020 08:52:05 -0700 (PDT)
X-Received: by 2002:adf:fa50:: with SMTP id y16mr29172599wrr.41.1583855525100;
        Tue, 10 Mar 2020 08:52:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583855525; cv=none;
        d=google.com; s=arc-20160816;
        b=TdsGtIyjmDq0YsVqb115pQRtK2ssZMvedhb+hatNqVjTxVdoWhPzcjarqkl3FWi+EE
         zNOQMW9LNFTL9VLpsgCrpxYEOB0AlY/wjgmyHw+vVEjndZGIO4sbu4stcLFOjuJU8K3P
         hn80LtaU82BrEbn68ndotdBeeW6CVLEcZkrzMPK1U4jvBGHPAlryokOOLK9njKfznJEg
         f/Nr9HGBI1eS94VHMhAKlk2FgaYYXpA7rejOurFDTSIcRzjNqvckNZVU7RByvfkMfuYL
         ZVyjqsUHCucGBEDa3cKN5fsrybxjnBo7tYh32kruNLmxfjtVzDJWKwTjknKrP+47IkjZ
         Io1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=F9RpVa/xvZ3j42oqPnea7muC7u6mckahTOuA8YzcbZw=;
        b=juw1mfDixty3eZ653bjwCKprsXQbKheEigKvs8BJe/2BI9q57PGCn3HQUMwhPardbo
         72Z93XL4kojPTPIRXsVFqh4BkfVSuFJJT0jSLa4I5aZFTAHmkgw2cu7hNtp/SAu3xF8a
         s26VaUn1IiqTIDMWniPozkav965VSbNz0vIZmV0iwcHQ8OpOUtyjrwNu0nbDlqmsM3KE
         OLROth0xvG3hPXkdVUEtn1p7DOYLMPZK7SJzJGssiHN/E4VCZzA93S0FkP3XISGCwJAV
         2V82Meg0uR5sTaLUXArdjhKSa5UGGRk2n/wIJDcRiuqt336FJAa27Jh5iTBC2b2MiTaZ
         w3Yg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id l13si709884wrp.2.2020.03.10.08.52.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Mar 2020 08:52:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 02AFq4Z5024853
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Mar 2020 16:52:04 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 02AFq46A029157;
	Tue, 10 Mar 2020 16:52:04 +0100
Subject: Re: virtio-ivshmem-*: only works on the 2nd try
To: Philipp Rosenberger <p.rosenberger@linutronix.de>,
        jailhouse-dev <jailhouse-dev@googlegroups.com>
References: <0203ac1b-87f4-177c-1fcd-c6e10d3d5dfd@linutronix.de>
 <8823c273-a3b9-4719-caa9-6791dd6a01a7@siemens.com>
 <3ab5ae7f-ebf4-8262-68e6-8d82470dd5e0@linutronix.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <4f564fe0-2d1e-391d-6365-9fe3d1a3221b@siemens.com>
Date: Tue, 10 Mar 2020 16:52:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <3ab5ae7f-ebf4-8262-68e6-8d82470dd5e0@linutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 10.03.20 16:45, Philipp Rosenberger wrote:
> Hi Jan,
>=20
> On 10.03.20 16:08, Jan Kiszka wrote:
>> On 10.03.20 15:41, Philipp Rosenberger wrote:
>>> Hi,
>>>
>>> I have managed to get virtio-ivshmem console and block running. But I
>>> observed a strange behavior. I do the following:
>>>
>>> 1. Boot up the board.
>=20
> devmemdump 0x16f300000 0x1000 | hexdump -C | head
> 00000000  07 26 8b 17 4d 0f 2e 83  06 26 8a 17 4c 0f 2f a3
> 00000010  16 ae 9a 97 5c 8f 3f 03  36 97 bc 97 1c 8e 3f 82
>=20
>>> 2. Enable the rootcell.
>=20
> devmemdump 0x16f300000 0x1000 | hexdump -C | head -n 2
> 00000000  00 00 00 00 4d 0f 2e 83  06 26 8a 17 4c 0f 2f a3
> 00000010  16 ae 9a 97 5c 8f 3f 03  36 97 bc 97 1c 8e 3f 82
>=20
>>> 3. echo "110a 4106 110a 4106 ffc002 ffffff" > \
>>>  =C2=A0=C2=A0 /sys/bus/pci/drivers/uio_ivshmem/new_id
>>> 4. virtio-ivshmem-block /dev/uio0 /path/to/disk.image
>=20
> devmemdump 0x16f300000 0x1000 | hexdump -C | head -n 2
> 00000000  00 00 00 00 4d 0f 2e 83  06 26 8a 17 4c 0f 2f a3
> 00000010  16 ae 9a 97 5c 8f 3f 03  36 97 bc 97 1c 8e 3f 82
>=20
>>> 5. boot linux-inmate
>>> 6. virtio-ivshmem 0000:00:0f.0: backend not ready
>>> 7. kernel panic
>=20
> devmemdump 0x16f300000 0x1000 | hexdump -C | head -n 2
> 00000000  00 00 00 00 00 00 00 00  06 26 8a 17 4c 0f 2f a3
> 00000010  16 ae 9a 97 5c 8f 3f 03  36 97 bc 97 1c 8e 3f 82
>=20
>>> If I redo the sets 4 and 5 the inmates starts as expected and I can
>>> access the disk.image via /dev/vda.
>=20
> repeated step 4:
> devmemdump 0x16f300000 0x1000 | hexdump -C | head -n 2
> 00000000  01 00 00 00 00 00 00 00  06 26 8a 17 4c 0f 2f a3
> 00000010  16 ae 9a 97 5c 8f 3f 03  36 97 bc 97 1c 8e 3f 82
>=20
> repeated step 5:
> devmemdump 0x16f300000 0x1000 | hexdump -C | head -n 2
> 00000000  01 00 00 00 01 00 00 00  06 26 8a 17 4c 0f 2f a3
> 00000010  16 ae 9a 97 5c 8f 3f 03  36 97 bc 97 1c 8e 3f 82
>=20
>>> I found, the the virtio-ivshmem-block tool waits for an interrupt if
>>> 'state[peer_id] !=3D VIRTIO_STATE_RESET'. But there is no interrupt.
>>
>> The state memory should be zeroed, provided the peer is not running. You
>> will only get an interrupt during the peer setup when it switches it
>> state from (expected) RESET to READY. Maybe we miss some proper
>> initialization of the shared state memory in Jailhouse.
>>
>> Can you confirm that the state memory is in a random state on first
>> startup? And that it changes as expected for the peer to READY once the
>> non-root Linux boots?
>=20
> I hope I have done this right. The 'state' is stored in the first
> region. In my case '.phys_start =3D 0x16f300000'.
>=20
> You can see how the first two 32 bit words change. The devmemdump tool
> just maps /dev/mem at the given address and writes it to stdout.
>=20
> I've tested the following after step 1 and it also worked:
> # devmemdump 0x16f300000 0x1000 | hexdump -C | head -n 2
> 00000000  07 26 8b 17 4d 0f 2e 83  06 26 8a 17 4c 0f 2f 83
> 00000010  16 a6 9a 97 5c 8f 3f 03  16 a7 9a 96 5c 8e 3f 02
> # busybox devmem 0x16f300000 32 0
> # busybox devmem 0x16f300004 32 0
> # devmemdump 0x16f300000 0x1000 | hexdump -C | head -n 2
> 00000000  00 00 00 00 00 00 00 00  06 26 8a 17 4c 0f 2f 83
> 00000010  16 a6 9a 97 5c 8f 3f 03  16 a7 9a 96 5c 8e 3f 02
>=20

Yes, your logs look consistent with my theory, and my patch should fix it.

I suppose I tested too often in friendly virtual environments...

Thanks for reporting!
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
jailhouse-dev/4f564fe0-2d1e-391d-6365-9fe3d1a3221b%40siemens.com.
