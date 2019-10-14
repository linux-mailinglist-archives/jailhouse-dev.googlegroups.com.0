Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB56HSLWQKGQET57TDEI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BDBD6771
	for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Oct 2019 18:36:08 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id c6sf2414830wrp.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Oct 2019 09:36:08 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571070967; cv=pass;
        d=google.com; s=arc-20160816;
        b=LvI3jJsBUhyzMPmV95tEpFReUNfUTQl3cGD/MyFKCcOv6y2nj2rWIaP7kQYDPpzcif
         Nl80hxVNQsMmc6FnRcV6RuKjMhSd+4QpeLIsL8FPpJkcAvjgzKDRO2+/cy2yOwId+lI8
         IiueP5E29spNNFTOj9fwfbAs6wG96kxTk507ssc59KZqdZzWjTbGQ6rd7tF+M58G/0t3
         eGpY8yNBvMklZVRvPNEvmcwo2pyFCHDazoLIR6jQYPObsxQNMAznjKsPlc5EwXdtGbNs
         CJ4P6gNpPO+PBv2ZMYmPhR+yKiMurTBB6ub6EB12t6zbm8VLwofmTb9ZvfvHNFdCQ1+S
         FyIg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=M7jDHs9enPp7omx/Kr5glKeb02fueOFyriT2E5lN9Dc=;
        b=ihTEWOqPqcjHqDp9cAHBSwkJYzRQUI0wnYqttrSzkXZDeJ30xY/ftHeWHhZNZxqxf2
         AnR+A9rFaw0MQjWzQ9VEWgbfR9zf1aIECeGLkhN5qh78DymyQvI8PciGYZnxaRfZ5Kf7
         Kc8t7k+rs2V3M4u+ufYptylfXfMbTwpOAnj+nE1o3p4RL1zEFdgoL+sYSmiR+1Wah8zT
         Q0HYgONwPuY7Z696LQIUTlxTaBavNvAXb2Z+OkoBcAeSHkyGuDUuZGUioJjvs6qti7HA
         plaJ7zz308sTmZjV+AB25SmIGpID9XLjo3CDxiQL7n8No+DkREF6gSH0krAh0KuE9BEe
         RKOw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=M7jDHs9enPp7omx/Kr5glKeb02fueOFyriT2E5lN9Dc=;
        b=Y8tc5v4BhrJS8EQsUMymD0UKcO5pxdkeFC38d6JmiSeGCG0u+gEMd1WbuGY7W+4ceu
         wAO46rkkq2X3eqZUEU5vakREzcae946zSSjBRZp5wf2HVMJcQTARWRLp6eiCkXCeljJz
         8r02nC3gb3i/nFIXb+DiHf4CVL8xpQ4p78r9KpV0Afj33LwMENb+c3H9WBeap6xCvBBV
         CH4dI2i+0yXyhWof/otrYJ3WGOAxFP1EAL/Y9E23HfDSzVDonnGX+JDe6NQMwTQCxQmO
         yQDNVy9RMHxkfP+kVP/UKMTjXmdvylcTdEcCwiT7BFZdXq4gH7QHdNIYOURc73A+7iWg
         vpyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=M7jDHs9enPp7omx/Kr5glKeb02fueOFyriT2E5lN9Dc=;
        b=cnLcHgOgDMOFopde3fXjw4jJRTs1kAFMMkxUcuK8/3Q6EI4d+pBgwFJiI6jXzuNU9D
         5skyftsh9XQXqwhbgSOC2IbRsjykE84uIOdOvMlR2EeRzcLQXhV/9u/dhD3IearXSvt7
         5Cpul45SxTiba43lTKsAEe4HNwBQ8eBxSCn2UdvLy1XVt4rPMkaE83Zc3dJSaXse+fuR
         wR1dqPYgGSxsuMB45kdRcLWEURHSa0ugYeqg8JCFwn4EgVovNS2KHoszRb5q51+fBwFI
         Ybe6Oixhdcbrh/DvtqO8/etig5wlupUh3bsC1dA6XdwJKQOe5UBDHznG4PZlH5unCzed
         1m9Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXUAybhFXZmTX7fwRQb04fJPajsklerkFvPKs41CT0zP5QgsD2A
	4LWOJie5+mNHJRM+Uf3e06g=
