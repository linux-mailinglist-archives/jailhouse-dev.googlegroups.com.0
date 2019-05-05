Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBBV4XLTAKGQEFZDQMKQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7AB13E6E
	for <lists+jailhouse-dev@lfdr.de>; Sun,  5 May 2019 10:25:42 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id t16sf8254977wrq.11
        for <lists+jailhouse-dev@lfdr.de>; Sun, 05 May 2019 01:25:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557044742; cv=pass;
        d=google.com; s=arc-20160816;
        b=AqK3bsnr1jOehr+B5nRfPNWfau3XkCmY/SqeUK1CuVfto3QRyuGo32iP7BLK5F2hzi
         bdXT9adbtQvxkuDCo07zgOq9RVG3i9bvw1Et8stEU575CyFFX5dDox3KRTBmzhHJ9o9S
         xK75NRYSKTZobSxvJR9i1w3BLE58Dsg5YKCC1fALYq+b168QFTr2TEIPTjrSNO/P/NlV
         GjOPF0XBDgiy9B86kEu3a0pB/wqYBlDkVXsJ2RGENPcHYoTbeaLSzk8ZF7PJTUofIV+3
         BS8xw6pKsI9Dh/anKJ9wo54x8Ezd6TlHvIrFCH85roZig+ETdZRIG3oBEEE9+TEtQULl
         h9vQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=keSZ+ENvMSIHZjbDClQGBPVmEM2FOs2ZIPY20ilPr80=;
        b=YT9NB0ZBqSpJ6c0DIVBB9FARJBxijlCGxXB/8Yc7/55RBJgTyg1Ba2mk4ls12jBzb3
         wBPGiW4NX0WbAaOYXb2gBBZB/GdwrZKMB+Oln8CiW5+rGL3lqbu/rbdg4kGtPLGQxR8Z
         wiljUqHJK+xtoSBnehZnkk+3qSBpPoy58CPBBuq/UVQno4GrX4p665E1LYrnn7o2ngOT
         h5ZLjMgSFIlaJECe6RVTk/GxOZhM7oag8OvGufgdCO7bPDullcLHHCmvxEKAiKsdy7bO
         Uz1kvqXbjwXXQeh/GhKPXha4EZV7Edn7E0fGrs3KtA2Vy8TJn9vspR1sIVNSYKrXrFfS
         TeLQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=YGCsmnaY;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=keSZ+ENvMSIHZjbDClQGBPVmEM2FOs2ZIPY20ilPr80=;
        b=ZmTpZ7yjaZ0sDT5v3ebv1N5LIOenYAPF34ouulc2M99h/teGEWbYkbRVOOIKKhByH8
         ZYn0jV1Q3QfdnyYG88CnSpQrRpOfc28axH7vhLejIknWNXBn55M/MSwJrJvDFnmTWK09
         1RykokaDwYjVgzJWz4eeBU1Hl6abziH2mE4fabl3lo0h/0u283J5O9OUsou7BCK2nj0f
         DRJLx86Eb8bOZAJtvUec3VDTU8LYWsIh/tsRBfp7ZUfr7OQXeMQN3sr9HN6jHj06LsMj
         tgGGgUZBKgicjZEXsbIknEv5TofDRzFEvkcbQe0k1Rqg7WepgRABNnVj5k59t5NaaYyX
         HASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=keSZ+ENvMSIHZjbDClQGBPVmEM2FOs2ZIPY20ilPr80=;
        b=SwJt+AqKEMfWdksSc0cx3keuJN1OJwxUqjQdI67xO/q5PkJUYfDEpTpu8z5I/5VpsE
         wSXg3jceyfNGXfUoTQmE+TYe8amLlvouSD/8bl2Vxij7DyjefgCoFPOMoCEh26EST3Qa
         A1zqUnrjBxeeFKTOYWHrqo5yk9QZ60VX/7YEa0YUst7qTWSVfGQdZHBMFwczAe2GWUPZ
         2yBGUtCgualCjhID9zGa5I7JMwCQoGhgeevB/Hfarg0iEmJtOLQ9k2CBjgdrw3T00vIr
         p/mMmDtaruJL012oAcOqHQ03k/33k6Ho24jeGF/nECgUfsb/bLXHrnZ7sG8lL7liwSn6
         L82g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXr6yBFVS7CKeiCJoqBi5dJFC0mCyj4j6O/Zu+la5c9m1RKGCTy
	xL7o3TYLJNSUMlSv1H9WV+w=
