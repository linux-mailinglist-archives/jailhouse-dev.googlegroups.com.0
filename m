Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBI7I6LWAKGQEHQLRWBY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 9728BCFE86
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Oct 2019 18:06:59 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id q185sf4410619ljb.20
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Oct 2019 09:06:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570550819; cv=pass;
        d=google.com; s=arc-20160816;
        b=zrV1NA1FVgHKAJ4X/FNHMVBJgir57uAYbj8HhHnHUMBavAG5F/JtOJ4k1ZMV9Zsg7q
         6lvAj2cN9qF9GHqlBB8zG1ruBCyNZIQxXpA78eI91WUSwa4BqI+60N+5LkAABYeOtS5s
         Q0pIGX7ub9KfuU/Uqm95HKsxOzZbuYUyLev+76Qq1Z0SQoqE3czrWyH/q7PBpf1Jd+9S
         XGhLhFRwfaihkFgXuRVe+mUoAK9MdE+fXo4I5ESSgxD78CYrvNxXVH0Omkf55mGO3IBR
         gfeVYX808yGTpk/gDY+6Rxk/TdgYvZp/Fe281sFIqKsSiMjMF18vLWa76qoCC7IvneMS
         dLfg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=X4DHbBA/1Bd1A+mpnx9983j3Q3C/avcaZsj4Z3cT1iY=;
        b=UKIHUJ6NlH9JAEN1p8eS9I9JtWjOofJ8CAomx/oMn4DCrRFeUNmievDCulHKyQuxfE
         A6QYsoKgIgdek0bd8OLX0Rsx0yOa3x/FZg3to4eKRSQj0r55oSkPCGh4PXDvk8IiF5wz
         dqv8w3cMAZpB9ycvKng2pUaYSXpGmRcTa5aztFKml2MBq9x5SgiIK68ehPNKdslN0TwN
         EnRnBrx01M/1aZwoLGbhuoM+ExhSD7O0K42OThknE6Kc4VzfWizGOxon8pTPkYxFqU9+
         2WbZ+8SD6hnc8/e4+txPtXICULXgWki3qxs90ZGdInEHug22JNugbcbmyUWJf9CsKoHl
         DyaQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=X4DHbBA/1Bd1A+mpnx9983j3Q3C/avcaZsj4Z3cT1iY=;
        b=srl67nR3eEjhS+2sTjLeq1UIilvW6X9VuxcnBjuFHbCiXpiaxe8raT7SQ8SFl00Zpt
         NhHGph3D+/UwopUAM0pWXogq+YuqBitUFYz0OhQaD/1e9E36dPNi84sVo2ospGId+J/b
         gKbbqSj6RnlcrmoTbAN0/ITjKlNatWuPpOqrYZVvgtl8vmmDMp5Q7JpiuI9wzM47ek6/
         uT/BFZ0k9xmo8d2lm93zfc8+C/q0kKW8FIrPyqAIuH78aPOWsVQpUjyU2D0Xt1a/zjWr
         V6MA+ZrqzrattJLgP149DI+VXPwSGIH3va9ZtUmZ5HDm6Acgmf4ijppkWwsssPb02to8
         EOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=X4DHbBA/1Bd1A+mpnx9983j3Q3C/avcaZsj4Z3cT1iY=;
        b=KgkLVGKjtJnFiMUGCBc+tGkN2vw2DRDvJ9NlLz4H3xyTNKn8K3waZNRY8XwyUmonYF
         dnVM0O9Y5/HWSb0tTYcJEfpW58PKwbff9GYt0wDDCdHFGT3inkuDlkQbckFEVPzOINM9
         CEmZke1eLkmIJZN/j0mTg/c3Ep/rRkaY1WVDVy90QNtRt/L8szdTWiw/qEQizSoWlJsC
         /bG44WA+xA1TfYMWNpsGySNL/eYo0GW/lNrFJGbkyHaU3HcAu6C4Odz1grO/teYXBy+Y
         ThfGLHm4nrQus4fO5loHFqmxU/p7Z7TEL9imnp3zM2utiCu1S/p4vVx1bxZkUkicHYPr
         UmxA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWCL0OoJ4hcCPAN8g9AfhDgIRDxR0dKejfjygpEUWCUsKrp3vJr
	x9/Jpiz8zzrR34cwvFAOOxc=