X-Google-Smtp-Source: APXvYqwihZpVq7Bry5NssRi6cIMAaUuCLEtctDssTAuXB1Amz5epn0CWgr210PRlHtPOppEsYE22dg==
X-Received: by 2002:a5d:5226:: with SMTP id i6mr14849146wra.46.1571070967863;
        Mon, 14 Oct 2019 09:36:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:526c:: with SMTP id l12ls5645315wrc.12.gmail; Mon, 14
 Oct 2019 09:36:07 -0700 (PDT)
X-Received: by 2002:a5d:6651:: with SMTP id f17mr8402285wrw.175.1571070967143;
        Mon, 14 Oct 2019 09:36:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571070967; cv=none;
        d=google.com; s=arc-20160816;
        b=aJA6uhTM8HPNbw5TDdMPVlmlGrDzXfPq9WZHEu9QzSYLOmlE1Oxswq6DKwDbZdyCg4
         UMbrr4SzTkwZIfydDVLV/3qR4N38dm9tf5aoigtO0COG1eTnr9c7jbfQxdePN/O7b/gQ
         Y2FdYL6g7hqGJBDx381+gX+ecsT+5K+OxZtZcUG6/4G+fI+XxDslxTzjF7ft8DNTuxvZ
         Ab+Q4jW0XW7DjeaCXLJ63+bmqNkYR7w2Wsa+UwOaR2y35TV+mEqAblzwkkcLLOCeyfW6
         kVxFsvMN4Zy6owi+F47KNZThXvBKR+YO/H1htY8LCmbPjKgp0EagmOq0bjdPFQcKytH9
         qglQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=6PmOHnvdR2nSgO24Vzq9POmL/jA2t/i2AxcIbFGzAfs=;
        b=n1peyIdxtAUZzIZpx8MMtAJ3kDn2iXWZQO9lna99JrjtQ8H2Zdl/gRvcDoFQ8OENe2
         JZZrBtvG7BqzhQpKztx2wSQaZJbokvkZ3yCRh4PQTQPAWg4NdfbJ7Bomnk29cEhqB12s
         MTfsBGDgVKgPe4LvwkuIhweITVoT6Feq5BLcHrmexkU+0BlKw58an6jIoe++K7+htEpX
         T3uDvtJegmJ1GCpXuvRO2gBhLH6XVivfyVRqU8FxajMajUOhJTPm22MkltycQiBmT27G
         NM/1fqjRnaL9x6APRwfqsMUAZiI5chzMvqB/3H4QqjCdFIq/QdBogsootyISeCKegGfr
         c+/w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id l3si30624wmg.0.2019.10.14.09.36.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Oct 2019 09:36:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x9EGa659012304
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Oct 2019 18:36:06 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x9EGa6Dd013256;
	Mon, 14 Oct 2019 18:36:06 +0200
Subject: Re: [EXTERNAL] Re: [PATCH 3/4] arm: am57xx: introduce support for TI
 am57xx SOC
