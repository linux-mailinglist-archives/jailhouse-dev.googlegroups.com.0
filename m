Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBJ4BY35QKGQEMCSQZWY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x640.google.com (mail-ej1-x640.google.com [IPv6:2a00:1450:4864:20::640])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4EE27A759
	for <lists+jailhouse-dev@lfdr.de>; Mon, 28 Sep 2020 08:20:24 +0200 (CEST)
Received: by mail-ej1-x640.google.com with SMTP id li24sf2590656ejb.6
        for <lists+jailhouse-dev@lfdr.de>; Sun, 27 Sep 2020 23:20:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601274023; cv=pass;
        d=google.com; s=arc-20160816;
        b=D2qgvl4qfHk2M6DslzpkFFhA8/b2dpunLwXQlqrEEEAZj3Fo6wzcy/2o9EzMOthfUs
         RcQafMZMSwT8Q+m91bfAXZsq5/tPHmVViz4Ts2K5ME+xUKbw88gWKmZylKxHVatjLqYX
         spqN59DH1xl50UXCDjG5EdY6hLUxk96yz3CO2Mz9YmfiNohq9L5S9ZCkemy9GWYor1Mh
         ZTzRO+gCCTyJ1LrKqucSIW3B8C64Y0RmjADoyUwfF2ZvvSic5JFSLfMm57ZlCl4tsGeG
         SUitjRVP8N9SZT6e+A3/aNl3hG2gIMLwJaVgVSW3cvminXVPTx5234QjdJVezVd7lUe4
         cYsA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:references:to:from:subject
         :sender:dkim-signature;
        bh=s7amLWdMODWJnqD6RMcjxOb2UFW5BhdC9YnDHxNLewc=;
        b=cyvDOASM67tlVoa2dj0OjPE1B2wWcN/I4kT2Vr06yA9PTtw6uU72jLnA+Zcu1DYgWz
         cw9A1GDuj5uMIc1zEt51nws6kcQ1+oxik3PgrFbcZX0PLX2qgKCwaQqVlERYabcAI5Dc
         Ao7H3GO3x3v57oKDfZxdujyaOEGgrUWv1P9Mzv4Vj4EV51KQIjVm4Mp6hkb1thrxC82Z
         j5obAcl4/NRWUfBqS5N+fWE7OAXAfR72IONebXRGubrKEb59kBXxJCrOxN4M3WQFeGDe
         EQ/l/MljTVtKUETdIseURMfKN9expN1uqPhA6KI50o3f9Vbu3ff52P+pl1fwM8VF56U/
         BBVA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=H5PEbZhv;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=s7amLWdMODWJnqD6RMcjxOb2UFW5BhdC9YnDHxNLewc=;
        b=Hxs1ye9rNlvfkRYtXhlEgO5zD0ShqUVJftkr4fVKnITTQnSmJV6dCHHNLOjebV/75B
         F7qvaAe5qDGeg0w+earyy+VPc/HQDe99bauawHl4kBeulwEK1MxFm+SzZutolcYllHvb
         AHKPrT9vHIv+EA0uV4ZSw98YQHokwJ22W1kWVQmKrplKgPYnzqapjv7dx0Mv6A4WscSz
         KzNuxJMhuhzd/k4hIMPbdnadrJkcW0YwFA115MdIUsCGVBMu6gXn0HgnPr6INOBoWZo7
         +LztsFv9LRM1pKzWombeSFiY2THsh1FrvxjMJjCAFAsgTlQF8Qf4ivNYvN9Oe5tlMGMl
         6q4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=s7amLWdMODWJnqD6RMcjxOb2UFW5BhdC9YnDHxNLewc=;
        b=HdaIVM63JiuKQ1YokE5mtSqsNBytJ1msp3kHMzRSaTsyobkpTzmbEzvDqHlEhYH8wj
         m+Tk48Dg1pmjM8CA0t1XomfDodmiplVnomk6ZQACEMeDC38D4ovVGuDgua3aEeBATuP7
         gcF6AK0kCZbUJZR2KImpHu/632WQSoWcKee28xLCKKVqK+OgXaYBZskWpVWAGoAXnD/f
         vVmO2WDaS8m5jgI+PiOh/j5MYvx7fNL967GnEm5YSeiEvDZmZUfZQmfH3tudLbGj3NtT
         aF0fjO39OEldsgGGAWnMINvcGUAS6OhRBpn0IqMP+gHHlafDjufhJpYI5iHuupbHJ0Bj
         r0hw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532Q/4pGSuuFbzRtGx6hIRJIzutszFSqwndDM8/ANXoTika7+aFy
	m39L11GkJgt//MFWSRiZL/0=