X-Google-Smtp-Source: APXvYqx7zdUHagyBLm8KQDNnhJ2EI/r7cBroypWZCJXzsfCrMfP1lBG48Phit2NBfBQD7RIx9BWpVw==
X-Received: by 2002:a19:7413:: with SMTP id v19mr20675814lfe.176.1570550819173;
        Tue, 08 Oct 2019 09:06:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9d44:: with SMTP id y4ls549472ljj.4.gmail; Tue, 08 Oct
 2019 09:06:58 -0700 (PDT)
X-Received: by 2002:a2e:9693:: with SMTP id q19mr23387764lji.12.1570550818541;
        Tue, 08 Oct 2019 09:06:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570550818; cv=none;
        d=google.com; s=arc-20160816;
        b=G8Xfi/cd/0DTkg7HZfcoCcN9xspgRrlzDtY4KDgl3pk1FxWm8qcmtyTBiJ3EKpPOgu
         RcIgm2/shaVpO3x3X8VuzSR1s5cEdTGOIrm2BT2W3+2SlMTqhGUQpn+0UNe/wHTXR0yb
         u9MOIwGklLR/qMKY158SXBPF/gXONmxyYScg26snYfpDURPf1laBPWcyM2xOIBfkjdaT
         iL/GgSmW0FtilvZXYx++vNiY2xWlilJy9G4nKUZzEAh5NhGMd2PQHBohgwE5m98hk0+m
         e9HA+4Zsaz2BInib+8tlJTZ2cGQpmnQOPA+FZIJHlQphf3Tr3zhRGVNf4xHkuxsquYrF
         zvaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=YlSaLs32GM0IMSVDZkzrbZxite5Lpp67urOc7uC+nN4=;
        b=unl5CO2Fh7Txaea7T8h99L6mBolkuwAfDZj4EICfz1nsT+s/CTjgLcdwEJB04YzWRY
         qkKWwdHuU85eHSVdbtFiqSW1FNpKWPP6QYq/5q+RCKBDPOUZLAeE8hjNy3jKZ78y9+dI
         a36T3apFu46+vrP48TYxyP+EJbyy6Sno5IP7b4PJJ0ObYq/Hm7WwCSVjMDweaKId/W1r
         zI1mKYDMG8UnPCgBM6EPx61rwFF0oG/N/gl3uBt7c7ZJJYsC3j+4tDGLjbyZEqKCwUEe
         DgSh4AvDPYSEaiSWV+w555wpux7saYgzHItemkwiC8vTmK8J1DXOWS4m2qBaZ3Q5yHg1
         fdZQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id y6si1096548lji.0.2019.10.08.09.06.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2019 09:06:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x98G6vl4016819
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Oct 2019 18:06:57 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x98G6vKk000574;
	Tue, 8 Oct 2019 18:06:57 +0200
Subject: Re: [PATCH v3 04/14] pyjailhouse: sysfs_parser: minor stylistic
 fixups
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Andrej Utz <andrej.utz@st.oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190930191323.32266-1-andrej.utz@st.oth-regensburg.de>
 <20190930191323.32266-5-andrej.utz@st.oth-regensburg.de>
 <606abee9-5e5a-8add-062c-7a00833de34a@siemens.com>
 <0c40baa8-30bf-d60f-d8f2-860db42ff7c2@oth-regensburg.de>
 <e2342a7e-29c0-0e2f-ecf2-b82a7d1cd1c8@siemens.com>
 <144f50bb-ccfa-403a-333c-da36fe55effb@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <7550a192-66d4-c107-bb82-06e4c19a144b@siemens.com>
Date: Tue, 8 Oct 2019 18:06:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <144f50bb-ccfa-403a-333c-da36fe55effb@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 08.10.19 18:04, Ralf Ramsauer wrote:
> 
> 
> On 10/8/19 6:01 PM, Jan Kiszka wrote:
>> On 08.10.19 17:56, Ralf Ramsauer wrote:
>>>>> @@ -950,8 +947,8 @@ class IOMemRegionTree:
>>>>>                  continue
>>>>>  
>>>>>              # if the tree continues recurse further down ...
>>>>> -            if (len(tree.children) > 0):
>>>>> -                (temp_regions, temp_dmar_regions) = \
>>>>> +            if len(tree.children) > 0:
>>>>> +                temp_regions, temp_dmar_regions = \
>>>
>>> Will re-add brackets here, and in all other patches.
>>>
>>
>> Why that?
> 
> Erm, because you commented "Style" for those cases in all other patches?
> I'm referring to the second line of the hunk, not the 'if'-line.
> 

Yeah, /me was starring at line #1, you correctly meant #2.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7550a192-66d4-c107-bb82-06e4c19a144b%40siemens.com.
