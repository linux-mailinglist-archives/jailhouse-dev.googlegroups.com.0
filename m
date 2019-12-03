Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB4UWTDXQKGQEIJCGNGY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAEA10F881
	for <lists+jailhouse-dev@lfdr.de>; Tue,  3 Dec 2019 08:14:59 +0100 (CET)
Received: by mail-ed1-x53c.google.com with SMTP id y23sf1378400edt.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 02 Dec 2019 23:14:59 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1575357299; cv=pass;
        d=google.com; s=arc-20160816;
        b=uzSDS17lcfF97eAmaRjOlkfrraqJpLKVNs1JnYORCeajh/T5Jm+AYv4rRSor387ja4
         zksZJ1Qb2ud2ranE5iamB3Ar/YQTS0CD/rYZrsWn/BI0gDTQYDNM4w0SqnTYGol1fcXl
         MUk5Wc1plB2bl7nvFQ4PDUl476hWLopsd+h1Xx8m6XH/h0z19Ne1iIIoRpzxfHEYMhqL
         7PS433i5VXESe7GjpoVYrEYoB/up3qg8oHtzbjflWgt7Wm5OUkU7wW6l+eIlOy0jGAWq
         QBIO5OXenJsXf8gxb6MdYgRcjMPH62wyjqgyTstaaqNtHqjh5LaRhWaBoR6VJwJpQsSt
         c5Ng==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=h3eiGFpITjgi8mEBxeEIcII8XtyYyYvPu5+f0HtWWa0=;
        b=iK2V5l/dDQpYCylEoJp/nDJphTJ4gvA/bIIOhubUAAnZvhpFcKzqpKwUT4oujtxU6W
         L873gyb9lXOTh9oNkl7QfBKt/YozffWCXxLx1TqYzsFnX7T753tIYuPN+paY0XlX3YkI
         u45YGYpLe341nayY0eD3/hCPLr9M1UX33HRYaMiPRMzqezdSxW2EbgD7kXSUPwT/MPuG
         li3ABCw0ISOAyfSB2usfrpNzuY1EPKoK7NT4VVR5TSXMW7YuC/zVYu9yUTEl9Q/3p90B
         7rZIcKB7ZjNySqtF66ew3aA1ubEUucn6yB8o6xC6b4MPAR2Dbete68UYHpjRLsTSrGSl
         YIZw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=h3eiGFpITjgi8mEBxeEIcII8XtyYyYvPu5+f0HtWWa0=;
        b=CiyamiyLNeu01K83zCSe8YPSeFddRV4eUtkPADHG31ghRGRv+yF9pmQPLnnW6oupek
         BdNZyxIuTiCu2aw089wr1ZCkhPNf3GBdjByOto3R8lWwgk5w1ZfJhKXzwyWJfy70/IxE
         0dDgMzXj8VUa2bwF5LlxLLtCGGr/tl+QtNJopxkw25EG1RzxpgKCIr1opOqVNXn/HeeA
         dpGd/qFn1VLWOA3Ggua+5YRcb/za2tG3/5I9K66omTCdOJCQy2fMP9hAGaih51HfWjY9
         sZ37qM5yGT7q7HUd8GhUdtDu6tiX5Kb6y1Fg1n/Y30WdiGBPVsVvCmZDiPQhm8KdoOHY
         eHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=h3eiGFpITjgi8mEBxeEIcII8XtyYyYvPu5+f0HtWWa0=;
        b=SJM4t69XEMA5xYKoBwNkSnVBnGBetQUM28EW+sz3aiSvyCB248yzt84+wzJDm5aegu
         7K0eWvHiuQCBGOH+JYMwmXyJLkF+gOD2zn51Z/AAjffLdQ5pZN3lQWQ4rrYA0+ky5g4m
         QWdW+bMe+tutOa1rOiuR7w8e06TFpvhwaqrDCYRxrX1ub9YUEMd0zcUNeqVOIhvLfi7v
         fDEtP4lguRjIuB3PLRlzJVF4xr/LUMp5OsdoiN+DWwGP4fu4T6pbM+ZiOVcZdgfYdk86
         vJUm4jyFrAjyZw4+K0C7ycHdqUAtycNq2I7tYdJGSQ2FnE2jhwumLNggtu46LOV532Lp
         hJHg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUsAXl8CctP/OQy34rjJlZ1gUDv/c5eoTK+aVLqR1i5AHt/x/UG
	foofezHGPIFDYheQzh3U59o=
X-Google-Smtp-Source: APXvYqwvvwk+mEDFlCEFlBSKbU+2gYPXH5aejad6PJNbBVZwIReJVUB0Q09aWU+dCsRSuE5LAZ/KZw==
X-Received: by 2002:a17:906:2296:: with SMTP id p22mr4416604eja.269.1575357299159;
        Mon, 02 Dec 2019 23:14:59 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:bb01:: with SMTP id jz1ls570693ejb.0.gmail; Mon, 02
 Dec 2019 23:14:58 -0800 (PST)