X-Google-Smtp-Source: ABdhPJwbmEbqjsbUXFW/I+5gMyBG+F88c70onOF6XRkMPX6R9gqADjptiGtGJK8h3Lu4PgFjmVcz4Q==
X-Received: by 2002:a17:906:934f:: with SMTP id p15mr160482ejw.497.1601274023820;
        Sun, 27 Sep 2020 23:20:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:40ce:: with SMTP id a14ls10481ejk.1.gmail; Sun, 27
 Sep 2020 23:20:22 -0700 (PDT)
X-Received: by 2002:a17:906:a293:: with SMTP id i19mr187984ejz.428.1601274022901;
        Sun, 27 Sep 2020 23:20:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601274022; cv=none;
        d=google.com; s=arc-20160816;
        b=UdsjFT2gTiQNkQX7YIgGEHUxbfJiloNpC7V+tLv7tnNnKzN+X5GkzMglWloX+Rx2fn
         eouQXkYtgpnEciA0FufaP8wAK+6CbS8wuyBBIO3EnVpgCN4GkMiY9J/SOh68CNoZNSQn
         CeoTpOdsmGTgEzGj2UKp+2EnVdan3sgC4MpW4O3GIzq3UZAFmnOGQ1CdjjqQxnnyxfHZ
         L1885IKGBttBF5qgUt9DjLUt5uPCC2rVQGJGTB0zfMMkENCgzkCE/Gx5rMvp1Q4+7L3D
         BL9kEUnfAAr7UN9FLUnu0kxsgqzGGpY7m1shkCI5aacgN7mP5xqObqpF/SKYPd6Og767
         0mXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject
         :dkim-signature;
        bh=rMDYS9t8OM2LMejvkMwThfbadpSmexSZ7HbNdfCN6Mg=;
        b=wmJV1mhXJmGVetMidmhgEwwPDtJpFP2G70wpNFeyuIWYn3vfK5VC7UZcN31N0xLeBG
         pwb3X0bneN+ZSyF2x9kRdR44LQDRQG/jRMbCJE+XVUjlRidzMlUlYoi+PNzjMkTOHmEr
         YcdbmNZf/ZC+u3OJPJXd8eq9JCJMkwEs7Yxgs0f8qrff6LQnu0y4e2eRj6Yb63MqQHYx
         nbxmNOn5BQtN9+I7c+2eD5gDhUVs7C+DHelRCWzhy6WK/5OJccxOSq9rh8JglUSZKjA+
         zWEVsHZub+za4S2fyRjtg3DHyvOxCYqcCRqi2bP5fiV/tHDAOdCdR4DejBg72XCkLnYn
         T+Sw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=H5PEbZhv;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id a16si1191ejk.1.2020.09.27.23.20.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 23:20:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.53]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mpl0r-1kljTP18RR-00q1YL; Mon, 28
 Sep 2020 08:20:22 +0200
Subject: Re: [PATCH V5 5/5] configs: imx8qm: add configuration files
From: Jan Kiszka <jan.kiszka@web.de>
To: Peng Fan <peng.fan@nxp.com>, Alice Guo <alice.guo@nxp.com>,
 "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <20200922064542.26274-1-alice.guo@nxp.com>
 <20200922064542.26274-5-alice.guo@nxp.com>
 <2f0d667f-68ea-eacf-7b8b-61652bc0d2ce@siemens.com>
 <DB6PR0402MB2760ADEA2D5A37133E5A1D9388360@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <27f73d85-f64c-fa29-0524-1fa360c6385a@siemens.com>
 <88609d72-f571-ad84-78ed-28fcec0198e0@siemens.com>
 <DB6PR0402MB2760EF8A41AFC17F8571BB5B88340@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <143f5a37-9cdc-d2ef-581e-7f7144b6a709@web.de>
 <AM5PR0402MB2756949C49DAC709F669D7F388350@AM5PR0402MB2756.eurprd04.prod.outlook.com>
 <59ce287e-bcc8-16f4-ead3-ff4bf8211628@web.de>
