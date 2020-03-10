Return-Path: <jailhouse-dev+bncBAABBDHMT3ZQKGQE3QTV4SA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4EB18022A
	for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Mar 2020 16:45:17 +0100 (CET)
Received: by mail-ed1-x53d.google.com with SMTP id y10sf1229026edw.23
        for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Mar 2020 08:45:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1583855117; cv=pass;
        d=google.com; s=arc-20160816;
        b=KzmfkG6+X6sxNovQoRc9FypFcmGBhFzaXOQNUYQ9RMXAv9ozHn+jiLUOwekkuSroES
         jHrKOAxyT1/mYWoOEL0lputElINuBpVzbXbTYWtiaplU3uu4ZWegl0WMkWwdl4f6vXRy
         /qe/0bU6qzLhplg8d+ZnEQ1wAPVJJVafaJJSh6Qu5VrdFjC2zjg5UfYG1GOHlK51a8Hq
         7w7C7LQKFxiP7emiZWUpwGGvRbvdDBxIezWKxsI6m/a/6iCIGyxOFGDG7Di4NIiqAhEv
         +ciwcr60mUc19bjhvDapy/C1qmiKOlEteSKyIKOi7ScDo19ABtfVsYCR3YDntfK09ihZ
         OcOw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:autocrypt:from:references:to:subject:sender
         :dkim-signature;
        bh=8rvl9U7eMIcMJXZB3Afw3DdaqhPaf1T+qthRH5VHTxA=;
        b=G4k8pgWhpdelXCsk8CXSoLhL50sp71lhDua16QFRQsvfCXUafdbuqkXBZUdq2aljuT
         k8OpiD/XsQUkigqubQ7+s0APfF5mKD3wZ9P/bbspQh4KYJiLlY7abwt26wUOLWYWP4ZD
         IEArMAwdu+sHvXni7VXHzy8MSa8RKT6AEyFMjvbDWU55l3dnCmsBaelaqou+mgXV8pZI
         g1iGPpWBnqVQwOkLKeyTYLOME9QKgoxu2lymWJsARVVkKCfb5ehGjzltuAuKARLswREd
         Xz7gyj3B6o1OsqUJjBJ2QgDSn2RuXwjWxrBFWLUl21EyDJLwU4ylgBfuf03jfZPJC6s1
         nf9Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: best guess record for domain of p.rosenberger@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=p.rosenberger@linutronix.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:organization:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=8rvl9U7eMIcMJXZB3Afw3DdaqhPaf1T+qthRH5VHTxA=;
        b=SyV8pVeQlj1Pmh+XRVnq5WEYJ68k/n0tmMYkmKGb2/x92ybeZFhPYJV2Y+7+3zXP0w
         1ga/8fSIO+OxlydS72p+UUWGO+65KR1yQHP1D09CiliptpP8AfU9YNjJjNlhNakS790o
         XHA2voLiDsAQ4k/BE9bDhPMUEI/74NkrDC70hNO/QI9erVAkiskWVPE3XBBF/LLabuis
         JDSNIwIlhmyJpsuW3b2UDk83ay59Ti5nZJ82xgl8e3Hnq4rDnblGJMn9sPjlKlJZiRUR
         yWx6JZdRaqMK099jgoGzLBAfamGnTSJkuFsDE96qdxRCIWCMww+yP40/aKDQH2mvcFLw
         92ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8rvl9U7eMIcMJXZB3Afw3DdaqhPaf1T+qthRH5VHTxA=;
        b=ueC2fZLzpjPsWaYYST98ZzaMr0xBlrbCe296DmOW6lHu0fT/fw5fA8+KjWzsVy8VLP
         /bGkl7QGt+Gea6vWcsGVvKFawLA37qaSn0nEYKydc4bzRO9w1VcwGF7v9i3Yykk9BQvA
         d/mC2G3LL5BebQvLnV6alL296FBHhCk4+oUcsOJkjdeGI3iKq+b6LlzUHJCdJfPKrdm9
         OWS7sfwqANTx2tby6RQ0V3XMoRKArtk5NSHtyl+OinNZlQpczlbNAgG1pLW/HCKePpzc
         0DDLNWkD3PlegleitECgYqYN7azMUIF9j6tYDzIjrc/s2lm7gg+6eW8lBhaUIeTYirF5
         4w5g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ3nqcOj2P5y6Ryj2ZKMc3raZMu1ww2t0CyPbYodtLVIrepyWFpT
	HB4V9Wf6gLzDrj2s6ylyxsI=