X-Received: by 2002:a17:907:444c:: with SMTP id on20mr4383544ejb.115.1575357298421;
        Mon, 02 Dec 2019 23:14:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575357298; cv=none;
        d=google.com; s=arc-20160816;
        b=wQJl5jjjP6cNp8+e+xMu5Uf/OVY9fxHuRk+jExnSdNW4yQvN1pFSjItuOBhaYqOOvu
         fkojb9mRmA0B7sk1oXgZLaxSYr60MJxXw/6yrTazb/mfuBhsCRHc4lhlSc/wqta8FbSk
         CGJpiC9I/yh1D3DY/ZhqhR0+4rHyPD0ldciJdzDx5s9aoJ/jxw+z05rJIpSDWUxosjgF
         KM7hO+LwjTLVPTFXmrdJbAGy5ErcdLH9TcfQI2PWgOgooHjsRYbW5jTFIuDMNCap1It2
         oXybj0qsuoksP7ClX7EAHNIke2iMqeZYA1ezA7MUMMe8WYlJ5k/mIALzVBXlOPQTCIRY
         94xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=vFb24+rVZqXF7RzyLxQi4F/SA5vKdYQAkD/N9qIQIQo=;
        b=ic+5R5A5gG3dXR3g6p8QKdspYvftPrwdE4dbeuiKw8RMmq7aji3J99PEV97ZSaNpr/
         HU25jmJ7ZopXOFXgAet3WnA0i/06hlQ/nAoqQZfItDm7v8PBxm4T634fd1kZ4oS5ng8z
         Ef8ntpsBG96SVzg+BSaNXGe9Cz+Awz1O/TaefHikFz+jAtUS/A6ZOislLeD4+R7d4/6F
         63LdEf7i+CgdPsHB3eTgisNmKiaGcP2uiqR8B/PDeoygqJSnHAYIQKD9JLCHs69Aib+5
         PEIG/gE6Pz8eXgElY9T4E7BHgSPAKFhKaEysP9q8SMT7t8cyvhTCBWH5sBwx/EG1Qb8x
         eLFg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id m13si114395edq.4.2019.12.02.23.14.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Dec 2019 23:14:58 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id xB37Euf8022422
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Dec 2019 08:14:57 +0100
Received: from [167.87.39.168] ([167.87.39.168])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id xB37EtoJ008189;
	Tue, 3 Dec 2019 08:14:55 +0100
Subject: Re: [RFC][PATCH 0/3] IVSHMEM version 2 device for QEMU
To: Liang Yan <LYan@suse.com>, qemu-devel <qemu-devel@nongnu.org>
Cc: Markus Armbruster <armbru@redhat.com>,
        Claudio Fontana <claudio.fontana@gmail.com>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        "Michael S . Tsirkin"
 <mst@redhat.com>,
        Hannes Reinecke <hare@suse.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <cover.1573477032.git.jan.kiszka@siemens.com>
 <efd5fa87-90de-fccc-97a5-a4fc71a050c8@suse.com>
 <fb213f9e-8bd8-6c33-7a6e-47dda982903d@siemens.com>
 <0c6969db-848f-f05b-2dc0-589cb422aa56@siemens.com>
 <877b0cd9-d1c5-00c9-c4b6-567c67740962@suse.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <8397c8c4-eeda-1805-ada3-6ca0155ee63d@siemens.com>
