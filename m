Return-Path: <jailhouse-dev+bncBDB3VRMVXIPRBFFZTONAMGQEH2RUJPY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 395965FC85E
	for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Oct 2022 17:26:13 +0200 (CEST)
Received: by mail-wm1-x33a.google.com with SMTP id k38-20020a05600c1ca600b003b49a809168sf1283071wms.5
        for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Oct 2022 08:26:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1665588372; cv=pass;
        d=google.com; s=arc-20160816;
        b=m3KK1cR/ddt72EtGg1t3SQzgQN7audEQ/rwiX2imvc/PXTVqgaS5jZp2g67NwXZkcK
         CRwpMGnrSSdW0x51Vqw9V3c9Sb86/4n3U/TmFXIv8BT23CznhlDuVfHhT/w6n9Zu9IDD
         K6PdNYN+Aguf05X7W69D5ifwc9OrtLKHxQ3r3OeWif7YaDUtYL5EnvPogP5m8yIIsaXv
         sqFN+p8auVAatdsU37D9JIUj7HDBe9y4XePTXzCJ5Ri3s0tUuL8N7jI0sVeWGAQfS+7D
         9JgHKbCJeYL7MotgI/8uIXfZ01mJyQduEnHWbFzic19B0/OHpyn6K2E/9HWaDpTDM7Ab
         Fzag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:in-reply-to:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:dkim-signature;
        bh=d8dQA7LHDGmwtSLNt1WswcvFGXc8gkLP+m7UAeniRZo=;
        b=m//yGnzP+3hSvDji5lPEjCxPHQzH2WknTIp/eqNJSGoSGeZjSVqm9SLfstpxOjMz32
         RHZOpy+dgsxoHkzR1F6eBXwWTvmX4LaV2GPASdlyepLK1kT3+w02+ZsA0j5b1ySDJYwn
         4tyahwLoQ/o+MUvTB1Bxwo7c79LLptoELh2dmSvnrPx0zQTIuadi5rEQylcIXt7HGDAU
         6LGdzF1eOCuijAyxCEKCqCIS31oEGCysxPeubTlADRq/DRS2XIFBP9n+4vsWJIKZDpOt
         1zUPLs7lW7/xqT9SBsFKDkIZkMQleEIB/uk/IDHUmKKPNutu7dSR4g9acFHs7ritt1no
         Igig==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@suse.com header.s=susede1 header.b=PTiQWe3U;
       spf=pass (google.com: domain of jgross@suse.com designates 195.135.220.28 as permitted sender) smtp.mailfrom=jgross@suse.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=suse.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to
         :x-original-authentication-results:x-original-sender:in-reply-to
         :from:references:cc:to:content-language:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d8dQA7LHDGmwtSLNt1WswcvFGXc8gkLP+m7UAeniRZo=;
        b=Awmj24peYmOXzApNNMLvfcSOUj/kZ7W/lAp852lRqmmxGsSNqxqVi5YPOhOJ38d/PM
         ltY5o8fAmDOb1P1FB763Vi9DxS3O2HbZrXW8WoChfi6dlaCRSqSWsLUrlW3ULpsR0ljb
         PPQsowp5VdUSvZJGRdv/lm6fowci1KWBjPe68yl5aK4rDlaCgnyb3jr3fV6+sfnD3jUF
         ZW3sdHbAe4JwVGCfCs3OMql/K52wH3wnhz6db4PoAXhmDs21sPaxclhgyFX542k0Bvu3
         XCFG6Q7hoMKHyc9vIqWoRHkSWMMrHzhdUXN++AsJwbS/BXA/mVrx0J/YTTBegkmjRmYm
         TYMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence:reply-to
         :x-original-authentication-results:x-original-sender:in-reply-to
         :from:references:cc:to:content-language:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=d8dQA7LHDGmwtSLNt1WswcvFGXc8gkLP+m7UAeniRZo=;
        b=NvUxkFyxnCwNtKTWIrxgQRdtC8Oxss1wh/Po6MaSntjoM07bMxDgx251eb85cCQMxK
         SvZnhFLm2SekG7yLuA2njKZokQUwVfz+TqD89k7QZhdxGCD1W/KxkNSK9SGAn1v8MDl0
         8QdDGAUnQfmvN+PkONQ9Ci42Z+6/8aGIXIr8Du+82FTD86ayWy687Fb0oFUf+Dl8rPPk
         hKbX3Lu5bB7oYdSVmhUaj+z7mASTzBTWSZYCf8CvXpyfbsBfxZSrCX0z7ypeRj7Lju4J
         av6TSaW2sK31E7FcBUFEd4wZSgUt05rvwW0tDmI09vL0WoI+hr+cEOaMAoY/N5K7IJoX
         fB+Q==