X-Google-Smtp-Source: ADFU+vsuA2nEpl57ENwB65jtZ18AuBxv5wozC2oYmH7N4Yh9WsMVlF3juvjWfkn+NbQZkz6k1tR+LQ==
X-Received: by 2002:a50:baef:: with SMTP id x102mr10966689ede.238.1583855117125;
        Tue, 10 Mar 2020 08:45:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:416:: with SMTP id q22ls10007418edv.10.gmail; Tue,
 10 Mar 2020 08:45:16 -0700 (PDT)
X-Received: by 2002:aa7:c2cc:: with SMTP id m12mr11774888edp.11.1583855116485;
        Tue, 10 Mar 2020 08:45:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583855116; cv=none;
        d=google.com; s=arc-20160816;
        b=eRJ6SfdtHFqMOHsyl5GMB1/99MKeC6LTHDlQsoqeFx/Ynt/He93h85HTU9s2cLGETi
         6dIv/zYgFcVYUYbcX9Hj5f/py05JN+Ioj5tNOi0O5hLeWPyp87L4m72YS4ywOXzZq5tX
         9zn+1qjX/zKDq/lnFm8HnK9nWwhGMVXteQTRNQpqk23i+/jolYc13d62CNERcv9dXvOk
         ETTtiygaoUZhtGAx/YDk/+R1My+7VCkTeaWSxPY8+G1vioJOynHJviB3cB1Ag6sux7BD
         z62f4xAe7k6jXmZMSyZOkLSJDzhHkwJk7qSaueDZgw1+p31vS2llIFprKembOrUNwFd4
         4KVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:from:references
         :to:subject;
        bh=6Q63Ce1ROyvqYwUBG/PSCQixHOy9jklVF2+mVoW0LJM=;
        b=wrnCkErcWQqppGUcfAQL8j0bKNe4g0tHX4Ae+i3lyQvxT+g13qX6ZWUhX1OGALpJaJ
         eYwLLXijgiXCpeVKJzjJWAnfaedRUkzifscfvti/LXSM64KMA/tCPAuXVo02DzUD3akw
         VQkTkyB7nBxBsT9t3c59XpaVl6cTpvUsSGRWV3rwEzUrd3uozBsV74WNgMemYWiMThVl
         3Vik2sBSSqmKqDuqhBmdWqTOAVozCRsX6JZCA/3eX+ulwDuhnQhS2fZWSBLCG+Al3kxM
         k8mJt+pCvB3Z2lI1O3EV4pdqB2ps2Nf2WbJz13vcjERU0BTvGcq5/Es0BSv4XbW1ThvR
         JI8Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: best guess record for domain of p.rosenberger@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=p.rosenberger@linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de. [2a0a:51c0:0:12e:550::1])
        by gmr-mx.google.com with ESMTPS id l21si420882edq.4.2020.03.10.08.45.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 10 Mar 2020 08:45:16 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of p.rosenberger@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) client-ip=2a0a:51c0:0:12e:550::1;
Received: from b2b-130-180-90-162.unitymedia.biz ([130.180.90.162] helo=[10.23.2.107])
	by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80)
	(envelope-from <p.rosenberger@linutronix.de>)
	id 1jBh4F-00061r-Mc; Tue, 10 Mar 2020 16:45:15 +0100
Subject: Re: virtio-ivshmem-*: only works on the 2nd try
To: Jan Kiszka <jan.kiszka@siemens.com>,
 jailhouse-dev <jailhouse-dev@googlegroups.com>
References: <0203ac1b-87f4-177c-1fcd-c6e10d3d5dfd@linutronix.de>
 <8823c273-a3b9-4719-caa9-6791dd6a01a7@siemens.com>
From: Philipp Rosenberger <p.rosenberger@linutronix.de>
Autocrypt: addr=p.rosenberger@linutronix.de; prefer-encrypt=mutual; keydata=
 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
 c7AAe3l97AutscBJpp+BBQBj4nPXfw==
Organization: linutronix GmbH
Message-ID: <3ab5ae7f-ebf4-8262-68e6-8d82470dd5e0@linutronix.de>
Date: Tue, 10 Mar 2020 16:45:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <8823c273-a3b9-4719-caa9-6791dd6a01a7@siemens.com>
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

Hi Jan,

