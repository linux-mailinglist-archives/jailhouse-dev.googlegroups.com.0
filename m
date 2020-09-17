Return-Path: <jailhouse-dev+bncBDRKPIXWWIFBBTFCRT5QKGQENYSP35Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 134FE26D4C7
	for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Sep 2020 09:33:33 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id a81sf184054lfd.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Sep 2020 00:33:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600328012; cv=pass;
        d=google.com; s=arc-20160816;
        b=0SfqWFzpGH/JLhGNEbIjhPea39jb0np3Ap6LEewt0WJF6wbS/K7WdNMCtMlPi7kaVM
         Zew/TGBZ92SrqAVv/kVcgehouyPcx9hnQ+2ik34YwHTdSny5aJ1gXhL9a2Jl1UDZjw5X
         YwOrE2b9KPBcBxHczqHbmevWDZqk+gGjz4Cf7ZjEDq1JEiCid2ISacKttqdpvZfAm/hQ
         jtb0fqI/pGEfbyUkQb9LLhqmjBQ7DKVCn/kZbcKcrNnZNawiBhhmmhEBS508a32G0Z4Y
         4k18tydPRjsF87xiaPgPoI+Qy1PGZoy6FWTcTxGz7ODppQCEXPotR/cup7nk9sTp7y+8
         0Eug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:to:cc:in-reply-to:date
         :subject:mime-version:message-id:from:sender:dkim-signature;
        bh=N/AMLf2EgmYSKlU/9EBbI75dFbbE8lcK53l4begHkMY=;
        b=DtiFwohDwa5miJb9MAPVIBIOIOOcZsSoUKXbwWLe9Qbl9VSw7oNhhapkYFLrbtMGjf
         iMvwqrNmJfwyaUFx9N3IlTVHQFIKuRpH4YnPOLfzCtY+uRUYJpPM2Wg/YehiuEb86P3k
         koTL+E16el56jN/7qdbFBOQalZf/Q/unwwHKzWdpE33t+7RoNBK5QhqWXlq7cv/0qvhe
         gZBSLkgoAb3r/H5QY7TNTHRtu28ABKVZeGyYUH8OVnDgNjJNqJAoz3/XbELZAp1mEg1M
         VqoJkKd7k9xm5r1DW6r4dqds5ITKqGhULK2uKCZMLIxnBcUFjuccBdFXGvDeS2Q21Sf3
         YWSw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=FoByo2IB;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.19 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:message-id:mime-version:subject:date:in-reply-to:cc:to
         :references:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=N/AMLf2EgmYSKlU/9EBbI75dFbbE8lcK53l4begHkMY=;
        b=LJ6qXgxo3R2bwEfydnBFy8W6sw9xgpRx8kPZ5TEeYbDLOBkAwGBBclQxWBjUcHfF3s
         xotmgm1NC0tRte7ojdaXOHK6QQ60Qi+iRA6mnuvp/F/vIMMhVp8WW2NcP+YzYUWaz4lz
         Yr4ye54eMgI7/dcNdBFQZe7DgTDfjXUYkMETxUtni7SLmLomMSPR3WvD8TCbGaWRS15o
         OQrcVlKz8Devr+HcKK4Q3IXze7HYT7bAakzF1Lfmo8O3pXhnXPcR1NWrkIU4k6Ct1T5D
         10VR/zb5W6RdZE+2l/nTfgBs7J540Fn5dPwjgWOGBpQxkq+Gg4KehS3K4cNilAqYvyWN
         u6uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:message-id:mime-version:subject:date
         :in-reply-to:cc:to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=N/AMLf2EgmYSKlU/9EBbI75dFbbE8lcK53l4begHkMY=;
        b=B8RnY/LdUpdQPKtd8d6ZwUoFOgME3qnwkJfX16ssyAQ1vTtCts+lR+CgK5nvmclaj4
         csrJSeXOBOKb337P1ZieJ1o9bYN1c/RGVBGmJydubgPyB+ZjTPc0V4pA4oeRfSlyP6DF
         m4fM7ze1bJ+UnJwGJMCn8idv2fON3Uap71Qfk4tnu8uXE9qTUauNQ/7LgOHjE1Pk3KST
         iCERV6WjNwUMVj8fSe4nunhetgqkPT6iock3TG04MKnfQY2K2ZeFtDoq761GfH6IVZ+r
         b7UAefijoUgl752O6eXYEnzbhTAI4w70WziHXIm1kDWyTBQbVcMXq2FdHnBplSc4aamc
         4Mpw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532T9+RduHYdvbvvX7om8e7iuZgV/kqd6G4ScJWkNtXbNeL6nwwa
	64+70TyNCEAbyYIxU4hlw5k=