X-Google-Smtp-Source: APXvYqzIpLCWhevGAAOiGZDfzgRlvbkD1UreblJXzcea1EcMkJ5s+jQILnsbX+wM8lyB0FuZeo+gow==
X-Received: by 2002:a1c:2045:: with SMTP id g66mr12583697wmg.16.1557044742398;
        Sun, 05 May 2019 01:25:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:a442:: with SMTP id n63ls2867895wme.5.canary-gmail; Sun,
 05 May 2019 01:25:41 -0700 (PDT)
X-Received: by 2002:a1c:a914:: with SMTP id s20mr12707502wme.55.1557044741937;
        Sun, 05 May 2019 01:25:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557044741; cv=none;
        d=google.com; s=arc-20160816;
        b=LDsZZ21v3HcJdbz/4Hi2PF7UH2LrUrx/xQDHcBfZ2FxKJSyqGU5ad9FWR0rEGyj7cx
         o8JjykSpmVXi3PTA5v98OLAt6f7QwvwLCUQXw3DjreZZ8WcOdg1gEuMOUvmItFlo9lFE
         IHrjQANQSYR0KvzwiTfhgMvq+/NF0L4XJ0NM/a8I/ZGUjxG0xkBFDVfeTzfPEqTTmQT6
         XQmyie+I8Ng9MLm+UL+e5xhsd7Go6Vbh6W2p+4GEN3u1mnwAjJo3pCMmda2hE7DkyYgv
         0RcrmmykQwbyj8xLVwnkz4ndYjl37f5vt3NwKSRdLxPyrwmHvmgfrXZlO3SHvaiPJpHr
         PdMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=4ISwLyCY26B2Dt/4fMddUISCJEH9vkVQods68S7Om54=;
        b=sWND4hXTj0FqkLj5vWyRz2rKzjHZvs98170HHLyv9+ZENe0xprQ0qCsZGblqsjQ5Oz
         IcEoxZ6hSKjjXPAowOBcWixjnNi9Q7D6/oWeX+Mt3WNA8ZHg9jqoeQ7+aDcrzfP2o6nz
         Bo2tiriBcbOnBuO/fbL6b6Ul2WuU6/Hbjw5nTuNVRLihl5rupnvf8QGhYoLViN26X37Y
         bPKc+eVZdwICRBeQHGZ9aYk3+j/9YMBdH+9hzYurYFucAFZ8ckJTNfP1hjq1czCg13Ow
         PlYk3KxeVr6AX1gqPIIKz5RdblTOtfuVWMaMbpROnQOrsLahQ45dx391FIaF8c5B7VXF
         iPtA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=YGCsmnaY;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id x4si357181wmh.2.2019.05.05.01.25.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 05 May 2019 01:25:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.54.22]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Lb1rd-1gulbw0t3J-00kcnI; Sun, 05
 May 2019 10:25:41 +0200
Subject: Re: [PATCH 16/16] x86: Remove misleading brackets from mmio
 instruction dump
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 jailhouse-dev@googlegroups.com
Cc: Andrej Utz <andrej.utz@st.oth-regensburg.de>
References: <cover.1524500320.git.jan.kiszka@siemens.com>
 <8288aefc87cb03b3f3bb8ab832c41fd0370a080a.1524500320.git.jan.kiszka@siemens.com>
 <924c6d0b-bed6-ee2c-95bc-c615bd053efa@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <5214460f-f841-cc0a-2f1a-7608ffc365b3@web.de>
