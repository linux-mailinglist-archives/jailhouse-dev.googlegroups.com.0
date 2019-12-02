Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXOYSLXQKGQETDLEYBI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D9610E5E4
	for <lists+jailhouse-dev@lfdr.de>; Mon,  2 Dec 2019 07:17:02 +0100 (CET)
Received: by mail-wr1-x43e.google.com with SMTP id h30sf6352691wrh.5
        for <lists+jailhouse-dev@lfdr.de>; Sun, 01 Dec 2019 22:17:02 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1575267421; cv=pass;
        d=google.com; s=arc-20160816;
        b=wB09bDzaVaI+I77CvjNflqpUSPkRZqzxEjSrCs6iXRpaRwScsMLCjuOc80TSOnxRYm
         HyZgxHslD5Ge+PBi+U5F91bZ/pjFBBJpWGVN5io4YkCv1kuc8xJRhyX0IKYi6vrhJ5t8
         h4SmWkKYfJINycCe8dAOO25T7WK8g8XjArHooZ2w49HA37dLy8eg/aLSY4LIX1FTJnsW
         1cU0rjnNTLtRW641mwkYRIs+x1UaloBfcAZyFS4yxLN6/THaqaIiNh++SEv+0QiVR/u8
         GBirbKPIXZXUd1orIxT/BBWD0tt/EiOu6qmZ1Y6Zxp0c+sHbAiIHJ76lFzOirS6Ed1U7
         8hlw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:cc:to:from:subject:sender:dkim-signature;
        bh=6HfdVuf/RNqZFjAFl8ZO6E7pu/Gp/uSrqqwQqP/okZ4=;
        b=UfIlqk11xLQImhZNzWY3c/6m3YPUssd/vB/N8ZLKblpngkaid4Y5ju4kfPfV/BmjPR
         rqi/c0ZHNxVggM/mPGCtvb3eDgQE4cDwvY9JhTaZ7mFEdNOR0yNVt0UeJUr41nDqAa3n
         yf8KA1uFRGt8Wz4DqOge0Q0jy7r8YSyJLV0Wg/+Lp5bpKthfZ0Ot3C/VkS5MVK4AM72p
         jgNHb9ZNsNDj9oWAvYIVL7GbUM0Hp0NmlDZfp6r5yQ6xxfDxTGYpDifd4SqCvXz+bQNX
         5qsnNGyyB1Va60KSFsxzGXX/Ywzms73zX/4CufX7qs6DL36aZT5vjW0VVCuYZ6vjFx2j
         9PlA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6HfdVuf/RNqZFjAFl8ZO6E7pu/Gp/uSrqqwQqP/okZ4=;
        b=bNrdIKUNeH1di0+lVT8yfZz5XJv43RSDfdNR3jarqpyMGQiCAc6OnloFxE2o8RvJpB
         LmbXrcgpDQBjhZW/x0Byer9My8YN0hzDLnFrbTN+frFHioNvOh/to8xBhsuFjMOouOcz
         MU06Hk+0Tf5bEWLlObCBANgqyvRRVSz3rw0+IY8ESTGZTlkrhcE+VRvlGlZXcA+IUyA0
         Rq/lZH0nemBP+4FJexZ9XUnextC3CerHTk5/IAnzl9ktk5yyS0emHh92WDigioWxqbd0
         5AB+8CF1ns8F3WcoIFGXmCIcEthZd2Yq49SCZDZ3pr9vKTRzfGDyVIt6T+Av77zfrmTL
         dEiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:cc:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6HfdVuf/RNqZFjAFl8ZO6E7pu/Gp/uSrqqwQqP/okZ4=;
        b=cvFix6nLYPLhOzmiBuXR+UGygGsi/iD+cHWCKC+d8CltnIxz12XIlOT7Yqj9VJfpnN
         Ep2vxKiooHraaAkqODFAHdB4pmfVB8Perj3HHokzcJmhm2pNTCT9GJk8Cshe4rYq8Ey2
         T1SkELhonmbaoa7NB7GujmyurIfP3hjxw4zm0XQoBNkKcveFFMxtb541mmNzJ421xXZv
         WB6q8l7C2yF5dJyAHRoV6SWNJ2BgowUlodull28PazUl0BdWdFcilZffH+sxZ3gZEJmY
         N9QH2m8TvmdgEckAVJ18fWhRw/vV5W5YT1jiq/dYycs4tWJ48GGvS+tadRUQujFtghKx
         lUCg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUdES6R5qxv1b+V6ddHOurXMtPJ0bUv1RdJGnA0fHyLnfqIjqWC
	G58fcei/byyIvoY7qakCRNA=