X-Google-Smtp-Source: ABdhPJxoY9IK0jqe1WkPSw0H1mBBVqnW5at+Y0lw5fZu3w8Gah2085nXI3fEQkHxXwd+d8Irdn740A==
X-Received: by 2002:a2e:9890:: with SMTP id b16mr10468630ljj.28.1600328012601;
        Thu, 17 Sep 2020 00:33:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5c44:: with SMTP id s4ls342608lfp.3.gmail; Thu, 17 Sep
 2020 00:33:31 -0700 (PDT)
X-Received: by 2002:a19:4306:: with SMTP id q6mr6112511lfa.147.1600328011174;
        Thu, 17 Sep 2020 00:33:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600328011; cv=none;
        d=google.com; s=arc-20160816;
        b=dM8hDlkd54L7A38BAmU+6sx5KWgtoEhOHb8GpUZje28L4oAeY1cE7heah32pJiHJ7D
         N5Sm8hN4ZpOezL+VyhGPXXnqIVqBCmiKcrOz2psHroauDs4zvky9elfYRlqHKZhP05xS
         aKXIk5aQSGX1ifbqM7ApH1S1Ois9rtSF6Urxi1GRzW8hrWtf0GxuuTRYmgYWJbzIMltb
         apTqk5cx8hOvDMA3thnh45Dq9ds9on05OK+RKJs208UcoczLshMk+5AVfQIVh+QQNfyp
         7JPf5ObHxSxwX+hcAfMFI4fZe3ISGogy5WaS2jQ/H24CpUURrsIqwe4EBPZgdfJEz89m
         BrJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:dkim-signature;
        bh=5Mg07dv0a6WPBTfarTBoqwBSNwyqAR55bpwZ0eRgTzY=;
        b=FhmZGvNyIpE6G8SSBiPeIDd9P8XuAR3syWAVtaK8XB0PmhqpnX9jEPeiH1L1MSHTwR
         MF3fvaZX/igJFWpBNOamOtEEw+oHTOv2quRDrgWhNaGJxyGldWEEyREIesBzVBCf/Nu1
         OjWLSLRXngUpklPecEDafesnCsBeG5FTouiLbKOc/6NyaM52dTFIPj2oCe71JA2BPmMo
         aMjs+mtMy40WS4cKKbK0hS4179UYJ2VIS2iDUbq2p4/yyLG1VXF36ta74Ot6GtzYP75Q
         lONeU1ajXIWhCa/VnebCndwRPMu7tybAr7h6zxvOsdRnDpzbNWAQ22hniMPqMvEx+B7n
         KY1g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=FoByo2IB;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.19 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