Date: Sun, 5 May 2019 10:25:40 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <924c6d0b-bed6-ee2c-95bc-c615bd053efa@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:7LFjmHMntW/v9aRNjrKadYPY5+fysqeKOVsiY9ZbFEAqM3eVlNB
 /6N3f9j0EL/XOemykvBAPWIf3VdEqjd/QDEgbi07qfZQSQutqG5Y/TURtss8JyX2JK5QmbZ
 q9y7hJU2ceUM3/tUAnh3xlRysGopy15qpTOqnudaSkCt1Omd0nUWCH+995zJ7FsduFMWeWq
 f025dhTXTZJouQ965wziA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Uothe8UHwJw=:b4AQnk2t9boI0g07/NqGpF
 IcegMnpY8qJKh0cybIzk+JJHZwPbpScbSn6PZXbgPg5J7FA4XhLjtrisTMoxwHmI/Wz2O5BzE
 lr9NQrOQZBtXrfWnOKnLN8S9yirmPnGhi5FLTcSe6OUqXBFHbFh+sH2ySQxzySW4mYTQHlxbQ
 Chc+dpNihb/6Vmg39if1hJeeBId4od8f4cyzmaItvip6k0On9YTDnfO+9aNdFBd33Fc1FuJ8W
 2gb4u8RB3k4bPhLnEwiGGa3sEq1Lh7kRtu86MQ1IXUrSab5xdv8+X162lqA6n0ijHwBF5Uwkw
 B905Vk9gERlJhHRqp8/iYkVKzo1DBGKOB2GCxNtPKH2PNo39MK2Zor6Dsi/X3gJRKU6GcgzjC
 m27W9BWMTUvuy6ujmSxIMUFsccJ83cbUJU7DGKvXeCQb9R9db7FaJsoWYzXaF937VNVVdfk3B
 4U08Tq8U586QHTw4v1mp2mbE+ZdzjTnv9YNAfGn+cU8kOOiiMEZMy8mIy7jhxcMZuZyGMrqCs
 5/u7XdSPRonANmTOVdNw/dyuIzbbArgJZRXamiff6npr41vJVuy+3O3GAb/ih3syJWTlreW/+
 R7kgzzKe0Wi9hW63meLzrvpzKUIHCEJ1ghpCEMTkqKblrU65G8YoxVkbLKYncE62jL4tAlf/X
 uNzduNMDb3KIIoCdnFeb3WYRANwyggILTvSsKN7D37CWmCHPSM2duTyFJtf0T51advrwj1MPu
 n7wuJ7aIXGaBOlQ9ZNbjOpYpF+oRNnC4FJgHWW7ZiTSxEF/sJKG3pwtzPOJusCVEDPeSg4eTg
 qr5LGpuIwar5MipiGJElqSW9XsqnOGjHa/AGI7I3+dKMeJ/3WkpzW8opZSZpJfu3Pk2WZW8LA
 aOeryEaaZfF6yKoxep74nWBEOuAtG1E5FbcxeTbxpEWZ40UwdMKjYETgrjGoIHSnV0O91R6OA
 oJUYYioKHTA==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=YGCsmnaY;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 03.05.19 16:29, Ralf Ramsauer wrote:
> Hi,
>
> On 4/23/18 6:18 PM, Jan Kiszka wrote:
>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>
>> The parser my bail out on opcode byte 0-2.
>>
>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>> ---
>>   hypervisor/arch/x86/mmio.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hypervisor/arch/x86/mmio.c b/hypervisor/arch/x86/mmio.c
>> index c1b9f10e8..775ec4b7b 100644
>> --- a/hypervisor/arch/x86/mmio.c
>> +++ b/hypervisor/arch/x86/mmio.c
>> @@ -219,7 +219,7 @@ error_noinst:
>>
>>   error_unsupported:
>>   	panic_printk("FATAL: unsupported instruction "
>> -		     "(0x%02x [0x%02x] 0x%02x 0x%02x)\n",
>> +		     "(0x%02x 0x%02x 0x%02x 0x%02x)\n",
>>   		     op[0].raw, op[1].raw, op[2].raw, op[3].raw);
>
> sorry for digging out this old patch, but I think we have a logical bug
> here:
>
> There are cases, where we jump to error_unsupported before all opcodes
> are set. In this case, the Hypervisor reports the wrong instruction,
> which really confused us for a while (Andrej found this).
>

Yes, this is a known limitation, and the patch here just tried to reduce the
level of confusion a bit. Before that patch, the output suggested that we are
always at opcode byte 2. But we can fail at any byte.

This is an expert debug tool. You are expected to parse the opcode bytes
yourself from left to right. And as soon as you hit an opcode that is no longer
supported by us, you know that the succeeding zeros are invalid. If you want to
full instruction, use RIP and disassemble the guest. Adding that logic to the
hypervisor is not planned.

> We have such a case, if decoding of op[0] fails. Jailhouse will then
> report sth. like:
>
> FATAL: unsupported instruction (0x83 0x00 0x00 0x00)
>
> Which is wrong, the code behind is:
> ffffffff819705d6:       83 78 08 03             cmpl   $0x3,0x8(%rax)
>
> Which brought us to the next issue: CMPL might be intercepted, when
> accessing, e.g., PCI MMConfig space. In Linux' pcibios_add_device, we
> have the upper code fragment that accesses MMConfig with CMPL.
>

Hmpf. Would be complicated to emulate as we would then also have to handle the
actual comparison with its impact on flags.

But looking at the function is 5.1-rc7, I don't see MMConfig accesses yet. Are
you sure about the access address? I would rather guess we are touching reserved
and, thus, not permitted BIOS or bootloader RAM here (struct setup_data).

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