X-Gm-Message-State: ACrzQf1pvbePij6YhKBismYQ5ZuTj+brZo1rZAYQBowcgENAQOpYc2BW
	J8dU00D3bsQ2J7qI/U6AgnQ=
X-Google-Smtp-Source: AMsMyM7/b0BoDoShw6Gw1jF9qjY8ZXX+qqNQg0isYY9X7HHukh+51lUOwzxxoxsHnAjNvrZAryn8CQ==
X-Received: by 2002:a05:600c:a46:b0:3b9:9b97:9304 with SMTP id c6-20020a05600c0a4600b003b99b979304mr3172187wmq.34.1665588372553;
        Wed, 12 Oct 2022 08:26:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c458:0:b0:3c6:c1ff:1fd with SMTP id l24-20020a7bc458000000b003c6c1ff01fdls1168582wmi.2.-pod-canary-gmail;
 Wed, 12 Oct 2022 08:26:11 -0700 (PDT)
X-Received: by 2002:a05:600c:548a:b0:3c6:b8c5:ba49 with SMTP id iv10-20020a05600c548a00b003c6b8c5ba49mr3105237wmb.178.1665588371120;
        Wed, 12 Oct 2022 08:26:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665588371; cv=none;
        d=google.com; s=arc-20160816;
        b=MrvrCAfZmOJslsVxlsGC8KeBWPhF6EU1V1pMqg7PCws3Tr0X+lqzt+1hqVNq70y7rz
         K/N+nawApnU3dl/udOhey8I5mFoswiP1BkF/QUTF9iexKDFzLgZalTSciYrIOkRgpTOG
         0584nwkPEHEUxGXKGHdORli8K24IzBmWufgwenLAm6OOGTd7P50jMhLU32aJKhVCjEm0
         ET93wZkCEHEXolmIearFY3XQmTTjOqeUcU+P91Cl+P9pSvvn+/XuVLbADYrEnJ8bQjKX
         Mype2/sW2XUVULOXup8xTlYpXiNjcS4nPmQ8QUaKBBrrA6ZfvPmGgJdNeGGdp6vAxSDh
         4gyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=W22no4UHHSLq7kZ7HGvm7b6REa1W65pcxdWLEl8piKk=;
        b=K/FatgyL0g2wOOtKAY/iUOnjDSKi7urZO2Uq0a/1dWzBdXBeoLAU3hUzPuDGKyKYJZ
         iMlwM7UBpBW1w+ob/DxSYu92oWPbBoIzBtg5D7ojplwJ7DuoG122IRzKg7kswHfuaJjo
         u+x6WkTR2u0WF1WDC6MT43CkY5J72JFRizRFq0ztLTofheK3tFgZw9my84m7g62DHYxB
         LgfrB0x9qR3t8vzhGSwxSFfezOeicRWhFCOrSQ+FFTViZLYo5190aXRRKRlmAjwDHKhK
         7PJHycANfoDLNY55hEBaySAEHmzVHwLkV57tGAvIbc/Ro07i9DaCo3cCeX4gUvCbvZtZ
         M9lg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@suse.com header.s=susede1 header.b=PTiQWe3U;
       spf=pass (google.com: domain of jgross@suse.com designates 195.135.220.28 as permitted sender) smtp.mailfrom=jgross@suse.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=suse.com
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by gmr-mx.google.com with ESMTPS id d14-20020a05600c3ace00b003c46c479be1si183567wms.0.2022.10.12.08.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 08:26:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of jgross@suse.com designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B422221C52;
	Wed, 12 Oct 2022 15:26:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 384FE13ACD;
	Wed, 12 Oct 2022 15:26:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id oA0CDJLcRmMMQQAAMHmgww
	(envelope-from <jgross@suse.com>); Wed, 12 Oct 2022 15:26:10 +0000