Received: from mout.gmx.net (mout.gmx.net. [212.227.15.19])
        by gmr-mx.google.com with ESMTPS id v191si494941lfa.6.2020.09.17.00.33.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 00:33:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.19 as permitted sender) client-ip=212.227.15.19;
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from nethserver.fritz.box ([5.149.23.5]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MQvCv-1k5wdh0IfX-00Nz9M; Thu, 17
 Sep 2020 09:33:30 +0200
Received: from [192.168.2.64] (unknown [192.168.2.64])
	(Authenticated sender: oliver)
	by nethserver.fritz.box (Postfix) with ESMTPSA id 7773C202544E;
	Thu, 17 Sep 2020 09:33:29 +0200 (CEST)
From: Oliver Schwartz <Oliver.Schwartz@gmx.de>
Message-Id: <A808F818-919F-413D-8849-1BAEBFF54C40@gmx.de>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_49A56F20-2C24-4BB2-BA9A-C5594952D833"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH V2 1/2] arch64: Make sure SMC and HVC calls don't have
 side effects
Date: Thu, 17 Sep 2020 09:33:29 +0200
In-Reply-To: <9f124890-9d6f-0fe1-65b9-4a9f5185ed1e@siemens.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>
References: <C9905595-F658-4431-AF1D-F9ECDD38A20C@gmx.de>
 <9f124890-9d6f-0fe1-65b9-4a9f5185ed1e@siemens.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
X-Provags-ID: V03:K1:ZVe/ZWChk9M8lx0qqWcm72nL3B/xuYN+AovQ8Mtjx/Q1VFyUf/U
 9pDUuSU7PT8bZOhRpm9sT6jLipj00ZIagXx+TTSep3uA+PQNkQCZp8HCnZPlA+/bIy+ijLL
 38JRVuokgE20cfEcKLnBSmW3bvOpPkUmBgaMbZEF5blpkz2ckLfdDmS7aZFiWTf5F3YJrCS
 ShxYB1DbS2GpgWI83KAZQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:fIPozki7ca8=:3aSTe5wOmh+52MO+aOnypZ
 G7CTdGUuGx3V00V+lgniNmyMcuIqgK9gZR3iGAZ2HpMVxn8S6BhdujZdO+de4JrKrbHb8BDma
 C/LkKHf8+UWgGeOKdO2oivKJW9etocg4jj7unlOik4eS7hLHreUhIXKskyQ+SGD06V46PsOge
 NRTiMwwhWg6mCs3lU8AsTUZEkabLanML3dKBzj/h+CN8gi6aeE0ZKZf2vX3Ii+EEC/+rqgw3f
 wlp+JwNbwmnIo1z79/S/dGvbIh/lbcG4Vs3JAKCw4WenPW19xkNZgJCuQMUOl1INWkLP/daE9
 zaDYf8C4DLKZG+wqXhgyjs1RBko6z01rA5wJK8HD/Eib3S+PX3IwIGLh9iBgyJG5WOFj/k7F8
 0ZS4fXCamVXPAU1gwpA2AOK5km7LUAHPkflPSMOhhuUz2457CUGoyB3a8bmlTaBaY7MLwY/HY
 PYdjNGqHTL2YBNEEC5QuxTdsrQWVpOAiyolOO0dc4Qhsbz4qRoG6lV1FOe1iRmJt1Ogm+kTSZ
 MRNb3CVyaPZbfX/+Okw1Z9y/TB3RY0sjExruE7H/DuQYHqCHF2VYgvuIJEeqXiAlkLuHRVni8
 mt9niBuPM7K5qEhDuh0DOCFC4vwWU+U1D3YYAqtlPqJPd3/1rXD3adUL6HnRdJv1RMhwjtLqZ
 4EA/iepYP1Ouzdh4j00oHY41l5Vm0FUSGQvK97LuG1NTI3aWKL6MErnIT7LIAr5NWrs73rvvr
 MgIOegSudI/vy9wtSzXW356eEJeGeUterwxJ1QnadrgCuLsdyUJhck6A32gQQBGny6AcMC5r0
 TwhaI2RnGpHUt/BcuJAoq1twx/XnNeTvRea4NbdnjFkvK8D+H9dIvTV30Y0zhPLe4mE/ZjCUd
 nxayGYad7DbkbPUkkB0qYGNTs7GPGS7A7a1jlf1Ez8Fl/2aD1KgsTW6keDnGRXeEjSflntR01
 tkeLgysQlSWoVmrPFOBmzZl2cKrpGbKTmmQNb3rzXXvnFZny5yqjS398upQ3/1xwjhXGDpII7
 +sSHWd/ogeQIHQzL5tIRqWDqQM+qqZxuvxOqJm0P+6SKzoQ4DaRIEPLE4Cf1H0z315uMGnX47
 bILOtODRl+5k2Ev4kOz0txGWOV4WfDBR+CKpo6jEdShGGUou68ueKI5LHoHx698wfwKTLW0HP
 rSOtsqkR5ZfjJgb+b2wQQneQHQWw/g6TNefT2kqsZN64iV1dCrA6lY6ASSD8B5Dg6I0hTV7DX
 TkQndo1xv7eRy9pXhMblVJcOA6AK2/HyEcxuBJQ==
X-Original-Sender: oliver.schwartz@gmx.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmx.net header.s=badeba3b8450 header.b=FoByo2IB;       spf=pass
 (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.19 as
 permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
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


--Apple-Mail=_49A56F20-2C24-4BB2-BA9A-C5594952D833
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"



> On 17 Sep 2020, at 08:26, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>=20
> Subject tag should be "arm64". And the patch should go over next first. I=
 can fix up both.
>=20
> On 16.09.20 15:07, Oliver Schwartz wrote:
>> SMC/HVC calls may modify registers x0 to x3. To make sure the compiler
>> doesn't assume input registers to be constant, also mark these registers
>> as output when used as input.
>> Signed-off-by: Oliver Schwartz <Oliver.Schwartz@gmx.de>
>> ---
>>  hypervisor/arch/arm64/include/asm/smc.h      | 13 ++++++-------
>>  include/arch/arm64/asm/jailhouse_hypercall.h | 20 +++++++++++---------
>>  2 files changed, 17 insertions(+), 16 deletions(-)
>> diff --git a/hypervisor/arch/arm64/include/asm/smc.h b/hypervisor/arch/a=
rm64/include/asm/smc.h
>> index 1a5d5c8..c80fe15 100644
>> --- a/hypervisor/arch/arm64/include/asm/smc.h
>> +++ b/hypervisor/arch/arm64/include/asm/smc.h
>> @@ -28,8 +28,8 @@ static inline long smc_arg1(unsigned long id, unsigned=
 long par1)
>>  	register unsigned long __par1 asm("r1") =3D par1;
>>    	asm volatile ("smc #0\n\t"
>> -		: "=3Dr" (__id)
>> -		: "r"(__id), "r"(__par1)
>> +		: "+r" (__id), "+r"(__par1)
>> +		:
>>  		: "memory", "x2", "x3");
>> =20
>=20
> For SMCCC, I'm considering to align fully with Linux, i.e. convert the re=
maining register clobberings into early ones, but I also have no strong arg=
ument for it.

I find the the clobber list a lot easier to understand, whereas the =3D& sy=
ntax isn=E2=80=99t, even after reading up on it. Using =3D& also requires t=
o introduce additional dummy variables for the clobber registers. On the ot=
her hand I see the point in being in line with the kernel.=20

Oliver

>=20
> Ralf, thoughts?
>=20
> Jan
>=20
>>  	return __id;
>> @@ -43,8 +43,8 @@ static inline long smc_arg2(unsigned long id, unsigned=
 long par1,
>>  	register unsigned long __par2 asm("r2") =3D par2;
>>    	asm volatile ("smc #0\n\t"
>> -		: "=3Dr" (__id)
>> -		: "r"(__id), "r"(__par1), "r"(__par2)
>> +		: "+r" (__id), "+r"(__par1), "+r"(__par2)
>> +		:
>>  		: "memory", "x3");
>>    	return __id;
>> @@ -62,9 +62,8 @@ static inline long smc_arg5(unsigned long id, unsigned=
 long par1,
>>  	register unsigned long __par5 asm("r5") =3D par5;
>>    	asm volatile ("smc #0\n\t"
>> -		: "=3Dr" (__id)
>> -		: "r"(__id), "r"(__par1), "r"(__par2), "r"(__par3),
>> -		  "r"(__par4), "r"(__par5)
>> +		: "+r" (__id), "+r"(__par1), "+r"(__par2), "+r"(__par3)
>> +		: "r"(__par4), "r"(__par5)
>>  		: "memory");
>>    	return __id;
>> diff --git a/include/arch/arm64/asm/jailhouse_hypercall.h b/include/arch=
/arm64/asm/jailhouse_hypercall.h
>> index 108d052..a9d13ee 100644
>> --- a/include/arch/arm64/asm/jailhouse_hypercall.h
>> +++ b/include/arch/arm64/asm/jailhouse_hypercall.h
>> @@ -42,6 +42,7 @@
>>  #define JAILHOUSE_CALL_NUM_RESULT	"x0"
>>  #define JAILHOUSE_CALL_ARG1		"x1"
>>  #define JAILHOUSE_CALL_ARG2		"x2"
>> +#define JAILHOUSE_CALL_CLOBBERED	"x3"
>>    /* CPU statistics, arm64-specific part */
>>  #define JAILHOUSE_NUM_CPU_STATS			JAILHOUSE_GENERIC_CPU_STATS + 5
>> @@ -54,9 +55,10 @@ static inline __u64 jailhouse_call(__u64 num)
>>    	asm volatile(
>>  		JAILHOUSE_CALL_INS
>> -		: "=3Dr" (num_result)
>> -		: "r" (num_result)
>> -		: "memory");
>> +		: "+r" (num_result)
>> +		:
>> +		: "memory", JAILHOUSE_CALL_ARG1, JAILHOUSE_CALL_ARG2,
>> +		  JAILHOUSE_CALL_CLOBBERED);
>>  	return num_result;
>>  }
>>  @@ -67,9 +69,9 @@ static inline __u64 jailhouse_call_arg1(__u64 num, __=
u64 arg1)
>>    	asm volatile(
>>  		JAILHOUSE_CALL_INS
>> -		: "=3Dr" (num_result)
>> -		: "r" (num_result), "r" (__arg1)
>> -		: "memory");
>> +		: "+r" (num_result), "+r" (__arg1)
>> +		:
>> +		: "memory", JAILHOUSE_CALL_ARG2, JAILHOUSE_CALL_CLOBBERED);
>>  	return num_result;
>>  }
>>  @@ -81,9 +83,9 @@ static inline __u64 jailhouse_call_arg2(__u64 num, __=
u64 arg1, __u64 arg2)
>>    	asm volatile(
>>  		JAILHOUSE_CALL_INS
>> -		: "=3Dr" (num_result)
>> -		: "r" (num_result), "r" (__arg1), "r" (__arg2)
>> -		: "memory");
>> +		: "+r" (num_result), "+r" (__arg1), "+r" (__arg2)
>> +		:
>> +		: "memory", JAILHOUSE_CALL_CLOBBERED);
>>  	return num_result;
>>  }
>> =20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/A808F818-919F-413D-8849-1BAEBFF54C40%40gmx.de.

