Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWXZTX3AKGQEJDGSTFQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x637.google.com (mail-ej1-x637.google.com [IPv6:2a00:1450:4864:20::637])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D271DE0B9
	for <lists+jailhouse-dev@lfdr.de>; Fri, 22 May 2020 09:18:50 +0200 (CEST)
Received: by mail-ej1-x637.google.com with SMTP id ng1sf4153507ejb.22
        for <lists+jailhouse-dev@lfdr.de>; Fri, 22 May 2020 00:18:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590131930; cv=pass;
        d=google.com; s=arc-20160816;
        b=Uz0Mp3nQfAYRXS2r4w78EYaW21HcKFqUXUGk4ExjLoZ66zTu5eq+CuzcxVuWl6El+9
         FyrKxEaf/BCVHv5wOcuVH+ibjzUN8olTtBVlKpRYdwxUHwmkadJQPNTcmpy4xtUQ3g2g
         sGVqb6idh5b3jry5LKdyuKgY6VC+Yq4LjhBg8NZLnkDAq7QP8R2VRC4rqAJWgGxZd2K1
         6XpJoSH9c0oQjmlyIgNG+6wSw5nclDxG4tZyvh1ZHCkzhlU2WU3KQV9ZCfKq3jLIF3NP
         bb5MhINrZ6XZ8nC4+ExeqDlVZ82avgXt4kQA9GzGhRX/M22YNy8qHSRWeo4CD+3dz6yY
         xs9A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=yY/Hs9m2I8UYzgTFm9+TytN7mG129OiTHd+8GguSP08=;
        b=lAPMdsy9hyAmxi8Qgx4IbUxL6Z6ES4xb/dMf4yVkggm3mbkFqck8CtW59z3j2kj926
         NJ5/ebW5uv8PXt0TXQi7f8dYbYDS/+ByJuBfbU9odLvTkDqEkoG9bKQVJSSrZF0LMSdL
         n8FQF05/kUcjTcEikMrkEKL8UcI6R/WLCf6Lo0wQoY5N+ZTi6de2pAusjoTPxInX0sMC
         P4lrnC38mfjnewe/1a6zv7rLRES6cigTYB7zqtsiCN3yEk2H6612yzZaDa0UDdeI7s/U
         f0gPfvk4cxfyH5JJ4t1aaIW6cMdEDTUqinNn/4zlkGH7pUpdAlJi/l0xbyr5hiJDbBVd
         jYxA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yY/Hs9m2I8UYzgTFm9+TytN7mG129OiTHd+8GguSP08=;
        b=OHhhn8zmZUrc+YEg2LZToOEWnjdAW2EKTZCPzzKfHlI6Of4ibp3ChFqjtaPcTw5/f7
         jzjD5Zyq8g/K8IGoq44l+KVsJAEsQ9x/mRIVa0Eh6sBQTl6kcXar1Fd/egUhbBObisNh
         dDcUKRnrysXUF33zPATJWWOpTvDI39peajExyPkxf5ihaxnI3X06ZedRzW3/BNJZv4hB
         n2QT9uK/VV014sdRQfpEL630LM9+vQA2itKXLI7gcHB3L1LEE6xFrtfiX3b3862X4ZPP
         Gv3I5Lp5uLzIFLGLyGD7iJrIflEG/9cxW7MmvJBlF16e412gKz2l2l57tkBRNDfY2aSO
         z2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yY/Hs9m2I8UYzgTFm9+TytN7mG129OiTHd+8GguSP08=;
        b=ImJ679+SSofq7k/UyDYWG89zR/jFCRcDCZnWVArIfPycn2jBO97pwXQHCliCTMrJSY
         oFy//okKIOi1qHF3VIw3p482WLcMJHpsv2tlw6oBrkcqrnDRYHIEzALKQmjVTS9Bydzs
         ue+fwE6OWuxQjdmUfkQGQFcjlfelBOCCTXp3Qq2xWUer6HN5AqoiBhSHgXw6uLXD5b8m
         0nnz7l9LSKZbEUVoXW2U5LdwaNjRJ6SfSn6E2xkMhPTOsZqZWYSEVzRxvG5L+ulSLaVT
         jqk5chzAGbdf/bm3/PTdaHx3EzJ3T2mma3Mu16eVsd/G0huuGQXEUo+M0GdOIHFJN9qb
         oo3w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532J+kaijNUrwl3XyHECLsNKg1QJSrshm9lxL0L1Am0i79+5t4by
	s5OJX4WAB+Y5J+glAYmfm7M=
X-Google-Smtp-Source: ABdhPJyqnk+V9hQbL83FqKPzT8SGfpdpwcW9DzNlIbx/j4Rw+FacExZefOX9SeHCEe/WCK3jhfJ/Tw==
X-Received: by 2002:a50:baa3:: with SMTP id x32mr1830101ede.251.1590131930332;
        Fri, 22 May 2020 00:18:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:f197:: with SMTP id gs23ls321075ejb.10.gmail; Fri,
 22 May 2020 00:18:49 -0700 (PDT)