Message-ID: <9fcdf79b-8956-b976-704a-3018542cc557@suse.com>
Date: Wed, 12 Oct 2022 17:26:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/2] x86: Check return values from early_memremap calls
Content-Language: en-US
To: Ross Philipson <ross.philipson@oracle.com>, Borislav Petkov <bp@alien8.de>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 dpsmith@apertussolutions.com, tglx@linutronix.de, mingo@redhat.com,
 hpa@zytor.com, luto@amacapital.net, dave.hansen@linux.intel.com,
 kanth.ghatraju@oracle.com, trenchboot-devel@googlegroups.com,
 Jan Kiszka <jan.kiszka@siemens.com>, jailhouse-dev@googlegroups.com,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <1650035401-22855-1-git-send-email-ross.philipson@oracle.com>
 <1650035401-22855-2-git-send-email-ross.philipson@oracle.com>
 <Y0GTUg1ACpKZYMHY@nazgul.tnic>
 <201850b3-5126-cd79-637f-79f198dd409d@oracle.com>
From: "'Juergen Gross' via Jailhouse" <jailhouse-dev@googlegroups.com>
In-Reply-To: <201850b3-5126-cd79-637f-79f198dd409d@oracle.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0IevKUioMcP602uAHkVuaiL3"
X-Original-Sender: jgross@suse.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@suse.com header.s=susede1 header.b=PTiQWe3U;       spf=pass
 (google.com: domain of jgross@suse.com designates 195.135.220.28 as permitted
 sender) smtp.mailfrom=jgross@suse.com;       dmarc=pass (p=QUARANTINE
 sp=QUARANTINE dis=NONE) header.from=suse.com
X-Original-From: Juergen Gross <jgross@suse.com>
Reply-To: Juergen Gross <jgross@suse.com>
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0IevKUioMcP602uAHkVuaiL3
Content-Type: multipart/mixed; boundary="------------oasnLHEdbuwWbRHotwxlosfR";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Ross Philipson <ross.philipson@oracle.com>, Borislav Petkov <bp@alien8.de>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 dpsmith@apertussolutions.com, tglx@linutronix.de, mingo@redhat.com,
 hpa@zytor.com, luto@amacapital.net, dave.hansen@linux.intel.com,
 kanth.ghatraju@oracle.com, trenchboot-devel@googlegroups.com,
 Jan Kiszka <jan.kiszka@siemens.com>, jailhouse-dev@googlegroups.com,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <9fcdf79b-8956-b976-704a-3018542cc557@suse.com>
Subject: Re: [PATCH 1/2] x86: Check return values from early_memremap calls
References: <1650035401-22855-1-git-send-email-ross.philipson@oracle.com>
 <1650035401-22855-2-git-send-email-ross.philipson@oracle.com>
 <Y0GTUg1ACpKZYMHY@nazgul.tnic>
 <201850b3-5126-cd79-637f-79f198dd409d@oracle.com>
In-Reply-To: <201850b3-5126-cd79-637f-79f198dd409d@oracle.com>

--------------oasnLHEdbuwWbRHotwxlosfR
Content-Type: multipart/mixed; boundary="------------3wZ5tZFbtS6PNsirNBDZ207T"