--Apple-Mail=_49A56F20-2C24-4BB2-BA9A-C5594952D833
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="UTF-8"

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8"></head><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: s=
pace; line-break: after-white-space;" class=3D""><br class=3D""><div><br cl=
ass=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">On 17 Sep 202=
0, at 08:26, Jan Kiszka &lt;<a href=3D"mailto:jan.kiszka@siemens.com" class=
=3D"">jan.kiszka@siemens.com</a>&gt; wrote:</div><br class=3D"Apple-interch=
ange-newline"><div class=3D""><span style=3D"caret-color: rgb(0, 0, 0); fon=
t-family: Helvetica; font-size: 12px; font-style: normal; font-variant-caps=
: normal; font-weight: normal; letter-spacing: normal; text-align: start; t=
ext-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0=
px; -webkit-text-stroke-width: 0px; text-decoration: none; float: none; dis=
play: inline !important;" class=3D"">Subject tag should be "arm64". And the=
 patch should go over next first. I can fix up both.</span><br style=3D"car=
et-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style=
: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: n=
ormal; text-align: start; text-indent: 0px; text-transform: none; white-spa=
ce: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decorat=
ion: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family:=
 Helvetica; font-size: 12px; font-style: normal; font-variant-caps: normal;=
 font-weight: normal; letter-spacing: normal; text-align: start; text-inden=