X-Received: by 2002:a17:906:415b:: with SMTP id l27mr7161854ejk.240.1590131929589;
        Fri, 22 May 2020 00:18:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590131929; cv=none;
        d=google.com; s=arc-20160816;
        b=jM5Kbj4GL14BAEmlecFpwnmO14GQwI/ySfdxha7gxC8LO1ZJVFatS57IMtlWwojpNT
         7Zbgk08aiJ4uv9gVe+/KUHy8KgV/khM8hWSqJRYtsVFmQVauJKQdOwNDFgrnIFaKbVJU
         JfE3/M8wNj6ypJceZb9Qj6PGMDiN8tWozR62+BXWkUw1eKrhOtUvCBkDVL4nU6a2vPjw
         /pTOswahzhT3aIrdej7BhxHikBTsoBPMfANVHKZOws9YTCNf8f2MTTxHQ0w2lQ/3t4mC
         ScYg5CKtWYHbKKXU35PRcRkM9pIarX9ap/Nkml1QVMkJiAnYl2WfS+dHM4laXjXfdcZ3
         eLWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=vK5CxmSQwEDhGnDAKa2lRYkEf2tStjas+BfEHl1pq4A=;
        b=xoDtKh2Uo4h3oDeM0yvuPkYQh0XC4b1rmw6vIxKWoCQ01L/NwoShfEpHZaBHawRNKr
         0nSa+c0hy5IDV9HqOd6ILApw9ku3pT4A4rYFWrZEolu48Hag0pNu2f8464Q28E7mv810
         7hu0FfXJ3BDiFSo+NlBdYzeD8wPqu0LRA3YIgT1WDoi0MXHWAHT5wm5Au1mVv6Pv+SqH
         W2Naknb3lvd56Om/xjFLstOadUQBIOapKsm3vqC3AZTKlgxv9mlVg8MWJIp2vUOYIctH
         PTlL1JCxshzykRsbhsdnc6mlT1DjP52/myXRlFlQLRTp5DN3Fk8oE/PS33APkZXKX/11
         iFrw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id cm25si383360edb.5.2020.05.22.00.18.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 May 2020 00:18:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 04M7Imud030437
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 22 May 2020 09:18:48 +0200
Received: from [139.22.32.53] ([139.22.32.53])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 04M7IkdP022393;
	Fri, 22 May 2020 09:18:47 +0200
Subject: Re: [RFC][PATCH v2 2/3] docs/specs: Add specification of ivshmem
 device revision 2
To: "Michael S. Tsirkin" <mst@redhat.com>,
        =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: liang yan <lyan@suse.com>, Jailhouse <jailhouse-dev@googlegroups.com>,
        Claudio Fontana <claudio.fontana@gmail.com>,
        Markus Armbruster <armbru@redhat.com>, Hannes Reinecke <hare@suse.de>,
        Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <cover.1578407802.git.jan.kiszka@siemens.com>
 <5ddc4ca4f32bfab8971840e441b60a72153a2308.1578407802.git.jan.kiszka@siemens.com>
 <877dx5fcvo.fsf@linaro.org> <20200521141642-mutt-send-email-mst@kernel.org>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <55386d9d-0748-8cad-494e-5955a22ebd09@siemens.com>
Date: Fri, 22 May 2020 09:18:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200521141642-mutt-send-email-mst@kernel.org>
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

On 21.05.20 20:18, Michael S. Tsirkin wrote:
> On Thu, May 21, 2020 at 05:53:31PM +0100, Alex Benn=C3=A9e wrote:
>>
>> Jan Kiszka <jan.kiszka@siemens.com> writes:
>>
>>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>>
>>> This imports the ivshmem v2 specification draft from Jailhouse where th=
e
>>> implementation is about to be merged now. The final home of the spec is
>>> to be decided, this shall just simplify the review process at this
>>> stage.
>>>
>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>> ---
>>>  docs/specs/ivshmem-2-device-spec.md | 376 ++++++++++++++++++++++++++++=
++++++++
>>>  1 file changed, 376 insertions(+)
>>>  create mode 100644 docs/specs/ivshmem-2-device-spec.md
>>>
>>> diff --git a/docs/specs/ivshmem-2-device-spec.md b/docs/specs/ivshmem-2=
-device-spec.md
>>> new file mode 100644
>>> index 0000000000..d93cb22b04
>>> --- /dev/null
>>> +++ b/docs/specs/ivshmem-2-device-spec.md
>>> @@ -0,0 +1,376 @@
>>> +IVSHMEM Device Specification
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>>> +
>>> +** NOTE: THIS IS WORK-IN-PROGRESS, NOT YET A STABLE INTERFACE
>>> SPECIFICATION! **
>>
>> Has there been any proposal to the OASIS virtio spec to use this as a
>> transport for VirtIO?
>>

Not yet, primarily because the second half - virtio over generic shared
memory or even ivshmem2 in particular - has not been written yet. It
only exists as prototypes. Lacking time.

>> --=20
>> Alex Benn=C3=A9e
>=20
>=20
> I think intergrating this in the virtio spec needs not gate the
> implementation, but I'd like to see the current spec copied to
> virtio-comments list to possibly get comments from that community.
>=20
>=20

Will do.

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
jailhouse-dev/55386d9d-0748-8cad-494e-5955a22ebd09%40siemens.com.