Date: Tue, 3 Dec 2019 08:14:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <877b0cd9-d1c5-00c9-c4b6-567c67740962@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 03.12.19 06:53, Liang Yan wrote:
>=20
> On 12/2/19 1:16 AM, Jan Kiszka wrote:
>> On 27.11.19 18:19, Jan Kiszka wrote:
>>> Hi Liang,
>>>
>>> On 27.11.19 16:28, Liang Yan wrote:
>>>>
>>>>
>>>> On 11/11/19 7:57 AM, Jan Kiszka wrote:
>>>>> To get the ball rolling after my presentation of the topic at KVM For=
um
>>>>> [1] and many fruitful discussions around it, this is a first concrete
>>>>> code series. As discussed, I'm starting with the IVSHMEM implementati=
on
>>>>> of a QEMU device and server. It's RFC because, besides specification
>>>>> and
>>>>> implementation details, there will still be some decisions needed abo=
ut
>>>>> how to integrate the new version best into the existing code bases.
>>>>>
>>>>> If you want to play with this, the basic setup of the shared memory
>>>>> device is described in patch 1 and 3. UIO driver and also the
>>>>> virtio-ivshmem prototype can be found at
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0
>>>>> http://git.kiszka.org/?p=3Dlinux.git;a=3Dshortlog;h=3Drefs/heads/queu=
es/ivshmem2
>>>>>
>>>>>
>>>>> Accessing the device via UIO is trivial enough. If you want to use it
>>>>> for virtio, this is additionally to the description in patch 3
>>>>> needed on
>>>>> the virtio console backend side:
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 modprobe uio_ivshmem
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 echo "1af4 1110 1af4 1100 ffc003 ffffff" >
>>>>> /sys/bus/pci/drivers/uio_ivshmem/new_id
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 linux/tools/virtio/virtio-ivshmem-console /d=
ev/uio0
>>>>>
>>>>> And for virtio block:
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 echo "1af4 1110 1af4 1100 ffc002 ffffff" >
>>>>> /sys/bus/pci/drivers/uio_ivshmem/new_id
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 linux/tools/virtio/virtio-ivshmem-console /d=
ev/uio0
>>>>> /path/to/disk.img
>>>>>
>>>>> After that, you can start the QEMU frontend instance with the
>>>>> virtio-ivshmem driver installed which can use the new /dev/hvc* or
>>>>> /dev/vda* as usual.
>>>>>
>>>>> Any feedback welcome!
>>>>
>>>> Hi, Jan,
>>>>
>>>> I have been playing your code for last few weeks, mostly study and tes=
t,
>>>> of course. Really nice work. I have a few questions here:
>>>>
>>>> First, qemu part looks good, I tried test between couple VMs, and devi=
ce
>>>> could pop up correctly for all of them, but I had some problems when
>>>> trying load driver. For example, if set up two VMs, vm1 and vm2, start
>>>> ivshmem server as you suggested. vm1 could load uio_ivshmem and
>>>> virtio_ivshmem correctly, vm2 could load uio_ivshmem but could not sho=
w
>>>> up "/dev/uio0", virtio_ivshmem could not be loaded at all, these still
>>>> exist even I switch the load sequence of vm1 and vm2, and sometimes
>>>> reset "virtio_ivshmem" could crash both vm1 and vm2. Not quite sure th=
is
>>>> is bug or "Ivshmem Mode" issue, but I went through ivshmem-server code=
,
>>>> did not related information.
>>>
>>> If we are only talking about one ivshmem link and vm1 is the master,
>>> there is not role for virtio_ivshmem on it as backend. That is purely
>>> a frontend driver. Vice versa for vm2: If you want to use its ivshmem
>>> instance as virtio frontend, uio_ivshmem plays no role.
>>>
> Hi, Jan,
>=20
> Sorry for the late response. Just came back from Thanksgiving holiday.
>=20
> I have a few questions here.
> First, how to decide master/slave node? I used two VMs here, they did
> not show same behavior even if I change the boot sequence.

The current mechanism works by selecting the VM gets ID 0 as the
backend, thus sending it also a different protocol ID than the frontend
gets. Could possibly be improved by allowing selection also on the VM
side (QEMU command line parameter etc.).

Inherently, this only affects virtio over ivshmem. Other, symmetric
protocols do not need this differentiation.

>=20
> Second, in order to run virtio-ivshmem-console demo, VM1 connect to VM2
> Console. So, need to install virtio frontend driver in VM2, then install
> uio frontend driver in VM1 to get "/dev/uio0", then run demo, right?
> Could you share your procedure?
>=20
> Also, I could not get "/dev/uio0" all the time.

OK, should have collected this earlier. This is how I start the console
demo right now:

- ivshmem2-server -F -l 64K -n 2 -V 3 -P 0x8003
- start backend qemu with something like
  "-chardev socket,path=3D/tmp/ivshmem_socket,id=3Divshm
  -device ivshmem,chardev=3Divshm" in its command line
- inside that VM
   - modprobe uio_ivshmem
   - echo "110a 4106 1af4 1100 ffc003 ffffff" > \
     /sys/bus/pci/drivers/uio_ivshmem/new_id
   - virtio-ivshmem-console /dev/uio0
- start frontend qemu (can be identical options)

Now the frontend VM should see the ivshmem-virtio transport device and
attach a virtio console driver to it (/dev/hvc0). If you build the
transport into the kernel, you can even do "console=3Dhvc0".

>=20
>=20
>>> The "crash" is would be interesting to understand: Do you see kernel
>>> panics of the guests? Or are they stuck? Or are the QEMU instances
>>> stuck? Do you know that you can debug the guest kernels via gdb (and
>>> gdb-scripts of the kernel)?
>>>
>=20
> They are stuck, no kernel panics, It's like during console connection, I
> try to load/remove/reset module from the other side, then two VMs are
> stuck. One VM could still run if I killed the other VM. Like I said
> above, it may be just wrong operation from my side. I am working on
> ivshmem-block now, it is easier to understand for dual connection case.
>=20

As I said, would be good to have an exact description of steps how to
reproduce - or you could attach gdb to the instances and do a some
backtraces on where the VMs are stuck.

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
jailhouse-dev/8397c8c4-eeda-1805-ada3-6ca0155ee63d%40siemens.com.