t: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webk=
it-text-stroke-width: 0px; text-decoration: none;" class=3D""><span style=
=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; fon=
t-style: normal; font-variant-caps: normal; font-weight: normal; letter-spa=
cing: normal; text-align: start; text-indent: 0px; text-transform: none; wh=
ite-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-=
decoration: none; float: none; display: inline !important;" class=3D"">On 1=
6.09.20 15:07, Oliver Schwartz wrote:</span><br style=3D"caret-color: rgb(0=
, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-=
variant-caps: normal; font-weight: normal; letter-spacing: normal; text-ali=
gn: start; text-indent: 0px; text-transform: none; white-space: normal; wor=
d-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" cla=
ss=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0p=
x; text-transform: none; white-space: normal; widows: auto; word-spacing: 0=
px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-de=
coration: none;" class=3D"">SMC/HVC calls may modify registers x0 to x3. To=
 make sure the compiler<br class=3D"">doesn't assume input registers to be =
constant, also mark these registers<br class=3D"">as output when used as in=
put.<br class=3D"">Signed-off-by: Oliver Schwartz &lt;<a href=3D"mailto:Oli=
ver.Schwartz@gmx.de" class=3D"">Oliver.Schwartz@gmx.de</a>&gt;<br class=3D"=
">---<br class=3D"">&nbsp;hypervisor/arch/arm64/include/asm/smc.h &nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;| 13 ++++++-------<br class=3D"">&nbsp;include/arch/ar=
m64/asm/jailhouse_hypercall.h | 20 +++++++++++---------<br class=3D"">&nbsp=
;2 files changed, 17 insertions(+), 16 deletions(-)<br class=3D"">diff --gi=
t a/hypervisor/arch/arm64/include/asm/smc.h b/hypervisor/arch/arm64/include=
/asm/smc.h<br class=3D"">index 1a5d5c8..c80fe15 100644<br class=3D"">--- a/=
hypervisor/arch/arm64/include/asm/smc.h<br class=3D"">+++ b/hypervisor/arch=
/arm64/include/asm/smc.h<br class=3D"">@@ -28,8 +28,8 @@ static inline long=
 smc_arg1(unsigned long id, unsigned long par1)<br class=3D"">&nbsp;<span c=