--------------3wZ5tZFbtS6PNsirNBDZ207T
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 12.10.22 17:13, Ross Philipson wrote:
> On 10/8/22 11:12, Borislav Petkov wrote:
>> Adding Xen and Jailhouse people and MLs to Cc.
>>
>> Folks, thread starts here:
>>
>> https://lore.kernel.org/r/1650035401-22855-1-git-send-email-ross.philips=
on@oracle.com
>>
>> On Fri, Apr 15, 2022 at 11:10:00AM -0400, Ross Philipson wrote:
>>> There are a number of places where early_memremap is called
>>> but the return pointer is not checked for NULL. The call
>>> can result in a NULL being returned so the checks must
>>> be added.
>>>
>>> Signed-off-by: Ross Philipson <ross.philipson@oracle.com>
>>> ---
>>> =C2=A0 arch/x86/kernel/devicetree.c | 10 ++++++++++
>>> =C2=A0 arch/x86/kernel/e820.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 5 +++++
>>> =C2=A0 arch/x86/kernel/jailhouse.c=C2=A0 |=C2=A0 6 ++++++
>>> =C2=A0 arch/x86/kernel/mpparse.c=C2=A0=C2=A0=C2=A0 | 23 +++++++++++++++=
++++++++
>>> =C2=A0 arch/x86/kernel/setup.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 =
+++++
>>> =C2=A0 arch/x86/xen/enlighten_hvm.c |=C2=A0 2 ++
>>> =C2=A0 arch/x86/xen/mmu_pv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 8 ++++++++
>>> =C2=A0 arch/x86/xen/setup.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 2 ++
>>> =C2=A0 8 files changed, 61 insertions(+)
>>
>> Ok, a couple of notes:
>>
>> 1. the pr_*("<prefix>:" ... )
>>
>> thing is done using pr_fmt() - grep the tree for examples.
>=20
> I am already using the pr_* macros in the patches. Are you asking me to d=
o=20
> something or is this just informational?
>=20
>>
>> 2. I think you should not panic() the machine but issue a the
>> warning/error and let the machine die a painful death anyway. But Xen
>> folks will know better what would be the optimal thing to do.
>=20
> When I was working on the patches I asked Andrew Cooper at Citrix what ac=
tion I=20
> should take if any of the calls in the Xen code failed. I believe he told=
 me it=20
> was basically fatal and that panic() would be fine there.

panic() is the way to go. Everything else would make the error harder
to analyze.

BTW, CC-ing the maintainers of the modified code is good practice.


Juergen

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/9fcdf79b-8956-b976-704a-3018542cc557%40suse.com.

--------------3wZ5tZFbtS6PNsirNBDZ207T
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------3wZ5tZFbtS6PNsirNBDZ207T--

--------------oasnLHEdbuwWbRHotwxlosfR--

--------------0IevKUioMcP602uAHkVuaiL3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmNG3JEFAwAAAAAACgkQsN6d1ii/Ey/k
lgf+IDHKz+H4WUZuhhBLYi/ie36DnrSYs3Q85onru8DhPm/nkXNghvChcB6XlT7+MJjrdZlkJQap
+WEVoJXXUDDuR+ngE9Ewn2Ua+XApqTW8YfvCz64rpgP1N8sksRf7rfb66/KNlHnmtwLnmVgnNFba
EK4PEjMXBt2k70dNlLxEY7Z03RCahwo/q60L9cHBcRE66uopoKx+COv/HWFeduP8RgZfPA8W3aFb
Rp3/sotWNLIy/oFvPpo/ILyJifzUUnWWn9/l+GyU2oFXsIHYG7F21mbpQfiGK3YUX2LzGILc2JhT
ax7ux5jmcS421T6ek9ozk5lML3l3+Ev38Idr4gUykQ==
=54GQ
-----END PGP SIGNATURE-----

--------------0IevKUioMcP602uAHkVuaiL3--