X-Google-Smtp-Source: APXvYqwEkmzkUwY1yoP+ba5YCbPnb088XgpJJhqLBs4sfriNqmagAZaPBJ9j9WTDcZ9l0Dl7zL0Z/g==
X-Received: by 2002:adf:f850:: with SMTP id d16mr59198051wrq.161.1575267421818;
        Sun, 01 Dec 2019 22:17:01 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:bc0b:: with SMTP id m11ls1600752wmf.4.gmail; Sun, 01 Dec
 2019 22:17:01 -0800 (PST)
X-Received: by 2002:a1c:96c4:: with SMTP id y187mr27101242wmd.112.1575267421092;
        Sun, 01 Dec 2019 22:17:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575267421; cv=none;
        d=google.com; s=arc-20160816;
        b=SFepeP7tw5hHyj9QaBIsMCpQN3j9JHU0I9JcPy1c9z12WB2/yR4e3Em2NYmPMd/KIr
         OjH/V++v2LLC53ctNXertRe6Op7pE3tzlcl7Tjp6/3D2jIIWJQUGoGdLbI3LPc1dXaZm
         WnmZAMCxxPWgev4SAU4/V4vTozxZQU730E6Zq0tWY7PVBlr/UAGCwYOZIhrGI4IAyLTH
         kWYVMBiD4pCcI3Gh7ddUo+lxoAYD2Jaeg805wQoXJKZTse+fJbMKChPcI8Spnx8jbc5p
         PNKMAdxhM6k9AmYLmh5nSdeycyWNdJJErIE4tRP/HzZuRj+lIpqD/NN9pRiJ3ENixDio
         g7xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject;
        bh=9gSxpZn6bO1jx0igWMuWrVd3h6OovTjfLfVlaKsvvQE=;
        b=i0XM3vgTksftUYsqREn0ykZ0uuCyvzBm9VIHbg+RuinianVNBlNlYWl0oscRWtQ7d3
         ZEhrr6XrvJDrjG52f39sMOh2xlZeGtpnvr/a/TKQXV5z00wScpkLSXi4cIPVdzAILOQs
         dmODcyKhGXEtrlJ2jY+8UYesBOOTuMtrIWjriRZYgN6IHEyATargfQcHzFM1EhmIBr4N
         ZTzhA1XZ3cvpdwtP8FzvtakKL15I0ybbJWUgw/TJkkQPySOvbjlcI8wzHSInQLg1l6vV
         uPhOXwmnCvSnBF492J+jAPfCqQdEmMD4KAi0RFbxK0C0/9XtRFAVljG5N9o2ZjHaCEy0
         kh8g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id i11si241590wml.0.2019.12.01.22.17.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 01 Dec 2019 22:17:01 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id xB26GxtF019753
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 2 Dec 2019 07:16:59 +0100
Received: from [167.87.6.91] ([167.87.6.91])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id xB26Gv0X023939;
	Mon, 2 Dec 2019 07:16:58 +0100