On 10.03.20 16:08, Jan Kiszka wrote:
> On 10.03.20 15:41, Philipp Rosenberger wrote:
>> Hi,
>>
>> I have managed to get virtio-ivshmem console and block running. But I
>> observed a strange behavior. I do the following:
>>
>> 1. Boot up the board.

devmemdump 0x16f300000 0x1000 | hexdump -C | head
00000000  07 26 8b 17 4d 0f 2e 83  06 26 8a 17 4c 0f 2f a3
00000010  16 ae 9a 97 5c 8f 3f 03  36 97 bc 97 1c 8e 3f 82

>> 2. Enable the rootcell.

devmemdump 0x16f300000 0x1000 | hexdump -C | head -n 2
00000000  00 00 00 00 4d 0f 2e 83  06 26 8a 17 4c 0f 2f a3
00000010  16 ae 9a 97 5c 8f 3f 03  36 97 bc 97 1c 8e 3f 82

>> 3. echo "110a 4106 110a 4106 ffc002 ffffff" > \
>> =C2=A0=C2=A0 /sys/bus/pci/drivers/uio_ivshmem/new_id
>> 4. virtio-ivshmem-block /dev/uio0 /path/to/disk.image

devmemdump 0x16f300000 0x1000 | hexdump -C | head -n 2
00000000  00 00 00 00 4d 0f 2e 83  06 26 8a 17 4c 0f 2f a3
00000010  16 ae 9a 97 5c 8f 3f 03  36 97 bc 97 1c 8e 3f 82

>> 5. boot linux-inmate
>> 6. virtio-ivshmem 0000:00:0f.0: backend not ready
>> 7. kernel panic

devmemdump 0x16f300000 0x1000 | hexdump -C | head -n 2
00000000  00 00 00 00 00 00 00 00  06 26 8a 17 4c 0f 2f a3
00000010  16 ae 9a 97 5c 8f 3f 03  36 97 bc 97 1c 8e 3f 82

>> If I redo the sets 4 and 5 the inmates starts as expected and I can
>> access the disk.image via /dev/vda.

repeated step 4:
devmemdump 0x16f300000 0x1000 | hexdump -C | head -n 2
00000000  01 00 00 00 00 00 00 00  06 26 8a 17 4c 0f 2f a3
00000010  16 ae 9a 97 5c 8f 3f 03  36 97 bc 97 1c 8e 3f 82

repeated step 5:
devmemdump 0x16f300000 0x1000 | hexdump -C | head -n 2
00000000  01 00 00 00 01 00 00 00  06 26 8a 17 4c 0f 2f a3
00000010  16 ae 9a 97 5c 8f 3f 03  36 97 bc 97 1c 8e 3f 82

>> I found, the the virtio-ivshmem-block tool waits for an interrupt if
>> 'state[peer_id] !=3D VIRTIO_STATE_RESET'. But there is no interrupt.
>=20
> The state memory should be zeroed, provided the peer is not running. You
> will only get an interrupt during the peer setup when it switches it
> state from (expected) RESET to READY. Maybe we miss some proper
> initialization of the shared state memory in Jailhouse.
>=20
> Can you confirm that the state memory is in a random state on first
> startup? And that it changes as expected for the peer to READY once the
> non-root Linux boots?

I hope I have done this right. The 'state' is stored in the first
region. In my case '.phys_start =3D 0x16f300000'.

You can see how the first two 32 bit words change. The devmemdump tool
just maps /dev/mem at the given address and writes it to stdout.

I've tested the following after step 1 and it also worked:
# devmemdump 0x16f300000 0x1000 | hexdump -C | head -n 2
00000000  07 26 8b 17 4d 0f 2e 83  06 26 8a 17 4c 0f 2f 83
00000010  16 a6 9a 97 5c 8f 3f 03  16 a7 9a 96 5c 8e 3f 02
# busybox devmem 0x16f300000 32 0
# busybox devmem 0x16f300004 32 0
# devmemdump 0x16f300000 0x1000 | hexdump -C | head -n 2
00000000  00 00 00 00 00 00 00 00  06 26 8a 17 4c 0f 2f 83
00000010  16 a6 9a 97 5c 8f 3f 03  16 a7 9a 96 5c 8e 3f 02

Best regards,
Philipp

> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/3ab5ae7f-ebf4-8262-68e6-8d82470dd5e0%40linutronix.de.