To: Vitaly Andrianov <vitalya@ti.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <1570731650-5335-1-git-send-email-vitalya@ti.com>
 <1570731650-5335-4-git-send-email-vitalya@ti.com>
 <0b85c51a-0078-47fb-70ba-a8f9def7b852@siemens.com>
 <357f2bee-176a-af2c-e603-9f907f1594a0@siemens.com>
 <a2ca04dc-8212-1e0b-c3dc-f3b58fc2cb12@oth-regensburg.de>
 <32d719ab-04f9-f57a-d8b1-33f6467da855@siemens.com>
 <f5316d70-5f44-93e0-dc2f-604cdd229fc6@oth-regensburg.de>
 <b3477139-cfe2-b8af-8b42-11487e4e4c87@siemens.com>
 <0368a897-9bda-63fe-5657-89891422c118@oth-regensburg.de>
 <5a39b4c6-2738-95d9-352a-2a79669f1c96@siemens.com>
 <d2ecceeb-3da3-c86b-0deb-fe7deb9c2d62@ti.com>
 <e94f17f5-01da-00c1-a6ea-957de5d8bb63@siemens.com>
 <fa5bfefa-d575-2e5d-8165-b7502b9e505b@siemens.com>
 <1442124d-f24d-4cf5-4d93-0605971dd1f8@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <4afd779c-45aa-e9fc-2c6d-3c63f9361d84@siemens.com>
Date: Mon, 14 Oct 2019 18:36:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <1442124d-f24d-4cf5-4d93-0605971dd1f8@ti.com>
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

On 14.10.19 18:22, Vitaly Andrianov wrote:
> On 10/14/2019 12:02 PM, Jan Kiszka wrote:
>> On 14.10.19 18:01, Jan Kiszka wrote:
>>> On 14.10.19 16:31, Vitaly Andrianov wrote:
>>>> Jan and Ralf,
>>>>
>>>> A while back I tried unmodified hypervisor by just adding
>>>> am572x-evm.cell config.
>>>> Basically everything worked except cell destroy. I repeated this
>>>> experiment today.
>>>> When I issued the cell destroy command I got:
>>>>
>>>> root@am57xx-evm:~/jh# Closing cell "AM57XX-EVM-uart-demo"
>>>> Page pool usage after cell destruction: mem 49/4073, remap 5/131072
>>>> [=C2=A0 187.112795] CPU1: failed to come online
>>>> [=C2=A0 187.118622] Jailhouse: failed to bring CPU 1 back online
>>>> [=C2=A0 187.124806] Destroyed Jailhouse cell "AM57XX-EVM-uart-demo"
>>>>
>>>> After that Linux is running on ARM0 core only. Basically I can create
>>>> another cell for gic-demo.bin, I can run it and shutdown. I cannot jus=
t
>>>> destroy the cell with getting ARM1 running Linux again.
>>>
>>> Yeah, this is a familiar pattern when things go wrong during
>>> cpu-hotplug.
>>>
>>>>
>>>> As far as I know when we issue cpu_down() the CPU is calling WFI
>>>> instruction (Linux kernel page) and waiting for event. When we create =
a
>>>> cell the hypervisor switches the page and runs the ARM1 at the same WF=
I
>>>> loop at virtual address 0x0. I guess when we destroy the cell,
>>>> hypervisor shall return ARM1 kernel page and cpu_up() should continue
>>>> from that point.
>>>
>>> Yes, basically save-restore of the CPU state, at least /wrt its relevan=
t
>>> parts.
>=20
> I thought that is hypervisor responsibility when it executes the "cell
> destroy"
> to restore the cpu1 virtual memory to the point when it was on the "cell
> create"
> state. As I understood hypervisor calls cpu_down() and after that
> creates the cell.
> On cell destroy it restore cpu1 state and calls cpu_up().
> Looks like my understanding was wrong.

No, the model so far is that the hypervisor emulates PSCI CPU up/down,
and that implies a (virtual) CPU reset. On x86, there is an
architecturally defined mechanism that works via IPIs but it otherwise
identical.

>=20
> So, how to resolve this issue? You said I need to add the "soft cpu_down"=
.
> To where? kernel? or hypervisor?

For the am57xx, this needs "only" hypervisor changes. The kernel already
has to support for soft-offline/online. I would say: let's make the
save/restore working on that device, and then we can think about if we
make that a root cell property that controls whether to emulate PSCI or
use save/restore for the root cell CPU control.

To reuse a generic control on the RPi4, it would take also kernel
patches. But that would be the task of someone else, later.

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
jailhouse-dev/4afd779c-45aa-e9fc-2c6d-3c63f9361d84%40siemens.com.