Subject: Re: [RFC][PATCH 0/3] IVSHMEM version 2 device for QEMU
From: Jan Kiszka <jan.kiszka@siemens.com>
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
Message-ID: <0c6969db-848f-f05b-2dc0-589cb422aa56@siemens.com>
Date: Mon, 2 Dec 2019 07:16:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <fb213f9e-8bd8-6c33-7a6e-47dda982903d@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 27.11.19 18:19, Jan Kiszka wrote:
> Hi Liang,
>=20
> On 27.11.19 16:28, Liang Yan wrote:
>>
>>
>> On 11/11/19 7:57 AM, Jan Kiszka wrote:
>>> To get the ball rolling after my presentation of the topic at KVM Forum
>>> [1] and many fruitful discussions around it, this is a first concrete
>>> code series. As discussed, I'm starting with the IVSHMEM implementation
>>> of a QEMU device and server. It's RFC because, besides specification an=
d
>>> implementation details, there will still be some decisions needed about
>>> how to integrate the new version best into the existing code bases.
>>>
>>> If you want to play with this, the basic setup of the shared memory
>>> device is described in patch 1 and 3. UIO driver and also the
>>> virtio-ivshmem prototype can be found at
>>>
>>>     =20
>>> http://git.kiszka.org/?p=3Dlinux.git;a=3Dshortlog;h=3Drefs/heads/queues=
/ivshmem2=20
>>>
>>>
>>> Accessing the device via UIO is trivial enough. If you want to use it
>>> for virtio, this is additionally to the description in patch 3 needed o=
n
>>> the virtio console backend side:
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0 modprobe uio_ivshmem
>>> =C2=A0=C2=A0=C2=A0=C2=A0 echo "1af4 1110 1af4 1100 ffc003 ffffff" >=20
>>> /sys/bus/pci/drivers/uio_ivshmem/new_id
>>> =C2=A0=C2=A0=C2=A0=C2=A0 linux/tools/virtio/virtio-ivshmem-console /dev=
/uio0
>>>
>>> And for virtio block:
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0 echo "1af4 1110 1af4 1100 ffc002 ffffff" >=20
>>> /sys/bus/pci/drivers/uio_ivshmem/new_id
>>> =C2=A0=C2=A0=C2=A0=C2=A0 linux/tools/virtio/virtio-ivshmem-console /dev=
/uio0=20
>>> /path/to/disk.img
>>>
>>> After that, you can start the QEMU frontend instance with the
>>> virtio-ivshmem driver installed which can use the new /dev/hvc* or
>>> /dev/vda* as usual.
>>>
>>> Any feedback welcome!
>>
>> Hi, Jan,
>>
>> I have been playing your code for last few weeks, mostly study and test,
>> of course. Really nice work. I have a few questions here:
>>
>> First, qemu part looks good, I tried test between couple VMs, and device
>> could pop up correctly for all of them, but I had some problems when
>> trying load driver. For example, if set up two VMs, vm1 and vm2, start
>> ivshmem server as you suggested. vm1 could load uio_ivshmem and
>> virtio_ivshmem correctly, vm2 could load uio_ivshmem but could not show
>> up "/dev/uio0", virtio_ivshmem could not be loaded at all, these still
>> exist even I switch the load sequence of vm1 and vm2, and sometimes
>> reset "virtio_ivshmem" could crash both vm1 and vm2. Not quite sure this
>> is bug or "Ivshmem Mode" issue, but I went through ivshmem-server code,
>> did not related information.
>=20
> If we are only talking about one ivshmem link and vm1 is the master,=20
> there is not role for virtio_ivshmem on it as backend. That is purely a=
=20
> frontend driver. Vice versa for vm2: If you want to use its ivshmem=20
> instance as virtio frontend, uio_ivshmem plays no role.
>=20
> The "crash" is would be interesting to understand: Do you see kernel=20
> panics of the guests? Or are they stuck? Or are the QEMU instances=20
> stuck? Do you know that you can debug the guest kernels via gdb (and=20
> gdb-scripts of the kernel)?
>=20
>>
>> I started some code work recently, such as fix code style issues and
>> some work based on above testing, however I know you are also working on
>> RFC V2, beside the protocol between server-client and client-client is
>> not finalized yet either, things may change, so much appreciate if you
>> could squeeze me into your develop schedule and share with me some
>> plans, :-)=C2=A0 Maybe I could send some pull request in your github rep=
o?
>=20
> I'm currently working on a refresh of the Jailhouse queue and the kernel=
=20
> patches to incorporate just two smaller changes:
>=20
>  =C2=A0- use Siemens device ID
>  =C2=A0- drop "features" register from ivshmem device
>=20
> I have not yet touched the QEMU code for that so far, thus no conflict=20
> yet. I would wait for your patches then.
>=20
> If it helps us to work on this together, I can push things to github as=
=20
> well. Will drop you a note when done. We should just present the outcome=
=20
> frequently as new series to the list.

I've updated my queues, mostly small changes, mostly to the kernel bits.=20
Besides the already announced places, you can also find them as PR=20
targets on

https://github.com/siemens/qemu/commits/wip/ivshmem2
https://github.com/siemens/linux/commits/queues/ivshmem2

To give the whole thing broader coverage, I will now also move forward=20
and integrate the current state into Jailhouse - at the risk of having=20
to rework the interface there once again. But there are a number of=20
users already requiring the extended features (or even using them), plus=20
this gives a nice test coverage of key components and properties.

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
jailhouse-dev/0c6969db-848f-f05b-2dc0-589cb422aa56%40siemens.com.