lass=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>register unsign=
ed long __par1 asm("r1") =3D par1;<br class=3D"">&nbsp;&nbsp;&nbsp;<span cl=
ass=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>asm volatile ("s=
mc #0\n\t"<br class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-spa=
ce: pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;=
">	</span>: "=3Dr" (__id)<br class=3D"">-<span class=3D"Apple-tab-span" sty=
le=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" style=3D"wh=
ite-space: pre;">	</span>: "r"(__id), "r"(__par1)<br class=3D"">+<span clas=
s=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span class=3D"App=
le-tab-span" style=3D"white-space: pre;">	</span>: "+r" (__id), "+r"(__par1=
)<br class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;"=
>	</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span=
>:<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space:=
 pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>: "memory", "x2", "x3");<br class=3D"">&nbsp;<br class=3D""></blockq=
uote><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-s=
ize: 12px; font-style: normal; font-variant-caps: normal; font-weight: norm=
al; letter-spacing: normal; text-align: start; text-indent: 0px; text-trans=
form: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-wid=
th: 0px; text-decoration: none;" class=3D""><span style=3D"caret-color: rgb=
(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; fon=
t-variant-caps: normal; font-weight: normal; letter-spacing: normal; text-a=
lign: start; text-indent: 0px; text-transform: none; white-space: normal; w=
ord-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; fl=
oat: none; display: inline !important;" class=3D"">For SMCCC, I'm consideri=
ng to align fully with Linux, i.e. convert the remaining register clobberin=
gs into early ones, but I also have no strong argument for it.</span><br st=
yle=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; letter-=
spacing: normal; text-align: start; text-indent: 0px; text-transform: none;=
 white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; te=
xt-decoration: none;" class=3D""></div></blockquote><div><br class=3D""></d=
iv><div>I find the the clobber list a lot easier to understand, whereas the=
 =3D&amp; syntax isn=E2=80=99t, even after reading up on it. Using =3D&amp;=
 also requires to introduce additional dummy variables for the clobber regi=
sters. On the other hand I see the point in being in line with the kernel.&=
nbsp;</div><div><br class=3D""></div><div>Oliver</div><br class=3D""><block=
quote type=3D"cite" class=3D""><div class=3D""><br style=3D"caret-color: rg=
b(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; fo=
nt-variant-caps: normal; font-weight: normal; letter-spacing: normal; text-=
align: start; text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica=
; font-size: 12px; font-style: normal; font-variant-caps: normal; font-weig=
ht: normal; letter-spacing: normal; text-align: start; text-indent: 0px; te=
xt-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-st=
roke-width: 0px; text-decoration: none; float: none; display: inline !impor=
tant;" class=3D"">Ralf, thoughts?</span><br style=3D"caret-color: rgb(0, 0,=
 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-vari=
ant-caps: normal; font-weight: normal; letter-spacing: normal; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; word-sp=
acing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=
=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-=
size: 12px; font-style: normal; font-variant-caps: normal; font-weight: nor=
mal; letter-spacing: normal; text-align: start; text-indent: 0px; text-tran=
sform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-wi=
dth: 0px; text-decoration: none;" class=3D""><span style=3D"caret-color: rg=
b(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; fo=
nt-variant-caps: normal; font-weight: normal; letter-spacing: normal; text-=
align: start; text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; f=
loat: none; display: inline !important;" class=3D"">Jan</span><br style=3D"=
caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-st=
yle: normal; font-variant-caps: normal; font-weight: normal; letter-spacing=
: normal; text-align: start; text-indent: 0px; text-transform: none; white-=
space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-deco=
ration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-fami=
ly: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: norm=
al; font-weight: normal; letter-spacing: normal; text-align: start; text-in=
dent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -w=
ebkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><blockquot=
e type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px; font-styl=
e: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; orphans: auto; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-s=
ize-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;" c=
lass=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: pre;">=
	</span>return __id;<br class=3D"">@@ -43,8 +43,8 @@ static inline long smc=
_arg2(unsigned long id, unsigned long par1,<br class=3D"">&nbsp;<span class=
=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>register unsigned l=
ong __par2 asm("r2") =3D par2;<br class=3D"">&nbsp;&nbsp;&nbsp;<span class=
=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>asm volatile ("smc =
#0\n\t"<br class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:=
 pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>: "=3Dr" (__id)<br class=3D"">-<span class=3D"Apple-tab-span" style=
=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" style=3D"whit=
e-space: pre;">	</span>: "r"(__id), "r"(__par1), "r"(__par2)<br class=3D"">=
+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span c=
lass=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>: "+r" (__id), =
"+r"(__par1), "+r"(__par2)<br class=3D"">+<span class=3D"Apple-tab-span" st=
yle=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" style=3D"w=
hite-space: pre;">	</span>:<br class=3D"">&nbsp;<span class=3D"Apple-tab-sp=
an" style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" styl=
e=3D"white-space: pre;">	</span>: "memory", "x3");<br class=3D"">&nbsp;&nbs=
p;&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>=
return __id;<br class=3D"">@@ -62,9 +62,8 @@ static inline long smc_arg5(un=
signed long id, unsigned long par1,<br class=3D"">&nbsp;<span class=3D"Appl=
e-tab-span" style=3D"white-space: pre;">	</span>register unsigned long __pa=
r5 asm("r5") =3D par5;<br class=3D"">&nbsp;&nbsp;&nbsp;<span class=3D"Apple=
-tab-span" style=3D"white-space: pre;">	</span>asm volatile ("smc #0\n\t"<b=
r class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	<=
/span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>: =
"=3Dr" (__id)<br class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-=
space: pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: p=
re;">	</span>: "r"(__id), "r"(__par1), "r"(__par2), "r"(__par3),<br class=
=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><=
span class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span cla=
ss=3D"Apple-converted-space">&nbsp;</span>&nbsp;"r"(__par4), "r"(__par5)<br=
 class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	</=
span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>: "=
+r" (__id), "+r"(__par1), "+r"(__par2), "+r"(__par3)<br class=3D"">+<span c=
lass=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span class=3D"=
Apple-tab-span" style=3D"white-space: pre;">	</span>: "r"(__par4), "r"(__pa=
r5)<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space=
: pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">=
	</span>: "memory");<br class=3D"">&nbsp;&nbsp;&nbsp;<span class=3D"Apple-t=
ab-span" style=3D"white-space: pre;">	</span>return __id;<br class=3D"">dif=
f --git a/include/arch/arm64/asm/jailhouse_hypercall.h b/include/arch/arm64=
/asm/jailhouse_hypercall.h<br class=3D"">index 108d052..a9d13ee 100644<br c=
lass=3D"">--- a/include/arch/arm64/asm/jailhouse_hypercall.h<br class=3D"">=
+++ b/include/arch/arm64/asm/jailhouse_hypercall.h<br class=3D"">@@ -42,6 +=
42,7 @@<br class=3D"">&nbsp;#define JAILHOUSE_CALL_NUM_RESULT<span class=3D=
"Apple-tab-span" style=3D"white-space: pre;">	</span>"x0"<br class=3D"">&nb=
sp;#define JAILHOUSE_CALL_ARG1<span class=3D"Apple-tab-span" style=3D"white=
-space: pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>"x1"<br class=3D"">&nbsp;#define JAILHOUSE_CALL_ARG2<span cla=
ss=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span class=3D"Ap=
ple-tab-span" style=3D"white-space: pre;">	</span>"x2"<br class=3D"">+#defi=
ne JAILHOUSE_CALL_CLOBBERED<span class=3D"Apple-tab-span" style=3D"white-sp=
ace: pre;">	</span>"x3"<br class=3D"">&nbsp;&nbsp;&nbsp;/* CPU statistics, =
arm64-specific part */<br class=3D"">&nbsp;#define JAILHOUSE_NUM_CPU_STATS<=
span class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span cla=
ss=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span class=3D"Ap=
ple-tab-span" style=3D"white-space: pre;">	</span>JAILHOUSE_GENERIC_CPU_STA=
TS + 5<br class=3D"">@@ -54,9 +55,10 @@ static inline __u64 jailhouse_call(=
__u64 num)<br class=3D"">&nbsp;&nbsp;&nbsp;<span class=3D"Apple-tab-span" s=
tyle=3D"white-space: pre;">	</span>asm volatile(<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span class=3D=
"Apple-tab-span" style=3D"white-space: pre;">	</span>JAILHOUSE_CALL_INS<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	</s=
pan><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>: "=
=3Dr" (num_result)<br class=3D"">-<span class=3D"Apple-tab-span" style=3D"w=
hite-space: pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-spa=
ce: pre;">	</span>: "r" (num_result)<br class=3D"">-<span class=3D"Apple-ta=
b-span" style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>: "memory");<br class=3D"">+<span class=
=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span class=3D"Appl=
e-tab-span" style=3D"white-space: pre;">	</span>: "+r" (num_result)<br clas=
s=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>=
<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>:<br cla=
ss=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span=
><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>: "memo=
ry", JAILHOUSE_CALL_ARG1, JAILHOUSE_CALL_ARG2,<br class=3D"">+<span class=
=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span class=3D"Appl=
e-tab-span" style=3D"white-space: pre;">	</span><span class=3D"Apple-conver=
ted-space">&nbsp;</span>&nbsp;JAILHOUSE_CALL_CLOBBERED);<br class=3D"">&nbs=
p;<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>return=
 num_result;<br class=3D"">&nbsp;}<br class=3D"">&nbsp;@@ -67,9 +69,9 @@ st=
atic inline __u64 jailhouse_call_arg1(__u64 num, __u64 arg1)<br class=3D"">=
&nbsp;&nbsp;&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: pre;=
">	</span>asm volatile(<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" style=3D=
"white-space: pre;">	</span>JAILHOUSE_CALL_INS<br class=3D"">-<span class=
=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span class=3D"Appl=
e-tab-span" style=3D"white-space: pre;">	</span>: "=3Dr" (num_result)<br cl=
ass=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	</spa=
n><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>: "r" =
(num_result), "r" (__arg1)<br class=3D"">-<span class=3D"Apple-tab-span" st=
yle=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" style=3D"w=
hite-space: pre;">	</span>: "memory");<br class=3D"">+<span class=3D"Apple-=
tab-span" style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span=
" style=3D"white-space: pre;">	</span>: "+r" (num_result), "+r" (__arg1)<br=
 class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	</=
span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>:<b=
r class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	<=
/span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>: =
"memory", JAILHOUSE_CALL_ARG2, JAILHOUSE_CALL_CLOBBERED);<br class=3D"">&nb=
sp;<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>retur=
n num_result;<br class=3D"">&nbsp;}<br class=3D"">&nbsp;@@ -81,9 +83,9 @@ s=
tatic inline __u64 jailhouse_call_arg2(__u64 num, __u64 arg1, __u64 arg2)<b=
r class=3D"">&nbsp;&nbsp;&nbsp;<span class=3D"Apple-tab-span" style=3D"whit=
e-space: pre;">	</span>asm volatile(<br class=3D"">&nbsp;<span class=3D"App=
le-tab-span" style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-s=
pan" style=3D"white-space: pre;">	</span>JAILHOUSE_CALL_INS<br class=3D"">-=
<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span cl=
ass=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>: "=3Dr" (num_re=
sult)<br class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: p=
re;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	</=
span>: "r" (num_result), "r" (__arg1), "r" (__arg2)<br class=3D"">-<span cl=
ass=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span class=3D"A=
pple-tab-span" style=3D"white-space: pre;">	</span>: "memory");<br class=3D=
"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><spa=
n class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>: "+r" (num_=
result), "+r" (__arg1), "+r" (__arg2)<br class=3D"">+<span class=3D"Apple-t=
ab-span" style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span"=
 style=3D"white-space: pre;">	</span>:<br class=3D"">+<span class=3D"Apple-=
tab-span" style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span=
" style=3D"white-space: pre;">	</span>: "memory", JAILHOUSE_CALL_CLOBBERED)=
;<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>return num_result;<br class=3D"">&nbsp;}<br class=3D"">&nbsp;=
<br class=3D""></blockquote></div></blockquote></div><br class=3D""></body>=
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/A808F818-919F-413D-8849-1BAEBFF54C40%40gmx.de?utm_=
medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailh=
ouse-dev/A808F818-919F-413D-8849-1BAEBFF54C40%40gmx.de</a>.<br />

--Apple-Mail=_49A56F20-2C24-4BB2-BA9A-C5594952D833--