Message-ID: <a6a3bf58-20dc-3704-35c7-d97f7bcf9834@web.de>
Date: Mon, 28 Sep 2020 08:20:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <59ce287e-bcc8-16f4-ead3-ff4bf8211628@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:TrkzKpXraSLIfjOOCdXteV+UaEFDoyUO6/VOteI7XKCq6Bo2/V7
 l6iTtHx9OkjaYCf4XUSCchUfRTPEdj7bGPmMqpjVJJta5fmvptpL5k6200lxL9SxSZgFS/h
 bb3trYQ7TjbjzBxXhopEwjDiWKNTt3FRj5mafp0EuuAkcamun0D4vJPQxONjVTHFhTqYTAK
 05whyeNI3RJTcT4DMJjnA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:AcX+UvtrG88=:7EY40O7kqrTHPr48AwYngY
 tVrRXzmL/GQEjaNplTABPmdZBJX6QH54Oy9Sy1iLUUyf+5Heixkx7lTLGhqZ9AY3IQnMNAu7S
 baL+fnL2bsbB/gOOW/tRxxxnuzoBhynIjBmN39uafAMkST66auwxZRbk94LyYt+4ZKpgGOaC/
 6ONBvxxWuucsHET8VieFjmD90vZdwMd10g8qy28w1rHw7LxKEv/RE9vJKPWwQXmpNPQIUol+d
 calHFe7iU3h7k0+t/BwniOmwgBhNp3mPbgqOlGCIETfKABscbJFy8vOzEl/KMsyJiEm5vqHqO
 OudI9ibcxc87b+wELjWUUV11fIgLvDa1wsy3ZHjcfsDYi7iSxKzoZoLMzBsLxk7PND4mZkZut
 CsgUPLBZ77N+zEUxW5t16lYXszSuLOaL5opsON8zXmTRCxTLbJm8hEOpA/dHc/9iAPssY2joE
 bABszuKRZ+07wd+mU7hy1IkPWnf6tt9sG0/HyU6MM0LXqdp0rv8mqxE0snon2AOULOwsPFCN8
 XGNZjWeGpYB3YDkhfAqcoRZmSLS8qKjN6lMEXnFKVuPCPvJc2O+3yqYljdWyEPT2V+2xAgGfk
 k4nri0roNVFtL9UMPKEvEWHS+s2xp7cWN9Yb6hES+T97YvVFSi7rsZ24QoU8yNLQ9+dU5m6TD
 6e9WbBibHt/OKkhOQTvHi6QqQj73plnZ5dFK7T/NuUqJ2jZTCBIn7uGvHxSA9O6ELlZP/ktlU
 a66THceRK7maV+eZRKVyLIeQ9IabWTsP0TLTTp11WTwZIuSK3DE+p3J1WoaZAkGPPcOljXinf
 V9q7eMZAp3FdUNPiQ/PBnz7d797ukHRsw65yMcwBNFcdhZZc50nxmPWxtEOAIJGYYI4ajsmok
 0S6fQtk7DvGgRMgWRD+mV1qLi3rjXetGJrkvulXjIY07SoTz4WnHGQTjmjirDhDPm6YLDz4jt
 QhmA6BtvVreBs9LYeufdSXb/5ojMMGFrtsvcxYx0WN3hhEKkxZm/LGR/GohOSDTfKzmNNkYx9
 YtsSzwg+0Ma/Bg63g1tSX2g0pyZkq16OT8/WT1yKT6t5pzoED6+y6ypG/ZHCNmTukFzhSsWdy
 JaiB4ONccGxpTdEFy94VxZ0TnyTFH387jBkWP3wRz6YXJUVgiUtnCzr1t9ayo2YV/ciiKMCBK
 szTQBt9Q7OaCTPJzrbBW0x5t/l+el01kJd7vnPaLKnHKW7/6av2xDirVYcoiUD3fuinNOQBHu
 L4eNvHbSCUGy+LXl6BrF/0vPbwDTcRvJlpcOoGA==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=H5PEbZhv;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

On 28.09.20 07:57, Jan Kiszka wrote:
>>>>
>>>> You could try to not bypass SMMU transition in smmu driver, then the
>>>> system might not work well.
>>>
>>> Where is this bypass controlled? In the SMMU settings? Or is that
>>> platform-specific?
>>
>> S2CR_TYPE_BYPASS, smmu settings currently.
>
> Just flipping the type does not seem to be enough. Could you tell me
> what is needed to switch to "block what is is not permitted"?

Looking at the kernel, these two changes are apparently needed:

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 69374b28..ea58340d 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -534,7 +534,7 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)

 	/* Enable client access, handling unmatched streams as appropriate */
 	reg &= ~sCR0_CLIENTPD;
-	reg &= ~sCR0_USFCFG;
+	reg |= sCR0_USFCFG;

 	/* Disable forced broadcasting */
 	reg &= ~sCR0_FB;
@@ -637,9 +637,8 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)

 	smmu->cfgs = (struct arm_smmu_cfg *)(smmu->s2crs + size);

-	/* Configure to Bypass mode */
 	for (i = 0; i < size; i++)
-		smmu->s2crs[i] = s2cr_init_val;
+		smmu->s2crs[i].type = S2CR_TYPE_FAULT;

 	smmu->num_mapping_groups = size;


However, only if I remove all sids from the root cell config of the
zynqmp (num_stream_ids = 0), blocking starts to work. As soon as I have
/any/ sid listed, /all/ transfers pass. I'm using 0x3fff as sid_mask
which covers all 14 bits that are used by that SOC.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a6a3bf58-20dc-3704-35c7-d97f7bcf9834%40web.de.
